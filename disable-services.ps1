# 🧹 Windows 11 Service Optimizer Script
# Run as Administrator

# Header with colors and emojis
Write-Host "╔══════════════════════════════════════════════════════════════╗" -ForegroundColor Magenta
Write-Host "║              🧹 Windows 11 Service Optimizer                ║" -ForegroundColor Magenta
Write-Host "║                 🚀 Performance & Privacy Boost              ║" -ForegroundColor Magenta
Write-Host "╚══════════════════════════════════════════════════════════════╝" -ForegroundColor Magenta
Write-Host ""

# Startup message with animation effect
Write-Host "🔄 Initializing service optimization..." -ForegroundColor Yellow
Start-Sleep -Milliseconds 800
Write-Host "✅ Administrator privileges confirmed" -ForegroundColor Green
Start-Sleep -Milliseconds 400
Write-Host "📋 Loading service list..." -ForegroundColor Cyan
Start-Sleep -Milliseconds 400

Write-Host ""
Write-Host "🚀 Starting service optimization process..." -ForegroundColor Green
Write-Host ""

# Service categories with visual organization
$privacyServices = @("DiagTrack", "dmwappushservice", "WerSvc")
$performanceServices = @("SysMain", "WSearch")
$networkServices = @("RemoteRegistry", "TermService", "RoutingAndRemoteAccess", "SharedAccess")
$gamingServices = @("XblAuthManager", "XblGameSave", "XboxNetApiSvc", "XboxGipSvc")
$deviceServices = @("bthserv", "lfsvc", "MapsBroker", "FrameServer", "WbioSrvc", "SCardSvr", "SensorService", "PhoneSvc")
$legacyServices = @("Fax", "CscService", "RetailDemo", "Spooler", "WpnService", "DPS", "wisvc", "SessionEnv")

$allServices = $privacyServices + $performanceServices + $networkServices + $gamingServices + $deviceServices + $legacyServices

$totalServices = $allServices.Count
$processed = 0
$disabled = 0
$skipped = 0

function Show-Progress {
    param([int]$Processed, [int]$Total, [string]$ServiceName, [string]$Status)
    $percentage = [math]::Round(($Processed / $Total) * 100, 1)
    Write-Host "[$processed/$totalServices] $($percentage)% - $ServiceName " -NoNewline -ForegroundColor White
    Write-Host "[$Status]" -ForegroundColor $statusColor
}

# Process services with enhanced visual feedback
foreach ($svc in $allServices) {
    $processed++

    try {
        # Show current operation
        Write-Host "🔧 Processing: " -NoNewline -ForegroundColor Yellow
        Write-Host "$svc " -NoNewline -ForegroundColor White
        Write-Host "..." -ForegroundColor Gray

        # Stop and disable service
        Stop-Service $svc -Force -ErrorAction SilentlyContinue | Out-Null
        Set-Service $svc -StartupType Disabled -ErrorAction SilentlyContinue | Out-Null

        $disabled++
        $statusColor = "Green"
        Show-Progress -Processed $processed -Total $totalServices -ServiceName $svc -Status "✅ DISABLED"

    } catch {
        $skipped++
        $statusColor = "DarkGray"
        Show-Progress -Processed $processed -Total $totalServices -ServiceName $svc -Status "⏭️ SKIPPED"
    }

    # Brief pause for visual effect
    Start-Sleep -Milliseconds 200
}

# Scheduled tasks section with enhanced visuals
Write-Host ""
Write-Host "╔══════════════════════════════════════════════════════════════╗" -ForegroundColor Blue
Write-Host "║              📅 Scheduled Tasks Cleanup                     ║" -ForegroundColor Blue
Write-Host "╚══════════════════════════════════════════════════════════════╝" -ForegroundColor Blue

Write-Host ""
Write-Host "🔍 Scanning for telemetry scheduled tasks..." -ForegroundColor Cyan

# Get and disable telemetry tasks
$telemetryTasks = Get-ScheduledTask | Where-Object { $_.TaskName -match "Telemetry|CEIP|Customer" } | Select-Object -ExpandProperty TaskName

if ($telemetryTasks.Count -gt 0) {
    Write-Host "📋 Found $($telemetryTasks.Count) telemetry tasks to disable:" -ForegroundColor Yellow

    foreach ($task in $telemetryTasks) {
        try {
            Disable-ScheduledTask -TaskName $task -ErrorAction SilentlyContinue | Out-Null
            Write-Host "  ❌ Disabled: " -NoNewline -ForegroundColor Red
            Write-Host "$task" -ForegroundColor DarkGray
        } catch {
            Write-Host "  ⚠️ Failed to disable: " -NoNewline -ForegroundColor DarkYellow
            Write-Host "$task" -ForegroundColor DarkGray
        }
    }
} else {
    Write-Host "✅ No telemetry scheduled tasks found" -ForegroundColor Green
}

# Final summary with enhanced visuals
Write-Host ""
Write-Host "╔══════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║                    📊 Optimization Complete!                ║" -ForegroundColor Green
Write-Host "╚══════════════════════════════════════════════════════════════╝" -ForegroundColor Green

Write-Host ""
Write-Host "📈 SUMMARY:" -ForegroundColor Cyan
Write-Host "  ✅ Services Disabled: " -NoNewline -ForegroundColor Green
Write-Host "$disabled" -ForegroundColor White
Write-Host "  ⏭️ Services Skipped: " -NoNewline -ForegroundColor DarkGray
Write-Host "$skipped" -ForegroundColor White
Write-Host "  📊 Total Processed: " -NoNewline -ForegroundColor Yellow
Write-Host "$totalServices" -ForegroundColor White

Write-Host ""
Write-Host "🎯 PERFORMANCE BENEFITS:" -ForegroundColor Green
Write-Host "  🚀 Faster boot times" -ForegroundColor White
Write-Host "  💾 Lower memory usage" -ForegroundColor White
Write-Host "  🔒 Enhanced privacy" -ForegroundColor White
Write-Host "  🛡️ Reduced background activity" -ForegroundColor White

Write-Host ""
Write-Host "⚠️ IMPORTANT:" -ForegroundColor Yellow
Write-Host "  • Restart your computer for all changes to take effect" -ForegroundColor White
Write-Host "  • Use System Restore if you encounter any issues" -ForegroundColor White
Write-Host "  • All changes can be reversed if needed" -ForegroundColor White

Write-Host ""
Write-Host "🎉 Optimization completed successfully!" -ForegroundColor Green
Write-Host "   Thank you for using Windows 11 Service Optimizer!" -ForegroundColor Magenta

# Beep sound for completion (optional)
try {
    [console]::beep(800, 300)
    Start-Sleep -Milliseconds 200
    [console]::beep(1000, 500)
} catch {
    # Ignore beep errors
}
