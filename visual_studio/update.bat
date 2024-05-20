@echo off
call "%~dp0get_install_info.bat" || goto :end

if "%install_path%"=="" echo studio instalation not found & goto :end

echo studio found: %install_path%

"%installer_path%\setup.exe" export --installPath "%install_path%" --config "%~dp0%install.vsconfig" --passive

:end
pause
