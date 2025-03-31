@echo off
REM Checks the USB Drive Letter Mount:
if exist E:\sources (
  mountedE.vbs
) else if exist D:\sources (
  mountedD.vbs
) Else (
echo Couldn't Find USB Drive Letter Mount! If this PC is a Dell, the Raid Storage option is probably set & needs to be changed to NVMe Storage in the Storage Setting section of the BIOS. Press F2 at boot to access the BIOS Settings.
)

REM Sets pc name, user name, & password variables:

for /f "delims=" %%a in (NAMEOFYOURPC.txt) do set NAMEOFYOURPC=%%a
for /f "delims=" %%a in (yourUsername.txt) do set yourUsername=%%a
for /f "delims=" %%a in (yourPassword.txt) do set yourPassword=%%a

REMItitializes the Network card on the Client PC
:r
cls
REM If the connection isn't working or the address is incorrect, this allows the User to re-run the network initialization step.

REM Checks connection from Client PC to Host PC
echo.
echo.
echo.
echo                                               Set Network Type
echo ---------------------------------------------------------------------------------------------------------------------
echo 1 - RJ45(Ethernet).
echo 2 - Wifi(Wireless).
echo.
SET /P N=Choose the type of connection you need:
IF %N%==1 (
GOTO RJ
) ELSE IF %N%==2 (
GOTO Wifi
) ELSE (
GOTO Tt
)
:RJ
cls
                                              Set Network Type
echo ---------------------------------------------------------------------------------------------------------------------
echo Initializing Network; Please Wait:
wpeutil InitializeNetwork /NoWait
wpeutil InitializeNetwork /NoWait
wpeutil InitializeNetwork /NoWait
wpeutil InitializeNetwork /NoWait
wpeutil InitializeNetwork /NoWait
wpeutil InitializeNetwork /NoWait
goto connected

:Wifi
cls
                                              Set Network Type
echo ---------------------------------------------------------------------------------------------------------------------
echo Initializing WiFi; Please Wait:
wpeutil InitializeNetwork /NoWait
wpeutil InitializeNetwork /NoWait
wpeutil InitializeNetwork /NoWait
wpeutil InitializeNetwork /NoWait
net start wlansvc
netsh wlan show interfaces
netsh wlan show networks
netsh wlan add profile filename="X:\Profiles\wifi-profile.xml"
netsh wlan connect name="YourNetworkSSID"
goto connected

REM If the connection isn't working or the address is incorrect, this option allows the User to re-run the network initialization step.
:connected
REM Checks connection from Client PC to Host PC
ipconfig
echo.
echo.
echo.
echo Press `r` to select a different connection type and retry the connection test. Press `c` to continue to the DLA menu.
SET /P M=The Script will exit if nothing is entered:
IF %M%==r (
GOTO r
) ELSE IF %M%==c (
GOTO X
) ELSE (
GOTO t
)

REM Each colon with a letter maps the batch file depending on the option chosen and executes commands within that bookmark. All bookmarks call this letter to go back to the top of the menu.
:X

REM This is the batch file GUI menu for drive letter mount options.
cls
echo.
echo                     Welcome to the DLA Menu of SetupOS!
echo ------------------------------------------------------------------------------
echo Choose a Drive Letter to mount the Host PC to(Each Letter can only be used once during the installation process):
echo.
echo 0 - Launch Setup.exe from USB drive:
echo 1 - A:
echo 2 - B:
echo 3 - G:
echo 4 - H:
echo 5 - I:
echo 6 - J:
echo 7 - K(No AutoLogin):
echo 8 - L(No AutoLogin):
echo 9 - W(No AutoLogin):
echo 10 - N(No AutoLogin):
echo E - Exits\Terminates Batch File(do it twice to reboot PC):
SET /P M=Type 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, Or E then press ENTER:
IF %M%==0 (
GOTO S
) ELSE IF %M%==1 (
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
) ELSE IF %M%==10 (
GOTO N
) ELSE IF %M%==E (
GOTO E
) ELSE (
GOTO T
)


REM Starts setup.exe from the USB drive rather than the Host PC to keep the pre-SetupOS functionality:

:S
start setup.exe
Pause
GOTO X


REM These below are the bookmarks with username & password integration:

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




REM These below are the bookmarks without username & password integration:


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


:t
cls
echo Please choose a valid option from the menu!
echo.
echo.
pause /t 7 /nobreak
GOTO connected


:Tt
cls
echo Please choose a valid option from the menu!
echo.
echo.
pause /t 7 /nobreak
GOTO r


:T
cls
echo Please choose a valid option from the menu!
echo.
echo.
pause /t 7 /nobreak
GOTO X
