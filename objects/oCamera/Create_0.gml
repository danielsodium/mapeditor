if (live_call()) return live_result;
cam = view_get_camera(0);
dragX = 0;
dragY = 0;
startX = 0;
startY = 0;

x = camera_get_view_x(cam);
y = camera_get_view_x(cam);

zoom_level = 1;
zoomW = camera_get_view_width(view_camera[0]);
zoomH = camera_get_view_height(view_camera[0]);
