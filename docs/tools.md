# MVP Tool List

Target: 10 tools for Phase 2 launch. Total combined savings: ~$1,300–1,800/year.

---

## Status Key
- `[ ]` Not started
- `[~]` In research
- `[x]` Packaged and tested

---

## Tools

### 1. Stirling PDF
**Replaces:** Adobe Acrobat — ~$240/yr  
**Plain English:** Do everything with PDFs — merge, split, compress, convert, edit — without uploading your files to the cloud.  
**Why it qualifies:** Acrobat is expensive and overkill for most users. Stirling PDF is a local web app that runs on your machine with a clean UI.  
**Packaging complexity:** Medium — runs as a local server, needs a launcher. Self-contained installer is achievable.  
**POC candidate:** Yes — leading candidate for the first packaged installer.  
**Status:** `[~]`

---

### 2. Ollama + Open WebUI
**Replaces:** ChatGPT Plus — ~$240/yr  
**Plain English:** Run AI chat models privately on your own computer. No internet required, no data sent anywhere.  
**Why it qualifies:** Most people don't know local AI is possible. Setup requires terminal work.  
**Packaging complexity:** High — requires model downloads (large files), local server process, potentially Docker. Consider Phase 2.  
**Status:** `[ ]`

---

### 3. Actual Budget
**Replaces:** YNAB — ~$109/yr  
**Plain English:** Track your spending and budget by paycheck, not by month. Syncs with your bank.  
**Why it qualifies:** YNAB is the gold standard but $109/yr. Actual Budget is the closest open source equivalent with a polished UI.  
**Packaging complexity:** Low — has its own installer, may be able to wrap it.  
**Status:** `[ ]`

---

### 4. Syncthing
**Replaces:** Dropbox / Google Drive — ~$120/yr  
**Plain English:** Keep files synced between your devices without storing them on someone else's server.  
**Why it qualifies:** Most people don't know peer-to-peer sync exists. Setup has a learning curve.  
**Packaging complexity:** Low — binary is simple, just needs a clean installer + autostart config.  
**Status:** `[ ]`

---

### 5. Jellyfin
**Replaces:** Plex Pass — ~$120/yr  
**Plain English:** Turn your computer into a personal Netflix for your movie and TV collection.  
**Why it qualifies:** Plex is well-known but charges for features Jellyfin gives free. Jellyfin setup intimidates non-technical users.  
**Packaging complexity:** Medium — server + web UI, needs port config. Doable.  
**Status:** `[ ]`

---

### 6. AppFlowy
**Replaces:** Notion — ~$192/yr  
**Plain English:** An all-in-one workspace for notes, docs, and to-do lists that lives on your computer.  
**Why it qualifies:** Notion is ubiquitous but charges for teams. AppFlowy is local-first with a polished UI.  
**Packaging complexity:** Low — has its own Windows installer.  
**Note:** May be borderline on editorial filter — AppFlowy has decent brand awareness and its own distribution. Watch this one.  
**Status:** `[ ]`

---

### 7. LocalSend
**Replaces:** Paid file transfer tools — ~$50+/yr  
**Plain English:** Send files to any device on your Wi-Fi instantly — like AirDrop but for Windows, Android, and everything else.  
**Why it qualifies:** Cross-platform local transfer is a genuinely unsolved pain point for most Windows users.  
**Packaging complexity:** Low — clean app, simple installer.  
**Note:** Frame as "send files to any device" not "replaces AirDrop" — AirDrop is Mac-only, Windows users don't have context for that.  
**Status:** `[ ]`

---

### 8. Upscayl
**Replaces:** Topaz Gigapixel AI — ~$199 one-time  
**Plain English:** Make blurry or low-resolution photos sharp and high quality using AI — runs on your GPU, totally offline.  
**Why it qualifies:** Topaz is expensive one-time software. Upscayl is genuinely good and totally unknown outside tech circles.  
**Packaging complexity:** Low — has its own installer.  
**Status:** `[ ]`

---

### 9. Ditto Clipboard Manager
**Replaces:** Paid clipboard tools — ~$20+/yr  
**Plain English:** Remember everything you've copied — search and paste from your full clipboard history.  
**Why it qualifies:** Built into Windows 11 (Win+V) but hidden. Ditto is more powerful and works on older Windows.  
**Packaging complexity:** Very low — tiny binary, silent install.  
**Note:** Low savings number. Consider whether this earns a spot in the MVP 10.  
**Status:** `[ ]`

---

### 10. HandBrake
**Replaces:** Paid video converters — ~$30+/yr  
**Plain English:** Convert any video file to any format without watermarks or file size limits.  
**Why it qualifies:** Most people don't know free options exist and pay for converters.  
**Packaging complexity:** Very low — has its own installer.  
**Note:** HandBrake is already fairly well-known and easy to install. May not pass editorial filter criteria #2. Consider swapping for a less-known alternative.  
**Status:** `[ ]`

---

## Candidates to Replace HandBrake / Ditto

If either gets cut, consider:
- **Ventoy** — create bootable USB drives for multiple OS installers. Replaces Rufus alternatives.
- **Bulk Rename Utility** — rename thousands of files with rules. Replaces paid batch renamers.
- **ShareX** — screenshots, screen recording, annotations, uploads. Replaces Snagit (~$63/yr).
- **KeePassXC** — local password manager. Replaces LastPass/1Password (~$36/yr). (Check brand awareness filter.)
