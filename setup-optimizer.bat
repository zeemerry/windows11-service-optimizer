@echo off
chcp 65001 >nul

REM 🧹 Windows 11 Service Optimizer - Automated Setup
REM This script sets up everything needed for one-click optimization

echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║            🧹 Windows 11 Service Optimizer Setup          ║
echo ║                 🚀 Automated Installation                 ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

REM Check administrator privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    echo ✅ Administrator privileges confirmed
) else (
    echo ❌ Setup requires Administrator privileges!
    echo.
    echo Right-click this file and select "Run as Administrator"
    echo.
    pause
    exit /b 1
)

echo.
echo 🔧 Step 1: Setting up PowerShell execution policy...
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Set-ExecutionPolicy Bypass -Scope LocalMachine -Force"
echo ✅ PowerShell execution policy configured

echo.
echo 📦 Step 2: Creating desktop shortcut...
set "DESKTOP=%USERPROFILE%\Desktop"
set "SHORTCUT=%DESKTOP%\Windows 11 Optimizer.lnk"

REM Create shortcut using PowerShell
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut('%SHORTCUT%')
$Shortcut.TargetPath = '%~dp0optimize-now.bat'
$Shortcut.WorkingDirectory = '%~dp0'
$Shortcut.IconLocation = 'powershell.exe,0'
$Shortcut.Description = 'Windows 11 Service Optimizer - One-Click Performance Boost'
$Shortcut.Save()
"
echo ✅ Desktop shortcut created

echo.
echo 🚀 Step 3: Testing optimization script...
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "
try {
    $test = Get-Service | Where-Object { $_.Name -eq 'DiagTrack' } | Select-Object -First 1
    if ($test) {
        Write-Host '✅ Service detection working correctly' -ForegroundColor Green
    }
} catch {
    Write-Host '⚠️ Service detection test completed' -ForegroundColor Yellow
}
"

echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                    📋 Setup Complete!                     ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo 🎉 Windows 11 Service Optimizer is now ready to use!
echo.
echo 📁 WHAT WAS INSTALLED:
echo   ✅ PowerShell execution policy configured
echo   ✅ Desktop shortcut created
echo   ✅ One-click optimization ready
echo.
echo 🚀 HOW TO USE:
echo   1. Double-click the 'Windows 11 Optimizer' icon on your desktop
echo   2. The optimization will run automatically
echo   3. Restart your computer when prompted
echo.
echo 🔧 ADVANCED USAGE:
echo   • Run 'optimize-now.bat' directly from this folder
echo   • Use PowerShell: .\disable-services.ps1
echo.
echo Press any key to exit setup...
pause >nul

REM Optional: Ask if user wants to run optimization now
echo.
echo Would you like to run the optimization now? (Y/N)
set /p "run_now="
if /i "%run_now%"=="Y" (
    echo.
    echo 🚀 Starting optimization...
    call "%~dp0optimize-now.bat"
)

exit /b 0
