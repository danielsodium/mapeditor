if (live_call()) return live_result;

// Drag to move
if (mouse_check_button_pressed(mb_middle) || keyboard_check_pressed(ord("E"))) {
    startX = x;
    startY = y;
    dragX = device_mouse_x_to_gui(0);
    dragY = device_mouse_y_to_gui(0);
}

if (mouse_check_button(mb_middle) || keyboard_check(ord("E"))) {
    x = startX + (dragX - device_mouse_x_to_gui(0))*zoom_level;
    y = startY + (dragY - device_mouse_y_to_gui(0))*zoom_level;
    camera_set_view_pos(cam, x, y);
}

// Scroll zoom
//this is cahnges the zoom based on scolling but you can set it how ever you like
zoom_level = clamp(zoom_level + (((mouse_wheel_down() - mouse_wheel_up())) * 0.1), 0.1, 2);

//Get current size
var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);

//Set the rate of interpolation
var rate = 0.2;

//Get new sizes by interpolating current and target zoomed size
var new_w = lerp(view_w, zoom_level * zoomW, rate);
var new_h = lerp(view_h, zoom_level * zoomH, rate);

//Apply the new size
camera_set_view_size(view_camera[0], new_w, new_h);

//change coordinates of camera so zoom is centered
x = lerp(x,x+(view_w - zoom_level * zoomW)/2, rate);
y = lerp(y,y+(view_h - zoom_level * zoomH)/2, rate);
camera_set_view_pos(cam, x, y);
