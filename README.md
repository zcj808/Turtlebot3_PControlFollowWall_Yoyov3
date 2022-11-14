# Turtlebot3_PControlFollowWall_Yoyov3
This project is a final course project on intelligent robotics at Southern University of Science and Technology (SUSTech) in spring 2022.

This project implements two turtlebot3s walking along a wall inside a maze while recognizing and taking pictures of moving Pokémon attached to the wall. We set the p-controller so that Turtlebot3 can walk along the wall relatively smoothly and smoothly and detect the Pokémon in real time based on the trained Yolov3, and finally the task is completed well, but there may be lag due to running two networks at the same time.
Finally, thanks to my teammate: [yunlong10](https://github.com/yunlong10). And the video was published here: https://www.bilibili.com/video/BV1vP411c7ub?share_source=copy_web.

## System Requirement
- Ubuntu18.04
- ROS Melodic

## Configuration
Assume that you know basic operations concerning workspace compilation and path configuration, etc. And the tutorial is here: http://wiki.ros.org/ROS/Tutorials

## Running the Code
One line command is all you need:
```
roslaunch pokemon_simulator pokemon_maze.launch
```

## Where is the key code?
1. P controller for python is realized in `src/pokemon_simulator/scripts/my_follow_left_wall.py` or `src/pokemon_simulator/scripts/my_follow_right_wall.py`. And its effect is below:
![image](https://github.com/MrZZZZzzzz/Turtlebot3_PControlFollowWall_Yoyov3/blob/main/image8.GIF)
![image](https://github.com/MrZZZZzzzz/Turtlebot3_PControlFollowWall_Yoyov3/blob/main/image9.GIF)
![image](https://github.com/MrZZZZzzzz/Turtlebot3_PControlFollowWall_Yoyov3/blob/main/image10.GIF)
2. Yolov3 is realized in `src/darknet_ros`.

## Enjoy Yourself!
