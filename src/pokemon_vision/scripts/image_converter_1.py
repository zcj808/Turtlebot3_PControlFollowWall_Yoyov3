#!/usr/bin/env python
#!coding=utf-8
 
import rospy
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from darknet_ros_msgs.msg import BoundingBoxes
import message_filters  # 导入message_filters包 消息过滤器
import cv2

bridge = CvBridge()
save_image_path  = '/home/cloud/pokemon_ws/src/pokemon_vision/pokemon_images'
 
def callback(img_msg, box_msg):
    print("callback for tb3_1")
    # cv_img = bridge.imgmsg_to_cv2(img_msg, "rgb8")
    # print(cv_img[0][0])
    # cv2.imshow("frame" , cv_img)
    # cv2.waitKey(1)
    global bridge
    boxes_list = box_msg.bounding_boxes
    if len(boxes_list) > 1:
        cv_img = bridge.imgmsg_to_cv2(img_msg, "bgr8")
        rec_img = cv2.rectangle(cv_img, (int(boxes_list[0].xmin), int(boxes_list[0].ymin)), (int(boxes_list[0].xmax), int(boxes_list[0].ymax)), (0, 255, 0), 2)
        rec_img = cv2.rectangle(rec_img, (int(boxes_list[1].xmin), int(boxes_list[1].ymin)), (int(boxes_list[1].xmax), int(boxes_list[1].ymax)), (0, 0, 255), 2)
        timestr = "%.1f" %  img_msg.header.stamp.to_sec()
                #%.6f表示小数点后带有6位，可根据精确度需要修改；
        image_name = "/tb3_1" + timestr + ".jpg" #图像命名：时间戳.jpg
        cv2.imwrite(save_image_path + image_name, rec_img)  #保存；
        print("save tb3_1 successfully!")
        # cv2.imshow("frame" , cv_img)
        # cv2.waitKey(3)
 
if __name__ == '__main__':
    rospy.init_node('save_pokemon', anonymous=True)
    sub_image = message_filters.Subscriber("/tb3_1/camera/image", Image)
    sub_box = message_filters.Subscriber("tb3_1/darknet_ros/bounding_boxes", BoundingBoxes)
    # 设置时间同步器 fs等待消息[sub_image, camera_info_sub]，queue_size 10
    print("wait for tb3_1...")
    sync_listener = message_filters.TimeSynchronizer([sub_image, sub_box], 50)
    # 设置回调函数
    sync_listener.registerCallback(callback)
    rospy.spin()