# RustDesk — Build Notes

## What This Does

Wraps the official RustDesk MSI installer in a clean UnSubD-branded experience. The user runs our `.exe`, sees a welcome screen explaining what RustDesk is and what it replaces, and RustDesk installs silently in the background.

## Build Steps

1. Install Inno Setup from innosetup.org
2. Open `build.iss` in Inno Setup
3. Press `Ctrl+F9` to compile
4. Find `Output\UnSubD-RustDesk-Setup.exe`

## Updating the RustDesk Version

When RustDesk releases a new version:

1. Open `build.iss`
2. Update `#define AppVersion "1.3.8"` to the new version number
3. Confirm the MSI filename format matches the GitHub release (check: github.com/rustdesk/rustdesk/releases)
4. Rebuild

## Silent Install Flags

RustDesk's official MSI supports standard Windows Installer flags:

```
msiexec /i rustdesk.msi /quiet /qn /norestart
```

- `/quiet` — minimal UI
- `/qn` — no UI at all
- `/norestart` — suppress automatic reboot

## SmartScreen Behavior (Unsigned)

Without a code signing certificate, Windows will show a SmartScreen warning:
> "Windows protected your PC — Microsoft Defender SmartScreen prevented an unrecognized app from starting."

Users must click "More info" → "Run anyway" to proceed. This is a significant friction point for non-technical users.

**Testing checklist:**
- [ ] Run on Windows 11 24H2 — document exact SmartScreen experience
- [ ] Run on Windows 10 — document experience
- [ ] Confirm RustDesk installs and launches after bypassing warning
- [ ] Confirm uninstall works via Add/Remove Programs

## Code Signing (Pre-Launch Requirement)

Before sharing publicly, sign the installer. To enable signing, uncomment the `SignTool` line in `build.iss` and configure your certificate.

Options ranked by SmartScreen trust:
| Option | Cost | SmartScreen |
|---|---|---|
| Unsigned | $0 | Blocked — user must click through |
| Sectigo OV cert | ~$100/yr | Warning reduced, not eliminated |
| DigiCert EV cert | ~$400/yr | Best trust, fastest reputation |

Note: As of March 2024, even EV certs require reputation accumulation. There is no instant SmartScreen bypass.

## Known Issues / Gotchas

- **File size:** RustDesk MSI is ~20MB. Download during install adds ~10–30 seconds on a typical connection. Consider showing a progress bar (already implemented in the script).
- **Antivirus false positives:** Remote desktop tools are sometimes flagged. May need to submit to AV vendors for whitelisting before launch.
- **RustDesk relay servers:** Default install uses RustDesk's public relay servers. This is fine for typical use but worth noting in the tool description — privacy-conscious users can self-host.
