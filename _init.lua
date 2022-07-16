
local lib_dir = gh_utils.get_lib_dir() 		
dofile(lib_dir .. "lua/imgui.lua")    
dofile(lib_dir .. "lua/keyboard_codes.lua")
dofile(lib_dir .. "lua/imgui.lua")    




winW, winH = gh_window.getsize(0)
g_quad = gh_mesh.create_quad(winW, winH)


g_camera_ortho = gh_camera.create_ortho(-winW/2, winW/2, -winH/2, winH/2, 1.0, 10.0)
gh_camera.set_viewport(g_camera_ortho, 0, 0, winW, winH)
gh_camera.set_position(g_camera_ortho, 0, 0, 4)


shadertoy_prog = gh_node.getid("shadertoy_prog")

frame_counter = 0

dt = 0
elapsed_time = 0
last_time = 0
time_step = 0
mx = 0
my = 0
mz = 0
frame = 0
is_key_down = 0
do_animation = 1
display_info = 1

fps_time = 0
fps = 0
frames = 0

is_gui_hovered = false
mx = 0
my = 0
mz = 0


vsync = 0
gh_renderer.vsync(vsync)


gl_renderer = gh_renderer.get_renderer_model()
gl_version = gh_renderer.get_api_version()

app_version={major=0, minor=0, patch=0, build=0}
app_version.major, app_version.minor, app_version.patch, app_version.build = gh_utils.get_app_version()
app_version_str = string.format("%d.%d.%d.%d", app_version.major, app_version.minor, app_version.patch, app_version.build)



num_gpus = 0
gpumon_elapsed_time = 0
gpumon_last_time = 0

local platform_windows = 1 
--local platform_osx = 2 
--local platform_linux = 3 
--local platform_rpi = 4 
if (gh_utils.get_platform() == platform_windows) then
  num_gpus = gh_gml.get_num_gpus()
end




