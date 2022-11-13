# 迷宫更新操作手册

为进一步增加实验的乐趣，现在对迷宫地图做一些更新，更新步骤如下：

1.下载**pokemon_maze_plugin**.zip,解压到**pokemon_ws/src**下。（相当与在src下增加了一个pokemon_maze_plugin包）
2. 删除之前拷贝到 `~/.gazebo/models`下的所有 pokemon模型，重新拷贝 pokemon_maze_plugin/models/文件夹下的所有 pokemon模型到 `~/.gazebo/models`

3.修改pokemon_ws/src/pokemon_simulator/launch/pokemon_maze.launch中的**pokemon_simulator/worlds/pokemon_maze_cs405.world**为**pokemon_maze_plugin\worlds\pokemon_maze_cs405_animate.world**
