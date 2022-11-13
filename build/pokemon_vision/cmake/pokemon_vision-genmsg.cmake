# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "pokemon_vision: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ipokemon_vision:/home/zcj/pokemon_ws/src/pokemon_vision/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(pokemon_vision_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zcj/pokemon_ws/src/pokemon_vision/msg/MyImage.msg" NAME_WE)
add_custom_target(_pokemon_vision_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pokemon_vision" "/home/zcj/pokemon_ws/src/pokemon_vision/msg/MyImage.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(pokemon_vision
  "/home/zcj/pokemon_ws/src/pokemon_vision/msg/MyImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pokemon_vision
)

### Generating Services

### Generating Module File
_generate_module_cpp(pokemon_vision
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pokemon_vision
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(pokemon_vision_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(pokemon_vision_generate_messages pokemon_vision_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zcj/pokemon_ws/src/pokemon_vision/msg/MyImage.msg" NAME_WE)
add_dependencies(pokemon_vision_generate_messages_cpp _pokemon_vision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pokemon_vision_gencpp)
add_dependencies(pokemon_vision_gencpp pokemon_vision_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pokemon_vision_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(pokemon_vision
  "/home/zcj/pokemon_ws/src/pokemon_vision/msg/MyImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pokemon_vision
)

### Generating Services

### Generating Module File
_generate_module_eus(pokemon_vision
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pokemon_vision
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(pokemon_vision_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(pokemon_vision_generate_messages pokemon_vision_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zcj/pokemon_ws/src/pokemon_vision/msg/MyImage.msg" NAME_WE)
add_dependencies(pokemon_vision_generate_messages_eus _pokemon_vision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pokemon_vision_geneus)
add_dependencies(pokemon_vision_geneus pokemon_vision_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pokemon_vision_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(pokemon_vision
  "/home/zcj/pokemon_ws/src/pokemon_vision/msg/MyImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pokemon_vision
)

### Generating Services

### Generating Module File
_generate_module_lisp(pokemon_vision
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pokemon_vision
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(pokemon_vision_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(pokemon_vision_generate_messages pokemon_vision_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zcj/pokemon_ws/src/pokemon_vision/msg/MyImage.msg" NAME_WE)
add_dependencies(pokemon_vision_generate_messages_lisp _pokemon_vision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pokemon_vision_genlisp)
add_dependencies(pokemon_vision_genlisp pokemon_vision_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pokemon_vision_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(pokemon_vision
  "/home/zcj/pokemon_ws/src/pokemon_vision/msg/MyImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pokemon_vision
)

### Generating Services

### Generating Module File
_generate_module_nodejs(pokemon_vision
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pokemon_vision
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(pokemon_vision_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(pokemon_vision_generate_messages pokemon_vision_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zcj/pokemon_ws/src/pokemon_vision/msg/MyImage.msg" NAME_WE)
add_dependencies(pokemon_vision_generate_messages_nodejs _pokemon_vision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pokemon_vision_gennodejs)
add_dependencies(pokemon_vision_gennodejs pokemon_vision_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pokemon_vision_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(pokemon_vision
  "/home/zcj/pokemon_ws/src/pokemon_vision/msg/MyImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pokemon_vision
)

### Generating Services

### Generating Module File
_generate_module_py(pokemon_vision
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pokemon_vision
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(pokemon_vision_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(pokemon_vision_generate_messages pokemon_vision_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zcj/pokemon_ws/src/pokemon_vision/msg/MyImage.msg" NAME_WE)
add_dependencies(pokemon_vision_generate_messages_py _pokemon_vision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pokemon_vision_genpy)
add_dependencies(pokemon_vision_genpy pokemon_vision_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pokemon_vision_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pokemon_vision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pokemon_vision
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(pokemon_vision_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(pokemon_vision_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pokemon_vision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pokemon_vision
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(pokemon_vision_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(pokemon_vision_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pokemon_vision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pokemon_vision
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(pokemon_vision_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(pokemon_vision_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pokemon_vision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pokemon_vision
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(pokemon_vision_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(pokemon_vision_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pokemon_vision)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pokemon_vision\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pokemon_vision
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(pokemon_vision_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(pokemon_vision_generate_messages_py sensor_msgs_generate_messages_py)
endif()
