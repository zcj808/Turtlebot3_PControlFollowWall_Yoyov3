#! /usr/bin/env python

import rospy
import numpy as np
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
import time 

def callback_laser(msg):
    global min_list
    laser_range = np.array(msg.ranges)
    print("right distance: {}".format(min(laser_range[240:300])))
    # print("front distance: {}".format(min(np.hstack((laser_range[0:20], laser_range[340:360])))))
    min_disance = {
        'front': min(np.hstack((laser_range[0:5], laser_range[355:360]))),
        'right': min(laser_range[240:300]),
    }
    detect_right_value = min(laser_range[320:330])
    min_right_distance_index = np.argmin(laser_range[240:300])
    # average filter
    min_list.append(min_right_distance_index)
    total_min_value = 0
    if len(min_list) > 10:
        del min_list[0]
        # print("after delete, len: {}".format(min_list))
    for min_value in min_list:
        total_min_value += min_value
    min_right_distance_index = total_min_value/len(min_list)
    req_distance = 0.3

    # right distance p control
    p_dis = 1.7
    dis_error = req_distance - min_disance['right']
    # if abs(dis_error) > 0.4:
    #     if dis_error > 0:
    #         dis_error = 0.2
    #     else:
    #         dis_error = -0.2
    # right wall will disappear and turn right
    if abs(req_distance - detect_right_value) > 0.3:
        dis_error = -0.3

    w_dis = p_dis*dis_error
    print("w_dis: {}".format(w_dis))

    # right rotation p control
    p_rot = 0.007
    rot_error = min_right_distance_index - 30
    w_rot = p_rot*rot_error
    print("w_rot: {}".format(w_rot))
    print("min_right_distance_index: {}".format(min_right_distance_index))

    # left rotation p control
    p_left_rot = 3.5
    w_left_rot = 0.0
    req_front_distance = 0.6
    if min_disance['front'] < req_front_distance:
        w_left_rot = p_left_rot*(req_front_distance - min_disance['front'])
    print("front distance: {}".format(min(np.hstack((laser_range[0:5], laser_range[355:360])))))
    print("w_left_rot: {}".format(w_left_rot))

    # pub modified velocity
    modi_vel = Twist()
    modi_vel.linear.x = 0.2
    modi_vel.angular.z = w_dis + w_rot + w_left_rot
    pub.publish(modi_vel)
    rate.sleep()
    
if __name__ == "__main__":
    rospy.init_node('follow_wall')
    pub = rospy.Publisher("tb3_2/cmd_vel", Twist, queue_size=10)
    rate = rospy.Rate(10)
    min_list = []
    rospy.Subscriber('tb3_2/scan', LaserScan, callback_laser)
    rospy.spin()