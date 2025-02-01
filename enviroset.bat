@echo Off 

:F
REM Check which letters are assigned to USB Drive
echo Checking USB Drive Letter:
if exist E:\sources (
  SET usb=E:
) else if exist D:\sources (
  SET usb=D:
) else if exist A:\sources (
SET usb=A:
) else if exist B:\sources (
SET usb=B:
) else if exist F:\sources (
SET usb=F:
) else if exist G:\sources (
SET usb=G:
) else if exist H:\sources (
SET usb=H:
) else if exist I:\sources (
SET usb=I:
) else if exist J:\sources (
SET usb=J:
) else if exist K:\sources (
SET usb=K:
) else if exist L:\sources (
SET usb=L:
) else if exist M:\sources (
SET usb=M:
) else if exist N:\sources (
SET usb=N:
) else if exist O:\sources (
SET usb=O:
) else if exist P:\sources (
SET usb=P:
) else if exist Q:\sources (
SET usb=Q:
) else if exist R:\sources (
SET usb=R:
) else if exist S:\sources (
SET usb=S:
) else if exist T:\sources (
SET usb=T:
) else if exist U:\sources (
SET usb=U:
) else if exist V:\sources (
SET usb=V:
) else if exist W:\sources (
SET usb=W:
) else if exist X:\sources (
SET usb=X:
) else if exist Y:\sources (
SET usb=Y:
) else if exist Z:\sources (
SET usb=Z:
) else (
echo Couldn't find USB mounted Directory!
echo 
echo Before Running Enviroset.bat, please be sure to insert your USB Installation Media!
Pause
echo to restart Enviroset.bat.
GOTO F
)

REM Downloads SetupOSPackage.zip:

:G
Cls
echo Downloading SetupOSPackage.zip:

powershell Invoke-WebRequest -Uri "https://github.com/CABLE353/SetupOS/raw/refs/heads/main/SetupOSPackage.zip" -OutFile "SetupOSPackage.zip"

IF exist SetupOSPackage.zip (
echo Download Succeeded! Or at least the file exists...
Pause
GOTO X
) ELSE (
echo Download Failed! Please check your internet connection.
)

REM Each colon with a letter maps the batch file depending on the option chosen and executes commands within that bookmark. All bookmarks call this letter to go back to the top of the menu.
:X

SET firstUse=false

REM This is the batch file GUI menu.
cls
echo V1
echo                    Welcome to the Enviornment Setup and Management Menu of SetupOS!
echo ------------------------------------------------------------------------------------------------------
echo Choose an option:
echo.
echo 0 - Full Setup(this does everything):
echo 1 - Gather Info:
echo 2 - Create The Win11 Folder:
echo 3 - Copy USB Installation Media file and folder contents To Win11 Folder:
echo 4 - Inject data files and SetupOSPackage.zip contents to make SetupOS launch upon booting From USB:
echo 5 - Download SetupOSPackage.zip from GitHub:
echo 6 - See the Author(s) of this Project:
echo E - Exits\Terminates Batch File:
SET /P M=Type 0, 1, 2, 3, 4, 5, Or E then press ENTER:
IF %M%==0 (
SET firstUse=true
cls
GOTO S
) ELSE IF %M%==1 (
cls
GOTO S
) ELSE IF %M%==2 (
cls
GOTO W
) ELSE IF %M%==3 (
cls
GOTO C
) ELSE IF %M%==4 (
cls
GOTO B
) ELSE IF %M%==5 (
cls
GOTO G
) ELSE IF %M%==6 (
GOTO A
) ELSE IF %M%==E (
exit
) ELSE (
cls
GOTO T
)

