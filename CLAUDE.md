# UnSubbed

An app store for open source Windows software. We find obscure GitHub tools that replace paid subscriptions, package them as clean one-click Windows installers, and make them accessible to non-technical users. The value is curation, packaging, and trust — not the software itself.

Live at: **https://unsubd.app**

---

## Current State

Phase 1 — validation landing page is live with tool listings. Email capture via Formspree (form ID not yet activated). Two tools fully packaged and shown on the site. Four more tools teased as "coming soon" in the sidebar.

**Live on the site:**
- RustDesk (replaces TeamViewer, installer built + tested on Windows 11)
- Joplin (replaces Evernote, installer built + tested)

**Coming soon (sidebar placeholders):**
- Actual Budget, Jellyfin, Stirling PDF, Syncthing

---

## Tech Stack

| Layer | Choice |
|---|---|
| Frontend | Plain HTML/CSS/JS (no framework — static site) |
| Hosting | Cloudflare Pages |
| DNS | Cloudflare (nameservers transferred from Namecheap) |
| Email capture | Formspree (form ID placeholder — not yet activated) |
| Installer tooling | Inno Setup 6 |
| Version control | GitHub — `UnSubD-Code/unsubd.app` |

---

## Running Locally

No build step. Open `index.html` directly in a browser.

```bash
# Or use any local server
npx serve .
```

Note: The Formspree form submission won't work locally unless you've set up the form ID (see below). The UI still renders correctly.

---

## Deployment

Every push to `master` auto-deploys via Cloudflare Pages.

```bash
git add .
git commit -m "your message"
git push
```

Cloudflare picks it up within ~30 seconds. No build command, no output directory — it serves the root of the repo.

---

## Formspree Setup

The email capture form in `index.html` uses Formspree. To activate it:

1. Sign up at formspree.io
2. Create a new form
3. Copy the form ID (looks like `xabcdefg`)
4. In `index.html`, find this line:

```html
<form id="email-form" action="https://formspree.io/f/YOUR_FORM_ID" method="POST">
```

5. Replace `YOUR_FORM_ID` with your actual ID → commit → push

---

## Brand

See `docs/brand.md` for the full brand guide.

**Quick reference:**
- Background: `#0f0f0f`
- Gradient: `#FF4500` → `#FF6BCB` → `#00C3FF` (135deg)
- Font: `'Trebuchet MS', 'Gill Sans', sans-serif`
- Tone: plain English, anti-establishment but trustworthy, never technical jargon
- Tagline: "Free software. No strings."
- The villain: the monthly subscription

---

## Folder Structure

```
unsubd.app/
├── CLAUDE.md              ← you are here
├── index.html             ← landing page
├── style.css              ← landing page styles
├── script.js              ← Formspree form handler + sidebar switcher
├── unsubd-logo-v4.html    ← logo reference (SVG)
├── UNSUBBED.pdf           ← original project brief
├── .gitignore
├── assets/
│   └── logos/
│       ├── teamviewer.svg ← white fill, displayed on blue gradient background
│       ├── evernote.svg   ← white fill, displayed on green gradient background
│       ├── rustdesk.svg   ← white fill, displayed on dark gradient-border box
│       └── joplin.svg     ← white fill, displayed on dark gradient-border box
├── installers/
│   ├── README.md          ← how to build any installer
│   ├── generate-assets.ps1 ← generates branded Inno Setup wizard images
│   ├── assets/
│   │   ├── wizard-side.png  ← 164×314, Inno Setup left panel image
│   │   └── wizard-small.png ← 55×55, Inno Setup header icon
│   ├── rustdesk/
│   │   ├── build.iss      ← Inno Setup script (v1.4.6)
│   │   └── build.md
│   └── joplin/
│       ├── build.iss      ← Inno Setup script (v3.5.13)
│       └── build.md
└── docs/
    ├── brief.md           ← project concept, positioning, GTM
    ├── tools.md           ← MVP tool list with packaging notes
    └── brand.md           ← colors, fonts, tone, taglines
```

---

## What's Next

- [ ] Activate Formspree (drop in form ID once signed up at formspree.io)
- [ ] Host installer .exe files (GitHub Releases) and wire up Easy Installer buttons
- [ ] Evaluate replacing brand logos with text labels before public launch (trademark risk — see `docs/brief.md`)
- [ ] Code signing cert before public distribution
- [ ] Define free vs. paid access split
- [ ] Build next installer (Stirling PDF is the leading candidate)
- [ ] Phase 2: full browsing UI with all 10 tools
