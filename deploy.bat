@echo off
title Portfolio Auto-Push Tool
echo ====================================================
echo  PORTFOLIO AUTO-PUSH TOOL
echo ====================================================
echo.

:: Check if git is installed
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Git is not installed or not in your PATH.
    echo Please install Git from https://git-scm.com/
    pause
    exit /b
)

:: Show status of modified files
echo [1/3] Checking modified files...
git status -s
echo.

:: Prompt user for commit message
set /p msg="Enter a description of your changes (e.g. Update video/logos): "
if "%msg%"=="" set msg=Update portfolio assets and content

echo.
echo [2/3] Staging and committing changes...
git add -A
git commit -m "%msg%"

echo.
echo [3/3] Pushing to GitHub...
git push origin main

if %errorlevel% eq 0 (
    echo.
    echo ====================================================
    echo  [SUCCESS] Changes pushed to GitHub successfully!
    echo  GitHub Pages will automatically build and deploy
    echo  your new changes in about 1-2 minutes.
    echo ====================================================
) else (
    echo.
    echo ====================================================
    echo  [ERROR] Failed to push changes.
    echo  Please check your internet connection or git permissions.
    echo ====================================================
)

echo.
pause
