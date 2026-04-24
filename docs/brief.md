# Project Brief

## Concept

An app store for open source Windows software that makes free GitHub tools accessible to non-technical users. Average people don't know these tools exist — and even if they find them, setup is too confusing. UnSubbed solves both problems: curation and installation.

The code is not the value. The value is:

- **Curation** — someone vetted this and it actually works
- **Simplicity** — no terminal, no config files, no dependencies to figure out
- **Discovery** — users didn't even know this existed
- **Trust** — it won't break their computer
- **Time** — 2 minutes instead of 2 days

---

## Positioning

People are paying monthly for software that has a free open source alternative they've never heard of. UnSubbed finds those alternatives, packages them cleanly, and makes them installable in one click.

**The enemy is the monthly subscription** — not big tech hiding secrets. Subscription fatigue is universal and relatable. That's the villain.

The key insight: *"The inventory is free. You charge for the experience of accessing it easily. Same reason people pay for curated newsletter subscriptions even though the internet is free."*

The open source community has already done the hard work of building excellent software. UnSubbed's job is distribution, curation, and trust.

---

## Monetization

- **Free to browse** — anyone can discover tools
- **One-time unlock** — pay once, own it forever (never a subscription — would contradict the brand)
- **Suggested price point** — ~$19 one-time for full library access
- **Affiliate/referral revenue** — some open source projects have pro tiers; referral fees are invisible to users
- **Featured placement** — open source projects pay to be featured (clearly labeled)

**Headline marketing stat:** The paid versions of the MVP tool list cost $1,500–2,000+/year combined. UnSubbed users save an average of $1,800 a year.

---

## Editorial Filter

A tool qualifies for UnSubbed if it meets ALL of these:

1. Genuinely excellent and actively maintained
2. Average person has never heard of it OR setup is too painful without help
3. Replaces something people are currently paying for
4. No competing commercial version that would conflict with our platform
5. Windows compatible

**Does NOT qualify:**
- Tools already mainstream and easy to install (VLC, OBS, Audacity)
- Tools with strong brand awareness and their own distribution (Bitwarden)
- Anything requiring ongoing technical knowledge to use after install

---

## Architecture

**How it works:**
1. UnSubbed.app — browse, discover, read plain English descriptions
2. Each tool has a Download button
3. Download delivers a pre-packaged Windows installer (.exe)
4. Installer handles everything silently in the background
5. User ends up with a working app — zero confusion

No companion app needed. Windows users are comfortable downloading and running installers.

**The technical moat:** Anyone can make a list of free software. The defensible value is packaging each tool into a clean, silent, error-free Windows installer that just works. That's the hard part nobody else has done at scale.

---

## Go-To-Market Strategy

**Phase 1 — Validate before building**
- Landing page with value proposition and email signup
- If signups happen = validated. Build it.
- If nobody signs up = learned cheaply.

**Phase 2 — MVP Launch**
- 10 tools fully packaged and installable
- Clean browsing UI
- Free tier + one-time unlock
- Focus on quality over quantity

**Phase 3 — Growth**
- Expand tool library
- Partner with open source projects for featured placement
- User-submitted tool suggestions
- "UnSubbed saves me $X/month" social sharing mechanic

---

## Open Issues

- **Unsigned .exe problem** — Windows SmartScreen will warn non-technical users. Code signing cert (~$100–400/yr) needed before launch.
- **Free vs. paid split** — not yet defined. Critical product decision.
- **Licensing compliance** — repackaging open source tools requires a pass on each project's license (GPL, MIT, Apache).
- **Competitor acknowledgment** — Ninite exists. Differentiation is curation + subscription-replacement framing + non-technical audience focus.
- **Maintenance burden** — tools update constantly. Packaging strategy needs to account for this (wrap upstream installer vs. fork it).
