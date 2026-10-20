# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Ken Esparta's CV, written in Typst. Content lives in JSON under `data/`; the `.typ` files are layout only. The output is a PDF (all `*.pdf` files are gitignored).

## Commands

```sh
make gen/local      # -> local.pdf
make gen/build      # -> ken_esparta_cv.pdf (the name CI publishes)
make gen/revision   # -> ken_esparta_cv_<hash>.pdf
make clean          # delete every *.pdf in the root

# Direct build. --font-path fonts is required; --ignore-system-fonts keeps local output identical to CI.
typst compile main.typ out.pdf --font-path fonts --ignore-system-fonts

# Render each page to PNG to check the layout visually
typst compile main.typ 'out-{p}.png' --font-path fonts --ignore-system-fonts --ppi 110
```

There are no tests or linters. To verify a change, compile it, look at the rendered pages, and run `pdftotext out.pdf -` to confirm the text extracts in reading order (that is roughly what an ATS sees).

## Architecture

- `main.typ` holds every document-wide rule: `set document` metadata, page, text, paragraph, block and list settings, and the `show heading.where(level: 1)` rule that styles section titles. It then `#include`s the sections in display order.
- Sections are real headings (`= Experience`, `= Projects`, …), so they produce PDF bookmarks and stay on the same page as the content after them (headings are sticky by default). The name is a `title` element in `title.typ`.
- `config.typ` holds the palette (`primary-color`, `secondary-color`, `accent-color`) and helpers: `format-date` (`MM-YYYY` → `Mon YYYY`, empty → `Now`), `mono-link`, `at-sign`, `meta-sep`, and `entry`.
- `entry(title, meta, subtitle:, meta-size:, bullets:)` is the single layout for every row in experience, additional experience, projects and education. The header is a `grid` (title left, meta right) in a non-breakable block; when there are bullets it is `sticky`, so a header never ends a page without its first bullet.
- `title.typ`, `contact.typ` and `intro.typ` have their text hard-coded in the `.typ` file, not in JSON. `data/skills.json` is rendered as plain text joined with `·` in a two-column grid, not as pills, because pills scramble the reading order of text extracted from the PDF.

## Typst quirks this layout depends on

- Adjacent block spacings collapse to the larger value. The gap after a heading comes from the heading's `below` together with the global `block(spacing: 0.7em)`. The gap between entries comes from the bullet list's `below` inside `entry`.
- Between a block and a paragraph, block spacing applies, not `par.spacing`.
- Inside the `heading` and `title` show rules, `em` is measured against Typst's built-in enlarged text size (1.4× / 1.7× the body text). That is why those rules use `pt`.
- Capriola only ships a Regular weight; `weight` values on it have no effect.

## Layout constraints

- The CV is two pages. After any content change, render it to PNG and check both pages.
- At this font size a bullet line holds roughly 110 characters. Keeping a bullet just under one or two full lines avoids a lone word wrapping onto a new line.

## Content

- Every bullet is a factual claim about the owner's work. Do not add technologies, metrics or responsibilities the owner has not confirmed. Rewording and reordering is fine; inventing is not. Public repos at github.com/kenesparta are a valid source for the Projects section.
- Bullets use past-tense action verbs, including for the current job.

## Release

Pushing a tag that matches `vX.Y.Z` triggers `.github/workflows/resume.yml`. The workflow runs `make gen/build`, uploads the PDF as a workflow artifact and copies it to the public bucket `s3://cdn.kenesparta.dev/cv/` through an AWS OIDC role. A tag push therefore publishes the CV, so only tag when the owner asks.

Workflow actions are pinned to full commit SHAs with a `# vX.Y.Z` comment, and Dependabot (`.github/dependabot.yml`) proposes weekly updates after a 7-day cooldown. Keep that format when adding or changing an action. CodeQL code scanning for the workflows runs through GitHub's default setup, so there is no CodeQL workflow file.

Commit messages follow the `feat:` / `fix:` prefix style.