:S
REM Gets required info about the host pc and usb drive:
echo -----------------------------------------------------------------------
echo To start off, this program will use the following to properly setup your SetupOS enviornment:
echo. 
echo 1. Your Host PC Hostname.
echo. 
echo 2. Your Host PC Local Username.
echo. 
echo 3. Your Host PC Local Password.
echo -----------------------------------------------------------------------
Pause
Cls
echo -----------------------------------------------------------------------
echo Getting info....
echo -----------------------------------------------------------------------
echo PC Hostname Gathered.
echo %usb% > usb.txt
SET NAMEOFYOURPC=hostname
hostname > NAMEOFYOURPC.txt
pause
Cls
echo -----------------------------------------------------------------------
echo Getting info....
echo -----------------------------------------------------------------------
echo PC Hostname Gathered.
echo Please enter your username(You can find it in C:\Users and look for the folder with your username on it):
SET /P user=
echo %user% > yourUsername.txt
Cls
echo -----------------------------------------------------------------------
echo Getting info....
echo -----------------------------------------------------------------------
echo PC Hostname Gathered.        Local Username Gathered.
echo Please enter your password(The password that you use to login to your PC user):
SET /P password=
echo %password% > yourPassword.txt
cls
echo -----------------------------------------------------------------------
echo Getting some info....
echo -----------------------------------------------------------------------
echo PC Hostname Gathered.        Local Username Gathered.        Local Password Gathered.
Pause
echo -----------------------------------------------------------------------
echo Don't panic! This data never leaves your PC or USB drive, and instead gets moved into the boot.wim image file as variables for setupOS.bat to call when connecting to the Host PC.
IF %firstUse%==true (
%firstUse%
pause
GOTO W
) else if %firstUse%==false (
pause
GOTO B
)
%firstUse%
pause
:W
cls
REM Creates Necessary Win11 Directory:
echo Creating Win11 folder in the users folder of the C drive...
if exist C:\Users\%user%\Win11 (
echo Win11 folder already exists!
) else (
mkdir C:\Users\%user%\Win11
)
IF %firstUse%==true (
Pause
GOTO C
) else if %firstUse%==false (
pause
GOTO d
)

:C
cls
REM Copies installer files from USB Drive to Win11 Folder:
echo Copying USB Installer Files to C:\Win11; Please Wait...
if exist C:\Users\%user%\Win11\sources (
goto x
) Else (
robocopy %usb% C:\Users\%user%\Win11 /e
)

:x
REM Extracts SetupOSPackage.zip:
echo Extracting SetupOSPackage.zip to C:\Win11; Please Wait...
if exist C:\Users\%user%\Win11\SetupOSPackage (
    echo "Extraction destination already exists! Deleting old SetupOSPackage path and starting clean:"
    Erase /S C:\Users\%user%\Win11\SetupOSPackage\
    rmdir C:\Users\%user%\Win11\SetupOSPackage
    goto x
) else (
powershell -command "Expand-Archive -Path C:/Users/%user%/Downloads/SetupOSPackage.zip -DestinationPath C:\Users\%user%\Win11"
)

IF %firstUse%==true (
pause
GOTO B
) else if %firstUse%==false (
pause
GOTO d
)

:B
REM Applies Host PC Name to setupos.bat inside boot.wim:

Cls 
echo "This step of the enviornment setup uses DISM from the command prompt, and will need to run as an administrator. This is necessary to open boot.wim and plant the files: winpeshl.ini, setupOS.bat, switch.vbs, mountedD.vbs, and mountedE.vbs. This step will and should trigger a UAC Prompt."
echo ---------------------------------------------------------------------------------------
echo Some things to be aware of:
echo ---------------------------------------------------------------------------------------
echo Please DO NOT INTERUPT THIS STEP or boot.wim will be corrupted!
echo. 
echo Please also make apsolute certain your computer won't turn off on this step or do any other shinanagons:
echo ---------------------------------------------------------------------------------------
Pause
cls
echo. 
echo ---------------------------------------------------------------------------------------
echo Making SetupOS.bat run on USB boot; Please Wait...
echo ---------------------------------------------------------------------------------------
echo 
:b
if exist C:\Users\%user%\Win11\Temp (
Erase /S C:\Users\%user%\Win11\Temp
rmdir C:\Users\%user%\Win11\Temp
goto b
) else (
powershell New-Item -Path "C:\Users\%user%\Win11\Temp" -ItemType Directory
)


