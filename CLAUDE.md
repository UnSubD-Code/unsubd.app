# UnSubbed

An app store for open source Windows software. We find obscure GitHub tools that replace paid subscriptions, package them as clean one-click Windows installers, and make them accessible to non-technical users. The value is curation, packaging, and trust — not the software itself.

Live at: **https://unsubd.app**

---

## Current State

Phase 1 — validation landing page is live with tool listings and email capture. Three tools shown on the site. Three more teased as "coming soon" in the sidebar.

**Live on the site:**
- RustDesk (replaces TeamViewer, installer built + tested on Windows 11)
- Joplin (replaces Evernote, installer built + tested)
- Stirling PDF (replaces Adobe Acrobat, installer script written — needs build + test)

**Coming soon (sidebar placeholders):**
- Actual Budget, Jellyfin, Syncthing

**Site features live:**
- Email capture via Formspree — active, form ID: `mjgjljpq`
- Honesty box — upfront $19 one-time pricing on the landing page
- Favicon — `favicon.svg` (icon only, gradient rounded square)
- Open Graph + Twitter Card meta tags — `og-image.png` live at root
- Social media accounts: X (@UnsubdHQ), Instagram (@unsubd.app)

---

## Tech Stack

| Layer | Choice |
|---|---|
| Frontend | Plain HTML/CSS/JS (no framework — static site) |
| Hosting | Cloudflare Pages |
| DNS | Cloudflare (nameservers transferred from Namecheap) |
| Email capture | Formspree — active, form ID: `mjgjljpq` |
| Installer tooling | Inno Setup 6 |
| Version control | GitHub — `UnSubD-Code/unsubd.app` |

---

## Running Locally

No build step. Open `index.html` directly in a browser.

```bash
# Or use any local server
npx serve .
```

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
├── CLAUDE.md                     ← you are here
├── index.html                    ← landing page
├── style.css                     ← landing page styles
├── script.js                     ← Formspree form handler + sidebar switcher
├── favicon.svg                   ← site favicon (icon only, no text)
├── og-image.png                  ← 1200×630 Open Graph preview image
├── unsubd-logo-v4.html           ← logo reference (SVG)
├── UNSUBBED.pdf                  ← original project brief
├── .gitignore
├── assets/
│   ├── generate-og-image.html    ← canvas tool to regenerate og-image.png
│   └── logos/
│       ├── teamviewer.svg        ← white fill, on blue gradient background
│       ├── evernote.svg          ← white fill, on green gradient background
│       ├── adobe-acrobat.svg     ← white fill, on red gradient background (black slash)
│       ├── rustdesk.svg          ← white fill, on dark gradient-border box
│       ├── joplin.svg            ← white fill, on dark gradient-border box
│       ├── stirling.png          ← Stirling PDF logo, on dark gradient-border box
│       ├── unsubd-profile.svg    ← 400×400 icon for X profile picture
│       ├── download-profile-png.html ← canvas PNG downloader for X profile pic
│       └── download-banner-png.html  ← canvas PNG downloader for X banner (1500×500)
├── installers/
│   ├── README.md                 ← how to build any installer
│   ├── generate-assets.ps1       ← generates branded Inno Setup wizard images
│   ├── assets/
│   │   ├── wizard-side.png       ← 164×314, Inno Setup left panel image
│   │   └── wizard-small.png      ← 55×55, Inno Setup header icon
│   ├── rustdesk/
│   │   ├── build.iss             ← Inno Setup script (v1.4.6)
│   │   └── build.md
│   ├── joplin/
│   │   ├── build.iss             ← Inno Setup script (v3.5.13)
│   │   └── build.md
│   └── stirling-pdf/
│       ├── build.iss             ← Inno Setup script (v2.10.0 MSI, downloads during install)
│       └── build.md
└── docs/
    ├── brief.md                  ← project concept, positioning, GTM
    ├── tools.md                  ← MVP tool list with packaging notes
    ├── brand.md                  ← colors, fonts, tone, taglines
    └── social-media-content.md  ← X, Instagram, Reddit post copy + strategy
```

---

## Logo Notes

Paid app logos use a diagonal slash overlay via CSS `::after`. Slash color varies:
- **Red slash** (default `.logo-paid`): TeamViewer, Evernote — slash is visible against their colored backgrounds
- **Black slash** (`.logo-paid.slash-dark`): Adobe Acrobat — red slash would be invisible on the red background

Free app logos use a dark box with gradient border (`.logo-free`).

---

## OG Image

The `og-image.png` at the repo root is the 1200×630 social preview image. To regenerate it:
1. Open `assets/generate-og-image.html` in a browser
2. Click "Download og-image.png"
3. Save to repo root, commit, and push

---

## What's Next

- [ ] Set up payment — Gumroad, $19 one-time product
- [ ] Host installer .exe files on GitHub Releases + wire up Easy Installer buttons
- [ ] Enable Cloudflare Analytics (free, already on account — add one script tag)
- [ ] Move email capture to Mailchimp or ConvertKit — set up welcome email
- [ ] Build + test Stirling PDF installer (open `installers/stirling-pdf/build.iss` in Inno Setup)
- [ ] Code signing cert (Certum Standard EV or Sectigo EV) — defer until installer buttons are wired
- [ ] Evaluate replacing brand logos with text labels before public launch (trademark risk — see `docs/brief.md`)
- [ ] Define free vs. paid access split
- [ ] Phase 2: full browsing UI with all 10 tools
