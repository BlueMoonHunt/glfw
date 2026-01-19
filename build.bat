@echo off
setlocal

set workspace=%~dp0
set workspace=%workspace:~0,-1%
set glfw_src_dir=%workspace%\src
set glfw_inc_dir=%workspace%\include

@REM %glfw_src_dir%\vulkan.c ^

set common_src=%glfw_src_dir%\context.c ^
%glfw_src_dir%\init.c ^
%glfw_src_dir%\input.c ^
%glfw_src_dir%\monitor.c ^
%glfw_src_dir%\platform.c ^
%glfw_src_dir%\window.c ^
%glfw_src_dir%\egl_context.c ^
%glfw_src_dir%\osmesa_context.c ^
%glfw_src_dir%\null_init.c ^
%glfw_src_dir%\null_monitor.c ^
%glfw_src_dir%\null_window.c ^
%glfw_src_dir%\null_joystick.c

set win32_src=%glfw_src_dir%\win32_init.c ^
%glfw_src_dir%\win32_joystick.c ^
%glfw_src_dir%\win32_monitor.c ^
%glfw_src_dir%\win32_time.c ^
%glfw_src_dir%\win32_thread.c ^
%glfw_src_dir%\win32_window.c ^
%glfw_src_dir%\win32_module.c ^
%glfw_src_dir%\wgl_context.c

set defines=-D_GLFW_WIN32 -D_CRT_SECURE_NO_WARNINGS -DUNICODE -D_UNICODE
set includes=-I%glfw_inc_dir% -I%glfw_src_dir%
set opts=-nologo -c -O2 -Zi -std:c11 %defines% %includes%

cl %opts% %common_src% %win32_src%
lib -nologo *.obj -out:glfw3.lib
del *.obj
endlocal