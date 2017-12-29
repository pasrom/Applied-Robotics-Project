 #!/bin/bash

rosrun image_transport republish compressed in:=/camera/image_raw raw out:=/camera/camera_eigen &
