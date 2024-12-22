@echo off
if exist C:/Users (
vacuum.bat
autosetup.vbs
) else (
echo Can't find the System(C) Drive! Cancelling & returning to DLA menu.
pause
exit
)