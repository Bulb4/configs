set "installer_path=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer"

if not exist "%installer_path%" echo installer not found: "%installer_path%" & exit /b 1

for /f "usebackq tokens=1* delims=: " %%i in (`"%installer_path%\vswhere.exe" -latest`) do (
  if /i "%%i"=="instanceId" set "instance_id=%%j"
  if /i "%%i"=="installationVersion" set "install_version=%%j"
  if /i "%%i"=="installationPath" set "install_path=%%j"
)
