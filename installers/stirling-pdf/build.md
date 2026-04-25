# Stirling PDF — Build Notes

**Version:** 2.10.0  
**Replaces:** Adobe Acrobat (~$240/yr)  
**GitHub:** https://github.com/Stirling-Tools/Stirling-PDF

## Release Asset

```
Stirling-PDF-windows-x86_64.msi
https://github.com/Stirling-Tools/Stirling-PDF/releases/download/v2.10.0/Stirling-PDF-windows-x86_64.msi
```

## Silent Install Flags

Standard MSI silent install:
```
msiexec.exe /i "Stirling-PDF-windows-x86_64.msi" /quiet /qn /norestart
```

## What It Installs

Stirling PDF runs as a local web server that opens in your browser. After install it:
- Adds a Start menu shortcut ("Stirling PDF")
- Launches the local server on http://localhost:8080 when opened
- Files are processed locally — nothing is uploaded to the cloud

## Notes

- The app opens in the default browser at localhost:8080 — worth noting in the site description so users know to expect a browser tab, not a traditional window
- No Java required — the MSI bundles the runtime
- First launch may take 5–10 seconds while the server starts
- Windows Firewall may prompt to allow local network access — safe to allow

## Updating Version

1. Check https://github.com/Stirling-Tools/Stirling-PDF/releases for latest
2. Update `AppVersion` in `build.iss`
3. Confirm the MSI filename matches the new release asset name
4. Rebuild
