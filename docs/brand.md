# Brand Guide

## Name
**UnSubD** (stylized) / **UnSubbed** (spoken/written)  
Domain: unsubd.app

---

## Taglines
- "Free software. No strings." ← primary, use this first
- "Cancel everything."
- "Your subscriptions are optional."
- "The free alternative to everything."

---

## Positioning
People are paying monthly for software that has a free open source alternative they've never heard of. UnSubbed finds those alternatives, packages them cleanly, and makes them installable in one click.

**The villain:** the monthly subscription — not big tech, not corporations. Subscription fatigue is universal and relatable.

---

## Voice & Tone
- Plain English always — never technical jargon
- Anti-establishment but trustworthy (not reckless or edgy)
- Every tool described in one sentence a non-technical person understands
- Each listing shows "Replaces X — saves you $Y/month"
- Confident, not apologetic

**Write like this:**
> "Do everything with PDFs without paying Adobe $20 a month."

**Not like this:**
> "A self-hosted, open-source PDF manipulation tool with a containerized architecture."

---

## Colors

| Name | Hex | Usage |
|---|---|---|
| Background | `#0f0f0f` | Page background |
| Text | `#ffffff` | Primary text |
| Muted text | `#777777` | Secondary/supporting text |
| Subtle | `#444444` | Placeholders, stat line |
| Border | `#2a2a2a` | Input borders |
| Input bg | `#1a1a1a` | Form inputs |

### Gradient
The signature gradient — used on the logo "SubD", buttons, badges, and accent elements.

```css
linear-gradient(135deg, #FF4500, #FF6BCB, #00C3FF)
```

| Stop | Color | Name |
|---|---|---|
| 0% | `#FF4500` | Orange-red |
| 50% | `#FF6BCB` | Hot pink |
| 100% | `#00C3FF` | Cyan |

**Gradient border technique (for outlined elements):**
```css
background:
  linear-gradient(#0f0f0f, #0f0f0f) padding-box,
  linear-gradient(135deg, #FF4500, #FF6BCB, #00C3FF) border-box;
border: 1.5px solid transparent;
```

**Gradient text technique:**
```css
background: linear-gradient(135deg, #FF4500, #FF6BCB, #00C3FF);
-webkit-background-clip: text;
-webkit-text-fill-color: transparent;
background-clip: text;
```

---

## Typography

**Font stack:**
```css
font-family: 'Trebuchet MS', 'Gill Sans', sans-serif;
```

No external font loading — system fonts only. Keeps the site fast and consistent with the logo.

| Usage | Size | Weight |
|---|---|---|
| H1 headline | `clamp(26px, 5vw, 40px)` | 700 |
| Body / sub | `17px` | 400 |
| Badge / label | `11px` | 600, letter-spacing: 3px |
| Small / stat | `14px` | 400 |
| Footer | `12px` | 400, letter-spacing: 2.5px |

---

## Logo

The logo SVG lives in `unsubd-logo-v4.html`. Key elements:

- **Icon** — music-note-like mark in a rounded square, gradient fill with glow filter
- **"Un"** — white (#ffffff) with text glow filter
- **"SubD"** — gradient fill (same as signature gradient)
- **Tagline** — "FREE SOFTWARE. NO STRINGS." in `#666666`, small caps, wide letter-spacing
- **ViewBox** — `0 0 420 165`, display at `380×150`

The icon SVG path can be embedded inline anywhere — it has no external dependencies.

---

## Tool Listing Design Pattern

The site uses a sidebar + detail panel layout for browsing tools.

**Sidebar** — 180px wide, tool names only. Active item gets a gradient border and white text. Coming-soon items are muted (#444) with a small "soon" tag. On mobile (<540px) the sidebar collapses to a horizontal scrolling tab strip.

**Detail panel** — Two logo boxes side by side, then tool name, one-line description, "Replaces / Saves" data rows, and a Download button.

**Logo boxes:**
- Paid app (left, smaller at 52×52px): brand color gradient background, white SVG icon, diagonal orange slash overlay (`rgba(255,69,0,0.75)`)
- Free app (right, 64×64px): dark `#1a1a1a` background with gradient border, white SVG icon

**Logo files:** Stored locally in `assets/logos/` as SVGs with `fill="white"` set directly in the file. Do not use `cdn.simpleicons.org` — it has been unreliable (returning 403). Always host logo files locally.

**Brand backgrounds for paid app boxes:**
- TeamViewer: `linear-gradient(145deg, #0E8EE9, #0055B3)`
- Evernote: `linear-gradient(145deg, #00A82D, #007020)`
- Add new ones by finding the brand's primary color and creating a slightly darker variant for the gradient end

**Legal note:** Using competitor logos is a trademark gray area. For public launch, consider replacing logo images with styled text labels (e.g., a rounded box with "TeamViewer" in the brand's color). Naming competitors in text copy is generally safe as nominative fair use.

---

## Do / Don't

| Do | Don't |
|---|---|
| Say "free" and mean it | Bury the value prop in tech talk |
| Lead with what it replaces | List features nobody asked for |
| Show the dollar savings | Use the word "open source" in hero copy |
| Sound confident and direct | Sound apologetic or hedge-y |
| One sentence per tool | Paragraph descriptions |
