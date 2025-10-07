# Contributing to Windows 11 Service Optimizer

We love your input! We want to make contributing to this project as easy and transparent as possible, whether it's:

- Reporting a bug
- Discussing the current state of the code
- Submitting a fix
- Proposing new features
- Becoming a maintainer

## Development Process

We use GitHub to host code, to track issues and feature requests, as well as accept pull requests.

1. Fork the repo and create your branch from `main`
2. If you've added code that should be tested, add tests
3. If you've changed APIs, update the documentation
4. Ensure the test suite passes
5. Make sure your code lints
6. Issue that pull request!

## Testing

Before submitting changes, please ensure:

- The script runs without errors on Windows 10/11
- All services in the list exist and can be safely disabled
- No critical system services are affected
- The script provides helpful error messages for missing services

### Manual Testing Checklist

- [ ] Run script as Administrator
- [ ] Verify services are properly disabled
- [ ] Check that critical services remain untouched
- [ ] Test rollback functionality
- [ ] Verify PowerShell execution policy handling

## PowerShell Script Guidelines

### Code Style
- Use `Write-Host` with appropriate colors for user feedback
- Include error handling with `try/catch` blocks
- Use descriptive variable names
- Comment complex operations

### Service Management
- Only disable services that are safe to disable
- Provide clear feedback about what's being disabled
- Handle cases where services don't exist gracefully
- Include rollback instructions in documentation

## Pull Request Process

1. **Fork and create a branch**: Create a feature branch from `main`
2. **Make your changes**: Implement your feature or bug fix
3. **Add tests**: If applicable, add tests for new functionality
4. **Update documentation**: Update README.md and other docs as needed
5. **Submit PR**: Create a pull request with a clear title and description

### PR Requirements

- [ ] Clear description of changes
- [ ] Reference any related issues
- [ ] Screenshots/videos if UI changes (not applicable for this project)
- [ ] Passes all existing tests
- [ ] New code is properly commented

## Reporting Bugs

Report bugs using GitHub's [issue tracker](https://github.com/rezaulwork/windows11-service-optimizer/issues).

**Great Bug Reports** tend to have:

- A quick summary and/or background
- Steps to reproduce
  - Be specific!
  - Give sample code if you can
- What you expected would happen
- What actually happens
- Notes (possibly including why you think this might be happening, or stuff you tried that didn't work)

## Feature Requests

Feature requests are welcome! Please provide:

- **Use case**: Describe the problem you're trying to solve
- **Proposed solution**: How you think it should work
- **Alternatives considered**: Other solutions you've considered
- **Additional context**: Screenshots, mockups, or examples

## Community Guidelines

Please follow our [Code of Conduct](CODE_OF_CONDUCT.md) in all interactions.

## Recognition

Contributors will be recognized in the README.md file and project documentation.

## Getting Help

If you need help, please:

1. Check the [Issues](https://github.com/rezaulwork/windows11-service-optimizer/issues) page
2. Search existing documentation
3. Ask questions on GitHub Issues

## Project Structure

```
windows11-service-optimizer/
├── disable-services.ps1    # Main script
├── README.md              # Project documentation
├── CONTRIBUTING.md        # This file
├── CODE_OF_CONDUCT.md     # Community guidelines
├── SECURITY.md           # Security policy
└── LICENSE               # MIT license
```

## License

By contributing, you agree that your contributions will be licensed under the same license as the original project (MIT License).

## Contact

- **Author**: Rezaul Karim
- **Email**: work.rezaul@outlook.com
- **GitHub**: [@rezaulwork](https://github.com/rezaulwork)

---

*This project is maintained by [REZ LAB](https://github.com/rezaulwork)*
