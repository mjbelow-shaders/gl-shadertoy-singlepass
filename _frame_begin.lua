



--local elapsed_time = kx_gettime()
dt = gh_utils.get_time_step()



local platform_windows = 1 
local platform_osx = 2 
local platform_linux = 3 
if (gh_utils.get_platform() == platform_windows) then
  gh_window.keyboard_update_buffer(0)
end

local KC_SPACE = 57
local KC_I = 23

if (is_key_down==0) then
  if (gh_input.keyboard_is_key_down(KC_SPACE) == 1) then
    is_key_down = 1
    if (do_animation == 1) then
      do_animation = 0
    else
      do_animation = 1
    end
  end
  
  if (gh_input.keyboard_is_key_down(KC_I) == 1) then
    is_key_down = 1
    if (display_info == 1) then
      display_info = 0
    else
      display_info = 1
    end
  end
end  

if (is_key_down==1) then
  if (gh_input.keyboard_is_key_down(KC_SPACE) == 0 and gh_input.keyboard_is_key_down(KC_I) == 0) then
    is_key_down = 0
  end
end  




















if (is_gui_hovered == false) then
  mx, my = gh_input.mouse_get_position()
  my = winH - my
  mz = gh_input.mouse_get_button_state(1)
end




gh_renderer.clear_color_depth_buffers(0.0, 0.0, 0.0, 0.0, 1.0)
gh_renderer.set_depth_test_state(0)

gh_camera.bind(g_camera_ortho)


gh_gpu_program.bind(shadertoy_prog)
gh_gpu_program.uniform3f(shadertoy_prog, "iResolution", winW, winH, 0.0)
gh_gpu_program.uniform1f(shadertoy_prog, "iTime", elapsed_time)
gh_gpu_program.uniform4f(shadertoy_prog, "iMouse", mx, my, mz, 0)
gh_gpu_program.uniform1i(shadertoy_prog, "iFrame", frame_counter)

-- https://www.geeks3d.com/hacklab/20151211/lua-date-and-time-shadertoy-idate/
local timestamp = os.time()
local tmp = os.date("*t", timestamp)
local time_seconds = tmp.hour * 3600 + tmp.min * 60 + tmp.sec
gh_gpu_program.uniform4f(shadertoy_prog, "iDate", tmp.year, tmp.month, tmp.day, time_seconds)




