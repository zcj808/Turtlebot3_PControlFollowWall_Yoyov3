#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rospy
import math
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
import time

LINEAR_VEL = 0.22
STOP_DISTANCE = 0.2
LIDAR_ERROR = 0.05
SAFE_STOP_DISTANCE = STOP_DISTANCE + LIDAR_ERROR

class Obstacle():
    def __init__(self):
        self._cmd_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=1)
        self.obstacle()
    
    ## 处理雷达数据，按左右排序，修正Inf和nan数据
    def get_scan(self):
        scan = rospy.wait_for_message('/scan', LaserScan)
        scan_filter = []
        scan_filter = list(scan.ranges)

        for i in range(len(scan_filter)):
            if scan_filter[i] == float('inf'):
                scan_filter[i] = 3.5
            elif math.isnan(scan_filter[i]):
                scan_filter[i] = 0

        return scan_filter

    def obstacle(self):
        twist = Twist()
        turtlebot_moving = True

        while True:
            # print('start')
            lidar_distances = self.get_scan()
            # print('over')
            min_distance = min(lidar_distances)

            if min_distance < SAFE_STOP_DISTANCE:
                if turtlebot_moving:
                    twist.linear.x = 0.0
                    twist.angular.z = 0.0
                    self._cmd_pub.publish(twist)
                    turtlebot_moving = False
                    rospy.loginfo("Stop!")

            else:
                twist.linear.x = LINEAR_VEL
                twist.angular.z = 0.0
                self._cmd_pub.publish(twist)
                turtlebot_moving = True
                rospy.loginfo('Distance of the obstacle : %f' ,min_distance)
            time.sleep(0.05)

def main():
    rospy.init_node('smartcar_obstacle')
    try:
        Obstacle()
    except rospy.ROSInterruptException:
        pass
    

if __name__=='__main__':
    main()