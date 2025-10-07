@echo off
chcp 65001 >nul

REM 🧹 Windows 11 Service Optimizer - Quick Start Guide
REM This shows users how easy it is to use the optimizer

echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║            🧹 Windows 11 Service Optimizer                ║
echo ║                 🚀 QUICK START GUIDE                     ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo 🎯 Your project is now 1-CLICK READY!
echo.
echo 📁 CURRENT FILES:
echo   📜 disable-services.ps1  - Main optimization script (colorful!)
echo   🚀 optimize-now.bat      - One-click launcher
echo   ⚙️ setup-optimizer.bat    - Automated setup
echo   📋 Quick-Start.bat       - This guide
echo.
echo 🚀 THREE WAYS TO USE:
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                    🎯 METHOD 1: SETUP                     ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo Run 'setup-optimizer.bat' as Administrator:
echo • Sets up PowerShell execution policy
echo • Creates desktop shortcut
echo • Tests everything works
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                   🎯 METHOD 2: ONE-CLICK                  ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo Run 'optimize-now.bat' as Administrator:
echo • Checks admin privileges automatically
echo • Runs optimization with beautiful colors
echo • Shows progress and results
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                    🎯 METHOD 3: ADVANCED                 ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo Use PowerShell directly:
echo   Set-ExecutionPolicy Bypass -Scope Process -Force
echo   .\disable-services.ps1
echo.
echo.
echo 💡 RECOMMENDED WORKFLOW:
echo.
echo 1️⃣  Run 'setup-optimizer.bat' (one time setup)
echo 2️⃣  Use desktop shortcut for daily optimization
echo 3️⃣  Enjoy faster Windows performance!
echo.
echo Press any key to see file listing...
pause >nul

echo.
echo 📁 Current Directory Contents:
dir /b
echo.
echo Press any key to exit...
pause >nul
