@echo off

call "as_admin.bat" "%~0"

set "setts=settings.json"
set "user_config=%appdata%\..\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\%setts%"

if exist "%user_config%" echo creating backup: %setts%.backup & move "%user_config%" "%~dp0%setts%.backup"

mklink "%user_config%" "%~dp0%setts%"

pause

