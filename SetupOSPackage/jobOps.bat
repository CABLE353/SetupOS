@echo off
:X
cls
echo.
echo Choose the job you're undertaking. (pssst....feel free to remove the usb drive ☻):
echo.
echo 1 - Start Windows 11 Automated Setup:
echo 2 - Automated DiskPart:
echo 3 - Start Windows 11 Manual Setup(You do all of the os configurations):
echo E - Exit(Terminate the batch file):
SET /P M=Type 1, 2, 3, or E to exit; then press ENTER:
IF %M%==1 (
GOTO B
) ELSE IF %M%==2 (
GOTO F
) ELSE IF %M%==3 (
GOTO N
) ELSE IF %M%==E (
GOTO E
) ELSE (
GOTO T
)



:B
start cmd /c vbsbridge.bat
GOTO X

:C
start cmd /c setup.exe
GOTO X

:F
start cmd /c vacuum.bat
timeout /t 15
GOTO X







REM Exit Option:
:E
exit





REM For Characters other than the options listed or available(Exception Handler):

:T
cls
echo Please choose a valid option from the menu!
echo.
echo.
pause /t 7 /nobreak
GOTO X
