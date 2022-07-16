




--[[
if (display_imgui_params) then
  imgui_frame_begin()
  local is_open = imgui_window_begin_pos_size_once("Shadertoy params", 300, 200, 20, 20)
  if (is_open == 1) then
    
    if (_G['ImGuiDemoParams'] ~= nil) then
      ImGuiDemoParams()
    end

  end
  imgui_window_end()
  imgui_frame_end()
end
--]]



frames = frames+1
fps_time = fps_time + dt
if (fps_time >= 1.0) then
  fps_time = 0
  fps = frames
  frames = 0
end  



if (do_animation == 1) then
  --local cur_time = kx_gettime()
  --local dt = kx_getdt()
  time_step = dt
  last_time = elapsed_time
  elapsed_time = elapsed_time + dt
  frame = frame + 1
  frame_counter = frame_counter + 1
else
  time_step = 0
end  


-- gpumon_elapsed_time is always updated.
gpumon_elapsed_time = gpumon_elapsed_time + dt


