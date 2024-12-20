@echo Off 


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
)

 

REM Gets required info about the host pc & usb drive:
echo %usb% > usb.txt
SET NAMEOFYOURPC=hostname
hostname > NAMEOFYOURPC.txt
Cls 
echo Please enter your username(You can find it as C:\Users\YourUsername):
SET /P user=
echo %user% > yourUsername.txt
Cls 
echo Please enter your password(The password that you use to login to your PC user):
SET /P password=
echo %password% > yourPassword.txt
echo Don't panic! This data is temporary, never leaves your PC/USB drive, & is deleted after setup.

REM Creates Necessary Win11 Directory:
echo Creating Win11 folder on root of C drive...
if exist C:\Users\%user%\Win11 (
echo Win11 folder already exists!
) else (
mkdir C:\Users\%user%\Win11
)


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
pause
REM Applies Host PC Name to setupos.bat inside boot.wim:
Cls 
echo "When the User Athentication loads, it should ask you for your '@churchofjesuschrist.org' password. Before you move on, it is best you know what it is &/or have access to it someplace."
echo Please DO NOT INTERUPT THIS STEP or boot.wim will be corrupted!
echo Please also make apsolute certain your computer won't turn off on this step or do any other shinanagons:
Pause 
echo 
echo Making SetupOS.bat run on USB boot; Please Wait...
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
