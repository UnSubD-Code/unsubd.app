# Installers

Each subdirectory contains the Inno Setup script and build notes for one UnSubD-packaged tool.

## Tooling Required

- **Inno Setup** — free, download from innosetup.org
- No other dependencies

## How to Build Any Installer

1. Install Inno Setup
2. Open the `build.iss` file in the tool's folder
3. Press `Ctrl+F9` (or Build → Compile) to compile
4. The output `.exe` will appear in the `Output/` folder (gitignored)

## Folder Structure

```
installers/
├── README.md          ← this file
└── <tool-name>/
    ├── build.iss      ← Inno Setup script
    └── build.md       ← tool-specific notes, silent flags, gotchas
```

## Approach

All installers use the **thin wrapper / download-during-install** pattern:

1. User runs our `.exe`
2. Installer downloads the official release from the tool's GitHub
3. Runs the official installer silently in the background
4. User sees a clean progress/success screen
5. App is ready — no setup required

This keeps our binaries small, ensures users always get the latest version, and avoids redistribution concerns.

## Code Signing

All production installers must be code-signed before public distribution.
See `docs/brief.md` — Open Issues section for the current status and options.
Unsigned installers will trigger Windows SmartScreen warnings on Windows 11 24H2+.

## Output Files

The `Output/` folder in each tool directory is gitignored — compiled `.exe` files are not committed to the repo. Build locally, then host on GitHub Releases or a CDN.
