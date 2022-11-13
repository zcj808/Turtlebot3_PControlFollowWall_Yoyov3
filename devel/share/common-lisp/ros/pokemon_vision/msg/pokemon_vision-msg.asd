
(cl:in-package :asdf)

(defsystem "pokemon_vision-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "MyImage" :depends-on ("_package_MyImage"))
    (:file "_package_MyImage" :depends-on ("_package"))
  ))