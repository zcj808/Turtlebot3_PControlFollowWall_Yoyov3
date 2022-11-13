#!/usr/bin/env python
# -*- coding: utf-8 -*-
# from winreg import REG_NOTIFY_CHANGE_SECURITY
import rospy, time
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
def scan_callback(msg):
    # print("enter in callback")
    global range_front
    global range_back
    global range_right
    global range_left
    global ranges
    global min_front, i_front, min_back, i_back, min_right, i_right, min_left, i_left
    global my_scan
    my_scan = msg
    ranges = msg.ranges

    # 雷达数组的index表示了当前扫描角度
    # range_front[:10] = msg.ranges[:10]
    # range_front[10:] = msg.ranges[-1:-10:-1]
    # range_front = msg.ranges[340:350]
    # range_front = msg.ranges[10:0:-1]+msg.ranges[-1:-10:-1]+msg.ranges[27:37]+msg.ranges[323:333]   # 正前方+左右角点
    range_front = msg.ranges[10:0:-1]+msg.ranges[-1:-10:-1]
    range_back = msg.ranges[175:185]
    range_right = msg.ranges[265:275]
    range_left = msg.ranges[85:95]
    min_range, i_range = min((ranges[i_range], i_range) for i_range in range(len(ranges)))  # 返回ranges里面最小的数和对应的index
    min_front, i_front = min((range_front[i_front], i_front) for i_front in range(len(range_front)))
    min_back, i_back = min((range_back[i_back], i_back) for i_back in range(len(range_back)))
    min_right, i_right = min((range_right[i_right], i_right) for i_right in range(len(range_right)))
    min_left, i_left = min((range_left[i_left], i_left) for i_left in range(len(range_left)))

range_front = []
range_back = []
range_right = []
range_left = []
min_front = 0
i_front = 0
min_back = 0
i_back = 0
min_right = 0
i_right = 0
min_left = 0
i_left = 0
my_scan = LaserScan()
rospy.init_node('smartcar_explorer')
cmd_vel_pub = rospy.Publisher('cmd_vel', Twist, queue_size = 1)
my_scan_pub = rospy.Publisher('my_scan', LaserScan, queue_size = 1)
scan_sub = rospy.Subscriber('scan', LaserScan, scan_callback)


command = Twist()
command.linear.x = 0.0
command.angular.z = 0.0
rate = rospy.Rate(5)
time.sleep(1)


near_wall = 0
print('Turning...')
# cur_z = 0  # 保证转弯方向连续性
while not rospy.is_shutdown():
    print('right: '+str(min_right))
    print('left: '+str(min_left))
    print('forward: '+str(min_front))
    print('back: '+str(min_back))
    # 正常直线行走和偏正
    if(min_front > 0.35 and min_left > 0.25 and min_right > 0.25 and min_left/min_right < 2 and min_right/min_left < 2):
        print("move forward")   
        command.linear.x = 0.15
    elif(min_left < 0.25):
        print("adjust to right")
        command.linear.x = 0.05
        command.angular.z = -1.6
    elif(min_right < 0.25):
        print("adjust to left")
        command.linear.x = 0.05
        command.angular.z = 1.6
    else:  # 转弯的情况
        if(min_front < 0.35):  # 防止碰撞
            print("too close")
            command.linear.x = 0.0
            if(cur_z > 0):
                command.angular.z = 1.5
            else:
                command.angular.z = -1.5
        elif(min_left/min_right > 2 ):  # 优先左传
            print("turn left")
            command.linear.x = 0.05
            command.angular.z = 1.8
            cur_z = command.angular.z
        elif(min_right/min_left > 2):  # 优先右转
            print("turn right")
            command.linear.x = 0.05
            command.angular.z = -1.8
            cur_z = command.angular.z
        # else:  # 其他情况的转弯调整
        #     print("other adjust")
        #     command.linear.x = 0.0
        #     if(cur_z > 0):
        #         command.angular.z = 1.5
        #     else:
        #         command.angular.z = -1.5
    cmd_vel_pub.publish(command)
    rate.sleep()

    # while(near_wall==0 and not rospy.is_shutdown()):
    #     # print("Moving towards a wall")
    #     if(min_front > 0.2 and min_right > 0.2 and min_left > 0.2):
    #         command.angular.z = -0.1
    #         command.linear.x = 0.15
    #         print("C")
    #     elif(min_left<0.2):
    #         near_wall = 1
    #         print("A")
    #     else:
    #         command.angular.z = -0.25
    #         command.linear.x = 0.0
    #     # my_scan_pub.publish(my_scan)
    #     cmd_vel_pub.publish(command)
    # else:
    #     if(min_front > 1.5):
    #         if(min_left < 0.5):
    #             print("Range: {:.2f}m - Too close. Backing up.".format(min_left))
    #             command.angular.z = -1.2
    #             command.linear.x = -0.1
    #         elif(min_left > 0.8):
    #             print("Range: {:.2f}m - Wall-following; turn left.".format(min_left))
    #             command.angular.z = 1.2
    #             command.linear.x = 0.15
    #         else:
    #             print("Range: {:.2f}m - Wall-following; turn right.".format(min_left))
    #             command.angular.z = -1.2
    #             command.linear.x = 0.15
    #     else:
    #         print("Front obstacle detected. Turning away.")
    #         command.angular.z = -1.0
    #         command.linear.x = 0.0
    #         # my_scan_pub.publish(my_scan)
    #         cmd_vel_pub.publish(command)
    #         while(min_front < 0.3 and not rospy.is_shutdown()):
    #             pass
    #     my_scan_pub.publish(my_scan)
    # cmd_vel_pub.publish(command)
    # my_scan_pub.publish(my_scan)
    