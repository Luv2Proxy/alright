@echo off
setlocal enabledelayedexpansion

:: Output file
set outputFile=games.json
echo [ > %outputFile%

set firstEntry=1

:: Loop through directories
for /d %%D in (*) do (
    rem Check if the directory contains any files or subdirectories
    dir /b /a "%%D" | findstr . >nul 2>&1
    if not errorlevel 1 (
        if !firstEntry! equ 0 echo, >> %outputFile%
        set firstEntry=0
        echo    "%%D" >> %outputFile%
    )
)

echo ] >> %outputFile%

echo games.json generated successfully!
