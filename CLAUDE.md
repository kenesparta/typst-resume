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

# Direct build; --font-path fonts is required or the bundled fonts are not found
typst compile main.typ out.pdf --font-path fonts

# Render each page to PNG to check the layout visually
typst compile main.typ 'out-{p}.png' --font-path fonts --ppi 110
```

There are no tests or linters. To verify a change, compile it, then look at the rendered pages. The README still mentions `make gen-test` / `make gen-release` and a committed `main.pdf`; those are out of date, and the Makefile targets above are the real ones.

## Architecture

- `main.typ` sets the page (A4, margins), paragraph and base text settings, then `#include`s the sections in display order: title, contact, intro, experience, additional-experience, projects, education, skills.
- `config.typ` holds the shared pieces each section imports: the color palette, `format_date` (`MM-YYYY` → `Mon YYYY`, empty string → `Now`), `section_title`, `new_contact` (monospace link) and `at_text` (the `@` between position and company).
- Data-driven sections (`experience`, `additional-experience`, `projects`, `education`, `skills`) each call `json("data/<name>.json")` and loop over the entries. Their field names are documented in the README. Bullet lists come from a `description` array, and empty strings are skipped.
- `title.typ`, `contact.typ` and `intro.typ` have their text hard-coded in the `.typ` file, not in JSON. Edit the role title, contact links and summary there.
- `experience.typ` has no section title of its own (it follows the intro directly), and `additional-experience.json` entries have no bullets: one line each.

## Layout constraints

- The CV is currently two pages. After any content change, render it to PNG and check the page break. A small edit on page 1 can leave a project or job heading alone at the bottom of the page, with its bullets on page 2. Fix that by tightening text on page 1, not by adding manual breaks.
- At this font size a bullet line holds roughly 110 characters. Keeping a bullet just under one or two full lines avoids a lone word wrapping onto a new line.
- Each heading row puts position/name on the left and dates/location (or institution) on the right of the same line, so long names can collide with the right-hand side.

## Content

- Every bullet is a factual claim about the owner's work. Do not add technologies, metrics or responsibilities the owner has not confirmed. Rewording and reordering is fine; inventing is not. Public repos at github.com/kenesparta are a valid source for the Projects section.
- Bullets use past-tense action verbs, including for the current job.

## Release

Pushing a tag that matches `vX.Y.Z` triggers `.github/workflows/resume.yml`. The workflow runs `make gen/build`, uploads the PDF as a workflow artifact and copies it to the public bucket `s3://cdn.kenesparta.dev/cv/` through an AWS OIDC role. A tag push therefore publishes the CV, so only tag when the owner asks.

Commit messages follow the `feat:` / `fix:` prefix style.
