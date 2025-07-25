# Security and Code Scanning Configuration

This repository is a Jekyll-based GitHub Pages site with no custom Ruby source code that requires security scanning.

## CodeQL Scanning

CodeQL scanning has been disabled for this repository because:

1. No custom Ruby source code exists (only Jekyll build configuration)
2. Ruby is used only for the Jekyll build process, not for application logic
3. Security scanning is not applicable to this use case

### Configuration Files

- `.github/codeql/codeql-config.yml` - Disables CodeQL scanning
- `.github/dependabot.yml` - Removed bundler configuration (no Gemfile to manage)

### Manual Steps Required

If CodeQL scanning was enabled through GitHub repository settings, it may need to be manually disabled via:
1. Go to repository Settings
2. Navigate to Security & analysis
3. Disable CodeQL analysis

This configuration ensures that no automated security scanning runs for this Jekyll-only repository.