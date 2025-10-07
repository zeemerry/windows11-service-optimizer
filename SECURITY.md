# Security Policy

## Supported Versions

The following versions of Windows 11 Service Optimizer are currently supported with security updates:

| Version | Supported          |
| ------- | ------------------ |
| 1.2.x   | :white_check_mark: |
| 1.1.x   | :white_check_mark: |
| 1.0.x   | :x:                |
| < 1.0  | :x:                |

## Reporting Security Vulnerabilities

We take the security of Windows 11 Service Optimizer seriously. If you discover a security vulnerability, please report it responsibly.

**Please do not open public issues for security vulnerabilities.**

### How to Report

1. **Email**: Send details to work.rezaul@outlook.com
2. **Include**: Detailed description of the vulnerability, steps to reproduce, and potential impact
3. **Response Time**: We aim to acknowledge receipt within 24 hours
4. **Resolution**: Security issues will be prioritized and addressed promptly

### What to Include in Your Report

- **Description**: Clear description of the vulnerability
- **Steps to Reproduce**: Detailed steps to reproduce the issue
- **Affected Versions**: Which versions are affected
- **System Information**: Windows version, PowerShell version
- **Impact Assessment**: Potential consequences if exploited
- **Suggested Fix**: If you have suggestions for fixing the issue

## Security Considerations

### Safe Service Management

This script only disables services that are considered safe to disable:

- ✅ **Safe to Disable**: Telemetry, gaming services, background apps
- ❌ **Never Disabled**: Critical system services, security services, drivers

### Execution Safety

- Script requires Administrator privileges (intentional security feature)
- All service changes are reversible
- No system files are modified
- No registry changes that could break Windows

### User Responsibility

- Users should backup important data before running
- Test in a virtual machine first if concerned about stability
- Review the list of services being disabled
- Understand that system behavior may change

## Best Practices

### Before Running the Script

1. **Create System Restore Point**:
   ```powershell
   # Open System Properties → System Protection → Create
   ```

2. **Backup Important Data**: Ensure all important files are backed up

3. **Review Service List**: Check what services will be disabled

4. **Test in Safe Environment**: Consider testing on a non-production system first

### After Running the Script

1. **Monitor System Behavior**: Watch for any unexpected issues
2. **Verify Service Status**: Check which services were actually disabled
3. **Test Critical Functionality**: Ensure important applications still work
4. **Document Changes**: Note any issues for future reference

## Rollback Procedures

If you encounter issues after running the script:

### Method 1: System Restore
1. Open System Properties → System Protection
2. Click "System Restore"
3. Choose the restore point created before running the script

### Method 2: Manual Service Restoration
```powershell
# Re-enable specific services
Set-Service "DiagTrack" -StartupType Automatic
Start-Service "DiagTrack"

# Re-enable multiple services
$services = @("DiagTrack", "SysMain", "WSearch")
foreach ($service in $services) {
    Set-Service $service -StartupType Automatic -ErrorAction SilentlyContinue
    Start-Service $service -ErrorAction SilentlyContinue
}
```

## Security Updates

When security vulnerabilities are discovered and fixed:

1. **New Release**: A new version will be released with fixes
2. **Changelog**: Security fixes will be documented in release notes
3. **Notification**: Major security updates will be announced
4. **Migration Guide**: Instructions for updating from older versions

## Responsible Disclosure

We believe in responsible disclosure and will:

- Acknowledge receipt of your report within 24 hours
- Work diligently to investigate and reproduce the issue
- Keep you informed of our progress
- Credit you in the fix (with your permission)
- Release fixes in a timely manner

## Contact Information

- **Security Reports**: work.rezaul@outlook.com
- **General Support**: work.rezaul@outlook.com
- **GitHub Issues**: [Report Issues](https://github.com/rezaulwork/windows11-service-optimizer/issues)

## Legal Notice

This security policy does not create any legal obligations or waive any rights. All security matters are handled at the sole discretion of the project maintainers.

---

*Last updated: October 2025*
