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
2. Update `#define AppVersion "1.4.6"` to the new version number
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

**Tested on Windows 11** — unsigned installer showed the standard UAC elevation prompt ("Do you want to allow this app to make changes to your device?") only. No hard SmartScreen block observed. Users click Yes and the install proceeds normally.

This is better than feared. The hard SmartScreen block ("Windows protected your PC") was not triggered. However, this may vary by machine depending on SmartScreen reputation settings. Code signing is still required before public distribution.

**Testing checklist:**
- [x] Run on Windows 11 — standard UAC only, no SmartScreen block
- [ ] Run on Windows 10 — not yet tested
- [x] Confirm RustDesk installs and launches after UAC prompt
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