REM "Mounts boot.wim for automated injection of files. It will inject SetupOSPackage files into boot.wim mounted folder Temp:"

powershell -Command "Start-Process powershell -ArgumentList '-Command', '$usb = Get-Content "usb.txt" | Out-String; $usb = $usb.Trim(); DISM /Mount-Wim /WimFile:"$usb\sources\boot.wim" /MountDir:C:\Users\%user%\Win11\Temp /Index:2; Copy-Item "C:\Users\%user%\Win11\SetupOSPackage\setupos.bat" "C:\Users\%user%\Win11\Temp\Windows\System32" -Force; Copy-Item "C:\Users\%user%\Win11\SetupOSPackage\winpeshl.ini" "C:\Users\%user%\Win11\Temp\Windows\System32" -Force; Copy-Item "C:\Users\%user%\Win11\SetupOSPackage\switch.vbs" "C:\Users\%user%\Win11\Temp\Windows\System32" -Force; Copy-Item "C:\Users\%user%\Win11\SetupOSPackage\mountedD.vbs" "C:\Users\%user%\Win11\Temp\Windows\System32" -Force; Copy-Item "C:\Users\%user%\Win11\SetupOSPackage\mountedE.vbs" "C:\Users\%user%\Win11\Temp\Windows\System32" -Force; Copy-Item "NAMEOFYOURPC.txt" "C:\Users\%user%\Win11\Temp\Windows\System32" -Force; Copy-Item "yourUsername.txt" "C:\Users\%user%\Win11\Temp\Windows\System32" -Force; Copy-Item "yourPassword.txt" "C:\Users\%user%\Win11\Temp\Windows\System32" -Force; DISM /Unmount-Wim /MountDir:C:\Users\%user%\Win11\Temp /Commit; Remove-Item "NAMEOFYOURPC.txt" -Force; Remove-Item "yourPassword.txt" -Force; Remove-Item "yourUsername.txt" -Force; Remove-Item "usb.txt" -Force; Remove-Item "SetupOSPackage.zip" -Force; Remove-Item -Path "C:\Users\%user%\Win11\SetupOSPackage" -Recurse -Force -Confirm:$false; Remove-Item -Path "C:\Users\%user%\Win11\Temp" -Force; net share Win11=C:\Users\%user%\Win11 /GRANT:Everyone,FULL' -Verb RunAs"


REM Copies SetupOSPackage host pc files into Win11:
echo Copying SetupOSPackage to Win11 folder; Please Wait...
REM robocopy C:\Users\%user%\Win11\setupos.bat %usb%
xcopy C:\Users\%user%\Win11\SetupOSPackage\vacuum.bat C:\Users\%user%\Win11 /y
xcopy C:\Users\%user%\Win11\SetupOSPackage\vbsbridge.bat C:\Users\%user%\Win11 /y
xcopy C:\Users\%user%\Win11\SetupOSPackage\jobOps.bat C:\Users\%user%\Win11 /y
xcopy C:\Users\%user%\Win11\SetupOSPackage\autosetup.vbs C:\Users\%user%\Win11 /y

Pause
GOTO d

:d
cls
echo ----------------------------------------------------------------------------------
echo Finished! Time to test it out! Enjoy!
echo ----------------------------------------------------------------------------------
Pause
GOTO X

REM Authors page:
:A
cls
echo ----------------------------------------------------------------------------------
echo Current Project Authors:
echo CABLE53 (Me)  :]
echo. 
echo. 
echo ----------------------------------------------------------------------------------
pause
REM For Characters other than the options listed or available in the menu(Exception Handler):
GOTO X

:T
cls
echo Please choose a valid option from the menu!
echo.
echo.
pause /t 7 /nobreak
GOTO X
