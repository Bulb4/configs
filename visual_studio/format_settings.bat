@echo off
tidy.exe --indent 1 --indent-attributes 0 --indent-spaces 4 -m -q -xml CurrentSettings.vssettings || pause
