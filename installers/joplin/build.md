# Joplin — Build Notes

## What This Does

Wraps the official Joplin NSIS installer in a clean UnSubD-branded experience. Downloads the official release from GitHub (~243 MB) and installs silently.

## Build Steps

1. Ensure `installers/assets/wizard-side.png` and `wizard-small.png` exist (run `installers/generate-assets.ps1` if not)
2. Open `build.iss` in Inno Setup
3. Press `Ctrl+F9` to compile
4. Find `Output\UnSubD-Joplin-Setup.exe`

## Updating the Joplin Version

1. Open `build.iss`
2. Update `#define AppVersion "3.5.13"` to the new version
3. Confirm the filename format matches the GitHub release: `Joplin-Setup-X.X.X.exe`
4. Confirm the tag format in the URL: releases use `vX.X.X` prefix (e.g. `v3.5.13`)
5. Rebuild

## Silent Install Flags

Joplin uses NSIS:

```
Joplin-Setup-X.X.X.exe /S /allusers
```

- `/S` — silent install, no UI
- `/allusers` — installs for all users on the machine (puts it in Program Files)

Omit `/allusers` to install for current user only (installs to AppData).

## File Size

~243 MB — significantly larger than RustDesk. The download progress bar in the wizard is important here. On a typical home connection (~50 Mbps) expect ~40 seconds. On a slow connection (~10 Mbps) expect ~3 minutes. The wizard copy sets this expectation upfront.

## SmartScreen Behavior

Same as RustDesk — unsigned installer will show UAC prompt. No hard SmartScreen block observed in testing on Windows 11. See `installers/rustdesk/build.md` for code signing options.

## Known Issues / Gotchas

- **Large download:** 243 MB is the full Electron app. No way around this — Joplin bundles its own Chromium runtime.
- **Sync setup:** After install, Joplin is fully functional offline. Sync (Dropbox, OneDrive, Nextcloud) is opt-in and configured inside the app — no setup required from our installer.
- **Auto-update:** Joplin has its own built-in updater. Users will be prompted to update from within the app.
