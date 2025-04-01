@echo off
setlocal enabledelayedexpansion
set "logfile=enviroset-log.txt"
echo SetupOS - Windows 10 Version Started > %logfile%

REM 1. Detect USB drive containing installation media
for %%L in (E D F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%L:\sources (
        set "usb=%%L:"
        goto :usb_found
    )
)

echo [ERROR] No USB drive with \sources\ found. >> %logfile%
echo Please insert your USB installation media.
pause
exit /b

:usb_found
echo USB drive detected at %usb% >> %logfile%

REM 2. Prompt for username and password
cls
echo Gathering host information...
set /p "user=Enter your Windows username (as seen in C:\Users\): "
echo %user% > yourUsername.txt

set /p "password=Enter your Windows password: "
echo %password% > yourPassword.txt

hostname > NAMEOFYOURPC.txt
echo %usb% > usb.txt

REM 3. Create Win11 directory
set "target=C:\Users\%user%\Win11"
if not exist "%target%" (
    mkdir "%target%"
    echo Created Win11 folder at %target% >> %logfile%
) else (
    echo Win11 folder already exists at %target% >> %logfile%
)

REM 4. Copy USB installation media to Win11 folder
echo Copying USB media files...
robocopy %usb% "%target%" /e >> %logfile%

REM 5. Download SetupOSPackage.zip
echo Downloading SetupOSPackage.zip...
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/CABLE353/SetupOS/SetupOS/SetupOSPackage.zip' -OutFile 'SetupOSPackage.zip'" >> %logfile%

if exist SetupOSPackage.zip (
    echo Download succeeded. >> %logfile%
) else (
    echo [ERROR] Failed to download SetupOSPackage.zip >> %logfile%
    pause
    exit /b
)

REM 6. Extract SetupOSPackage.zip
echo Extracting package...
powershell -Command "Add-Type -Assembly 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('SetupOSPackage.zip', '%target%')" >> %logfile%

REM 7. Mount boot.wim and inject SetupOS files
set "mountdir=%target%\Temp"
if exist "%mountdir%" (
    rmdir /s /q "%mountdir%"
)
mkdir "%mountdir%"

echo Mounting boot.wim...
dism /Mount-Wim /WimFile:"%usb%\sources\boot.wim" /MountDir:"%mountdir%" /Index:2 >> %logfile%
if %errorlevel% neq 0 (
    echo [ERROR] Failed to mount boot.wim >> %logfile%
   
    exit /b
)

echo Copying SetupOS files to mounted boot.wim...
copy /y "%target%\SetupOSPackage\setupos.bat" "%mountdir%\Windows\System32\" >> %logfile%
copy /y "%target%\SetupOSPackage\winpeshl.ini" "%mountdir%\Windows\System32\" >> %logfile%
copy /y "%target%\SetupOSPackage\switch.vbs" "%mountdir%\Windows\System32\" >> %logfile%
copy /y "%target%\SetupOSPackage\mountedD.vbs" "%mountdir%\Windows\System32\" >> %logfile%
copy /y "%target%\SetupOSPackage\mountedE.vbs" "%mountdir%\Windows\System32\" >> %logfile%
copy /y "NAMEOFYOURPC.txt" "%mountdir%\Windows\System32\" >> %logfile%
copy /y "yourUsername.txt" "%mountdir%\Windows\System32\" >> %logfile%
copy /y "yourPassword.txt" "%mountdir%\Windows\System32\" >> %logfile%

echo Committing changes to boot.wim...
dism /Unmount-Wim /MountDir:"%mountdir%" /Commit >> %logfile%

REM 8. Cleanup temp files
del /f /q SetupOSPackage.zip
del /f /q yourUsername.txt yourPassword.txt NAMEOFYOURPC.txt usb.txt
rmdir /s /q "%target%\SetupOSPackage"
rmdir /s /q "%mountdir%"

REM 9. Create network share for Win11
net share Win11=%target% /GRANT:Everyone,FULL >> %logfile%

REM 10. Copy extra batch files from package
xcopy "%target%\SetupOSPackage\*.bat" "%target%\" /y >> %logfile%
xcopy "%target%\SetupOSPackage\autosetup.vbs" "%target%\" /y >> %logfile%

echo.
echo SetupOS environment is ready on Windows 10!
pause
exit /b
