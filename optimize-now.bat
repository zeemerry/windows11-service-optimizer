@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

REM 🧹 Windows 11 Service Optimizer - One-Click Launcher
REM This batch file makes optimization as simple as double-clicking!

echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║              🧹 Windows 11 Service Optimizer                ║
echo ║                 🚀 One-Click Optimization                    ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

REM Check if running as Administrator
net session >nul 2>&1
if %errorLevel% == 0 (
    echo ✅ Administrator privileges confirmed
) else (
    echo ❌ This script requires Administrator privileges!
    echo.
    echo Right-click on this file and select "Run as Administrator"
    echo.
    echo Press any key to exit...
    pause >nul
    exit /b 1
)

echo.
echo 🔧 Setting execution policy...
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Set-ExecutionPolicy Bypass -Scope Process -Force"

echo.
echo 🚀 Starting Windows 11 Service Optimization...
echo.

REM Run the PowerShell script
PowerShell -NoProfile -ExecutionPolicy Bypass -File "%~dp0disable-services.ps1"

echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                 🎉 Optimization Complete!                 ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo The optimization has finished! Your computer will benefit from:
echo • 🚀 Faster boot times
echo • 💾 Lower memory usage
echo • 🔒 Enhanced privacy
echo • 🛡️ Reduced background activity
echo.
echo IMPORTANT: Please restart your computer for all changes to take effect.
echo.
echo Press any key to exit...
pause >nul
