# MVP Tool List

Target: 10 tools for Phase 2 launch. Total combined savings: ~$1,500–2,000/year.

---

## Status Key
- `[ ]` Not started
- `[~]` In research
- `[x]` Packaged and tested

---

## Tools

### 1. RustDesk
**Replaces:** TeamViewer / AnyDesk — ~$180/yr  
**Plain English:** Remote into any computer from anywhere — like TeamViewer, but free forever and no nagware.  
**Why it qualifies:** TeamViewer is notorious for flagging personal use as "commercial" and locking users out mid-session. AnyDesk charges ~$180/yr. RustDesk is unknown outside tech circles and setup requires comfort with networking concepts.  
**Packaging complexity:** Low-Medium — official MSI installer supports silent flags. Thin wrapper approach downloads and installs silently.  
**Note:** Default to public relay servers for non-technical users — self-hosting is optional and not required for basic use.  
**POC:** Yes — first packaged installer. See `installers/rustdesk/`.  
**Status:** `[~]`

---

### 2. Stirling PDF
**Replaces:** Adobe Acrobat — ~$240/yr  
**Plain English:** Do everything with PDFs — merge, split, compress, convert, edit — without uploading your files to the cloud.  
**Why it qualifies:** Acrobat is expensive and overkill for most users. Stirling PDF is a local web app that runs on your machine with a clean UI.  
**Packaging complexity:** Medium — runs as a local server, needs a launcher. Self-contained installer is achievable.  
**Status:** `[ ]`

---

### 3. Ollama + Open WebUI
**Replaces:** ChatGPT Plus — ~$240/yr  
**Plain English:** Run AI chat models privately on your own computer. No internet required, no data sent anywhere.  
**Why it qualifies:** Most people don't know local AI is possible. Setup requires terminal work.  
**Packaging complexity:** High — requires model downloads (large files), local server process, potentially Docker. Consider Phase 2.  
**Status:** `[ ]`

---

### 4. Actual Budget
**Replaces:** YNAB — ~$109/yr  
**Plain English:** Track your spending and budget by paycheck, not by month. Syncs with your bank.  
**Why it qualifies:** YNAB is the gold standard but $109/yr. Actual Budget is the closest open source equivalent with a polished UI.  
**Packaging complexity:** Low — has its own installer, may be able to wrap it.  
**Status:** `[ ]`

---

### 5. Syncthing
**Replaces:** Dropbox / Google Drive — ~$120/yr  
**Plain English:** Keep files synced between your devices without storing them on someone else's server.  
**Why it qualifies:** Most people don't know peer-to-peer sync exists. Setup has a learning curve.  
**Packaging complexity:** Low — binary is simple, just needs a clean installer + autostart config.  
**Status:** `[ ]`

---

### 6. Jellyfin
**Replaces:** Plex Pass — ~$120/yr  
**Plain English:** Turn your computer into a personal Netflix for your movie and TV collection.  
**Why it qualifies:** Plex is well-known but charges for features Jellyfin gives free. Jellyfin setup intimidates non-technical users.  
**Packaging complexity:** Medium — server + web UI, needs port config. Doable.  
**Status:** `[ ]`

---

### 7. AppFlowy
**Replaces:** Notion — ~$192/yr  
**Plain English:** An all-in-one workspace for notes, docs, and to-do lists that lives on your computer.  
**Why it qualifies:** Notion is ubiquitous but charges for teams. AppFlowy is local-first with a polished UI.  
**Packaging complexity:** Low — has its own Windows installer.  
**Note:** May be borderline on editorial filter — AppFlowy has decent brand awareness and its own distribution. Watch this one.  
**Status:** `[ ]`

---

### 8. LocalSend
**Replaces:** Paid file transfer tools — ~$50+/yr  
**Plain English:** Send files to any device on your Wi-Fi instantly — like AirDrop but for Windows, Android, and everything else.  
**Why it qualifies:** Cross-platform local transfer is a genuinely unsolved pain point for most Windows users.  
**Packaging complexity:** Low — clean app, simple installer.  
**Note:** Frame as "send files to any device" not "replaces AirDrop" — AirDrop is Mac-only, Windows users don't have context for that.  
**Status:** `[ ]`

---

### 9. Upscayl
**Replaces:** Topaz Gigapixel AI — ~$199 one-time  
**Plain English:** Make blurry or low-resolution photos sharp and high quality using AI — runs on your GPU, totally offline.  
**Why it qualifies:** Topaz is expensive one-time software. Upscayl is genuinely good and totally unknown outside tech circles.  
**Packaging complexity:** Low — has its own installer.  
**Status:** `[ ]`

---

### 10. Ditto Clipboard Manager
**Replaces:** Paid clipboard tools — ~$20+/yr  
**Plain English:** Remember everything you've copied — search and paste from your full clipboard history.  
**Why it qualifies:** Built into Windows 11 (Win+V) but hidden. Ditto is more powerful and works on older Windows.  
**Packaging complexity:** Very low — tiny binary, silent install.  
**Note:** Low savings number. Consider whether this earns a spot in the MVP 10.  
**Status:** `[ ]`

---

---

## Candidates to Replace Ditto (if cut)

Ditto has a low savings number and Windows 11 has clipboard history built in. Consider:
- **ShareX** — screenshots, screen recording, annotations, uploads. Replaces Snagit (~$63/yr). Strong candidate.
- **Ventoy** — create bootable USB drives for multiple OS installers. More niche.
- **Bulk Rename Utility** — rename thousands of files with rules. Replaces paid batch renamers.
