@echo off
REM Checks the USB Drive Letter Mount:
if exist E:\sources (
  mountedE.vbs
) else if exist D:\sources (
  mountedD.vbs
) Else (
echo Couldn't Find USB Drive Letter Mount! If this PC is a Dell, the Raid Storage option is probably set & needs to be changed to NvMe Storage in the Storage section of the BIOS. Press F2 at boot to access the BIOS Settings.
)

REM Sets pc name, user name, & password variables:

for /f "delims=" %%a in (NAMEOFYOURPC.txt) do set NAMEOFYOURPC=%%a
for /f "delims=" %%a in (yourUsername.txt) do set yourUsername=%%a
for /f "delims=" %%a in (yourPassword.txt) do set yourPassword=%%a

REMItitializes the Network card on the Client PC

cls
echo Initializing Network Cable; Please Wait:
wpeutil InitializeNetwork /NoWait
wpeutil InitializeNetwork /NoWait
wpeutil InitializeNetwork /NoWait
wpeutil InitializeNetwork /NoWait
wpeutil InitializeNetwork /NoWait
wpeutil InitializeNetwork /NoWait
wpeutil InitializeNetwork /NoWait
wpeutil InitializeNetwork /NoWait
wpeutil InitializeNetwork /NoWait
wpeutil InitializeNetwork /NoWait

REM Checks connection from Client PC to Host PC
ipconfig

REM If the connection isn't working this Pause allows for a 'Ctrl C' termination of the batch file
pause

REM Each colon with a letter maps the batch file depending on the option chosen and executes commands within that bookmark. All bookmarks call this letter to go back to the top of the menu.
:X

REM This is the batch file GUI menu for drive letter mount options.
cls
echo.
echo Choose a DLA that hasn't been chosen on another computer already connected:
echo.
echo 1 - A:
echo 2 - B:
echo 3 - G:
echo 4 - H:
echo 5 - I:
echo 6 - J:
echo 7 - K(No AutoLogin):
echo 8 - L(No AutoLogin):
echo 9 - W(No AutoLogin):
echo 0 - N(No AutoLogin):
echo E - Exit(Terminates Batch File):
SET /P M=Type 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, Or E then press ENTER:
IF %M%==1 (
GOTO A
) ELSE IF %M%==2 (
GOTO B
) ELSE IF %M%==3 (
GOTO G
) ELSE IF %M%==4 (
GOTO H
) ELSE IF %M%==5 (
GOTO I
) ELSE IF %M%==6 (
GOTO J
) ELSE IF %M%==7 (
GOTO K
) ELSE IF %M%==8 (
GOTO L
) ELSE IF %M%==9 (
GOTO W
) ELSE IF %M%==0 (
GOTO N
) ELSE IF %M%==E (
GOTO E
) ELSE (
GOTO T
)




REM These below are the bookmarks with a username & password integration


:A
net use A: \\%NAMEOFYOURPC%\Win11 /USER:%yourUsername% %yourPassword%
A:
start cmd /c jobOps.bat
timeout /t 15
Pause
GOTO X

:B
net use B: \\%NAMEOFYOURPC%\Win11 /USER:%yourUsername% %yourPassword%
B:
start cmd /c jobOps.bat
timeout /t 15
GOTO X

:G
net use G: \\%NAMEOFYOURPC%\Win11 /USER:%yourUsername% %yourPassword%
G:
start cmd /c jobOps.bat
timeout /t 15
GOTO X

:H
net use H: \\%NAMEOFYOURPC%\Win11 /USER:%yourUsername% %yourPassword%
H:
start cmd /c jobOps.bat
timeout /t 15
GOTO X

:I
net use I: \\%NAMEOFYOURPC%\Win11 /USER:%yourUsername% %yourPassword%
I:
start cmd /c jobOps.bat
timeout /t 15
GOTO X

:J
net use J: \\%NAMEOFYOURPC%\Win11 /USER:%yourUsername% %yourPassword%
J:
start cmd /c jobOps.bat
timeout /t 15
GOTO X




REM These below are the bookmarks without the username & password integration


:K
net use K: \\%NAMEOFYOURPC%\Win11
K:
start cmd /c jobOps.bat
timeout /t 15
GOTO X

:L
net use L: \\%NAMEOFYOURPC%\Win11
L:
start cmd /c jobOps.bat
timeout /t 15
GOTO X

:N
net use N: \\%NAMEOFYOURPC%\Win11
N:
start cmd /c jobOps.bat
timeout /t 15
GOTO X

:W
net use W: \\%NAMEOFYOURPC%\Win11
W:
start cmd /c jobOps.bat
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
