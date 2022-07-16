


winW, winH = gh_window.getsize(0)

gh_camera.update_ortho(g_camera_ortho, -winW/2, winW/2, -winH/2, winH/2, 1.0, 100.0)
gh_camera.set_viewport(g_camera_ortho, 0, 0, winW, winH)

gh_mesh.update_quad_size(g_quad, winW, winH)


