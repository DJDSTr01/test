@echo off
setlocal

:: Set the source file path
set "sourceFile=C:\Users\Boudy\Documents\i love u.txt"

:: Set the number of copies
set "copies=80"

:: Get the desktop path
for /f "delims=" %%D in ('powershell -command "[System.Environment]::GetFolderPath('Desktop')"') do set "desktopPath=%%D"

:: Extract the filename and extension separately
for %%F in ("%sourceFile%") do set "fileName=%%~nF" & set "fileExt=%%~xF"

:: Loop to copy the file multiple times
for /l %%i in (1,1,%copies%) do (
    copy "%sourceFile%" "%desktopPath%\%fileName% (%%i)%fileExt%"
)


