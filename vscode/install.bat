@echo off

call "as_admin.bat" "%~0"

set "user_configs=%appdata%\Code\User"
set "setts=settings.json"
set "binds=keybindings.json"

if exist "%user_configs%\%setts%" move "%user_configs%\%setts%" "%~dp0%setts%.backup"
if exist "%user_configs%\%binds%" move "%user_configs%\%binds%" "%~dp0%binds%.backup"

mklink "%user_configs%\%setts%" "%~dp0%setts%"
mklink "%user_configs%\%binds%" "%~dp0%binds%"

pause

for /f "delims=" %%a in (.\extensions.txt) do (
	code --install-extension %%a
)

pause
