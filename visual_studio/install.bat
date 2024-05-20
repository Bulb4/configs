@echo off
call "as_admin.bat" "%~0"

call "%~dp0get_install_info.bat"
if not "%errorlevel%"=="0" goto :end

if "%install_version%"=="" echo studio version not found & goto :end
if "%instance_id%"=="" echo studio instance id not found & goto :end

set "setts=CurrentSettings.vssettings"
set "user_config=%appdata%\..\Local\Microsoft\VisualStudio\%install_version:~0,2%.0_%instance_id%\Settings"

echo config: %user_config%

if not exist %user_config% echo failed to get settings folder & goto :end

pause

if exist "%user_config%\%setts%" move "%user_config%\%setts%" "%~dp0%setts%.backup"
mklink "%user_config%\%setts%" "%~dp0%setts%"

exit /b %errorlevel%


:end
echo error
pause
