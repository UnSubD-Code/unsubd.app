# Installers

Each subdirectory contains the Inno Setup script and build notes for one UnSubD-packaged tool.

## Tooling Required

- **Inno Setup 6** — free, download from innosetup.org
- **PowerShell** — for generating branded wizard images (built into Windows)

## How to Build Any Installer

1. Install Inno Setup 6 from innosetup.org
2. Run `generate-assets.ps1` if `assets/wizard-side.png` and `assets/wizard-small.png` don't exist
3. Open the `build.iss` file in the tool's folder
4. Press `Ctrl+F9` (or Build → Compile) to compile
5. The output `.exe` will appear in the `Output/` folder (gitignored)

## Folder Structure

```
installers/
├── README.md              ← this file
├── generate-assets.ps1    ← generates branded wizard images using .NET System.Drawing
├── assets/
│   ├── wizard-side.png    ← 164×314, Inno Setup left panel (dark bg + gradient bar + "Un SubD")
│   └── wizard-small.png   ← 55×55, Inno Setup header icon
└── <tool-name>/
    ├── build.iss          ← Inno Setup script
    └── build.md           ← tool-specific notes, silent flags, gotchas
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

All production installers must be code-signed before public distribution. See `docs/brief.md` — Open Issues section for options and costs.

**Actual SmartScreen behavior (tested on Windows 11):** Unsigned installers show the standard UAC elevation prompt only — no hard SmartScreen block observed. This is better than worst-case, but a code signing cert is still required before sharing publicly to avoid any friction with non-technical users.

## Output Files

The `Output/` folder in each tool directory is gitignored — compiled `.exe` files are not committed to the repo. Build locally, then host on GitHub Releases or a CDN.
