<div align="center">

# 🧹 Windows 11 Service Optimizer

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell](https://img.shields.io/badge/powershell-5.1%2B-blue.svg)](https://docs.microsoft.com/en-us/powershell/)
[![Platform](https://img.shields.io/badge/platform-Windows%2010%20%7C%2011-lightgrey)](https://www.microsoft.com/windows)
[![GitHub Repo](https://img.shields.io/badge/repo-Service--Optimizer-blue)](https://github.com/rezaulwork/windows11-service-optimizer)

</div>

<div align="center">

**🔥 Professional Windows Service Management Tool** - Safely disable unnecessary background services in Windows 11. Features intelligent service detection, safety checks, and comprehensive reporting for optimal system performance.

**[📥 Download](#-installation) • [📖 Usage Guide](#-usage) • [⭐ Features](#-features) • [🐛 Report Issues](https://github.com/rezaulwork/windows11-service-optimizer/issues)**

</div>

<br/>

## 🔍 SEO Keywords

**windows optimizer, service optimizer, windows 11 optimization, disable services, performance optimization, privacy enhancement, startup optimization, background services, telemetry removal, system tuning**

## ✨ Key Features & Benefits

🚀 **Intelligent Service Management**
* **Smart service detection** - Automatically identifies and targets only unnecessary services
* **Safety-first approach** - Preserves all critical system services and functionality
* **Comprehensive coverage** - Disables telemetry, background apps, and resource-heavy services

🔧 **Advanced Optimization Features**
* **Privacy protection** - Removes Microsoft telemetry and data collection services
* **Performance boost** - Disables resource-intensive background services
* **Startup acceleration** - Reduces system boot time by disabling unnecessary auto-start services

🎨 **Enhanced User Experience**
* **Rich formatted output** - Beautiful CLI interface with colors and progress indicators
* **Detailed reporting** - Shows exactly which services were disabled and their impact
* **Error handling** - Gracefully handles missing services without breaking execution

📦 **Easy Deployment & Usage**
* **Single-script solution** - No installation required, just run and optimize
* **Administrator-friendly** - Includes execution policy bypass for easy deployment
* **Reversible changes** - All modifications can be easily undone if needed

## 📋 Prerequisites

- Windows 10/11 operating system
- PowerShell 5.1 or higher
- Administrator privileges for full functionality

## 🚀 Quick Start

### 🎯 ONE-CLICK OPTIMIZATION (Recommended)

**🖱️ Double-click the desktop shortcut after setup!**

#### Automated Setup (First Time Only)
1. **Right-click `setup-optimizer.bat`** and select **"Run as Administrator"**
2. **Follow the setup wizard** - it configures everything automatically
3. **Desktop shortcut is created** for future use

#### Daily Usage
1. **Double-click "Windows 11 Optimizer"** on your desktop
2. **Watch the colorful optimization** process
3. **Restart your computer** when prompted

### 🛠️ Manual Methods (Advanced Users)

#### Method 1: One-Click Launcher
```batch
# Right-click and "Run as Administrator"
optimize-now.bat
```

#### Method 2: PowerShell (Traditional)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy Bypass -Scope Process -Force
.\disable-services.ps1
```

#### Method 3: Direct Execution
```powershell
# Navigate to project folder and run:
PowerShell -ExecutionPolicy Bypass -File "disable-services.ps1"
```

### ✅ Verification

After running the script, verify the changes:
```powershell
Get-Service | Where-Object {$_.StartType -eq "Disabled"}
```

## 💻 Detailed Usage

### Script Execution Options

**Standard Optimization (Recommended):**
```powershell
.\disable-services.ps1
```

**With Custom Execution Policy:**
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
.\disable-services.ps1
```

### What Gets Optimized

The script intelligently disables the following service categories:

#### 🔒 Privacy & Telemetry Services
- Connected User Experiences and Telemetry
- Diagnostic Tracking
- Windows Error Reporting
- Customer Experience Improvement Program tasks

#### ⚡ Performance Services
- Windows Search (SearchIndexer)
- Superfetch/SysMain
- Background Intelligent Transfer Service (BITS)
- Windows Update Medic Service

#### 🎮 Gaming & Entertainment Services
- Xbox Live Auth Manager
- Xbox Game Save Service
- Xbox Accessory Management Service

#### 🌐 Network & Communication Services
- Remote Desktop Services
- Bluetooth Support Service
- Windows Connect Now

#### 📱 Device & Sensor Services
- Windows Biometric Service
- Sensor Monitoring Service
- Geolocation Service

### Safety Features

✅ **Critical System Services Preserved:**
- Windows Defender/Antivirus services
- Core Windows authentication
- Network connectivity services
- Hardware driver services
- System security services

## 🛠️ Manual Service Management

### Check Service Status
```powershell
# View all disabled services
Get-Service | Where-Object {$_.StartType -eq "Disabled"}

# Check specific service status
Get-Service "DiagTrack"
```

### Re-enable Services (if needed)
```powershell
# Re-enable a specific service
Set-Service "ServiceName" -StartupType Automatic
Start-Service "ServiceName"

# Example: Re-enable telemetry (not recommended)
Set-Service "DiagTrack" -StartupType Automatic
Start-Service "DiagTrack"
```

### Force Stop Services
```powershell
# Stop a running service
Stop-Service "ServiceName" -Force

# Stop multiple services
$services = @("Service1", "Service2", "Service3")
foreach ($service in $services) {
    Stop-Service $service -Force -ErrorAction SilentlyContinue
}
```

## 📊 Expected Results

### Performance Improvements
- **Faster boot times** - Reduced startup service load
- **Lower memory usage** - Disabled background services free up RAM
- **Improved responsiveness** - Less CPU usage from unnecessary services
- **Better battery life** - Reduced background activity on laptops

### Privacy Benefits
- **Reduced data collection** - Microsoft telemetry services disabled
- **Fewer background connections** - Less network activity to Microsoft servers
- **Enhanced privacy control** - More control over what Windows collects

## 🔧 Troubleshooting

### Common Issues

**"Execution Policy" Error:**
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
```

**"Access Denied" Error:**
- Ensure PowerShell is running as Administrator
- Right-click PowerShell → "Run as Administrator"

**Service Not Found:**
- Some services may not exist on all Windows installations
- The script handles missing services gracefully

**No Visible Changes:**
- Restart the computer for all changes to take effect
- Some services only activate during specific conditions

### Rollback Procedures

**Complete Rollback:**
```powershell
# Create rollback script
$services = @("DiagTrack", "dmwappushservice", "SysMain", "WSearch")
foreach ($service in $services) {
    Set-Service $service -StartupType Automatic -ErrorAction SilentlyContinue
    Start-Service $service -ErrorAction SilentlyContinue
}
```

**Selective Rollback:**
```powershell
# Re-enable specific services only
Set-Service "DiagTrack" -StartupType Automatic
Start-Service "DiagTrack"
```

## 📁 Project Structure

```
windows11-service-optimizer/
├── 📋 README.md              # This comprehensive documentation
├── 📜 disable-services.ps1   # Main optimization script (colorful!)
├── 📄 LICENSE                # MIT license file
├── 🔒 SECURITY.md            # Security policy & vulnerability reporting
├── 👥 CODE_OF_CONDUCT.md     # Community guidelines
├── 🤝 CONTRIBUTING.md        # Contribution guidelines
├── 🚀 optimize-now.bat       # One-click launcher
├── ⚙️ setup-optimizer.bat     # Automated setup script
└── 📋 Quick-Start.bat        # Quick start guide
```

### 🎯 One-Click Ready Features

🖱️ **Desktop Shortcut Creation**
- `setup-optimizer.bat` creates a desktop shortcut automatically
- Double-click optimization after initial setup

🚀 **Automated Launchers**
- `optimize-now.bat` - Checks admin privileges and runs optimization
- `Quick-Start.bat` - Interactive guide showing all usage methods

⚙️ **Smart Setup**
- `setup-optimizer.bat` configures PowerShell execution policy
- Creates desktop shortcuts and tests functionality
- Provides clear setup completion feedback

## 🧪 Testing & Validation

### Before Optimization
```powershell
# Check current service status
Get-Service | Where-Object {$_.Status -eq "Running"} | Measure-Object

# Check startup impact
Get-Service | Where-Object {$_.StartType -eq "Automatic"} | Measure-Object
```

### After Optimization
```powershell
# Verify disabled services
Get-Service | Where-Object {$_.StartType -eq "Disabled"} | Select-Object DisplayName

# Check system performance
Get-Process | Where-Object {$_.CPU -gt 0} | Sort-Object CPU -Descending | Select-Object -First 10
```

## 🔧 Advanced Configuration

### Custom Service List
You can modify the script to include/exclude specific services:

```powershell
# Edit the $services array in disable-services.ps1
$services = @(
    "DiagTrack",        # Connected User Experiences and Telemetry
    "dmwappushservice", # Device Management Wireless Application Protocol
    "SysMain",          # Superfetch/SysMain
    "WSearch"           # Windows Search
    # Add or remove services as needed
)
```

### Scheduled Task Management
The script also disables telemetry-related scheduled tasks:

```powershell
# View telemetry tasks before running script
Get-ScheduledTask | Where-Object {$_.TaskName -match "Telemetry|CEIP|Customer"}

# After running script, verify tasks are disabled
Get-ScheduledTask | Where-Object {$_.TaskName -match "Telemetry|CEIP|Customer"} | Select-Object TaskName, State
```

## 📝 Version History

- **v1.0.0** - Initial release with comprehensive service optimization
- **v1.1.0** - Added scheduled task management and improved error handling
- **v1.2.0** - Enhanced safety checks and detailed reporting

## 📄 License

MIT License - see LICENSE file for details.

## 🤝 Author

**Rezaul Karim**
Email: work.rezaul@outlook.com
Powered By: REZ LAB

---
<div align="center">
  <strong>⭐ If you find this tool helpful, please consider giving it a star on GitHub!</strong>
</div>
