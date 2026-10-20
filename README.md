# Typst Resume

A clean, two-page resume built with Typst and driven by simple JSON data files. It renders to a PDF with consistent
typography and layout.

## Preview

- PDFs are not committed; build one locally with the commands below.
- Pushing a `vX.Y.Z` tag builds `ken_esparta_cv.pdf` in CI and uploads it to the `cdn.kenesparta.dev` S3 bucket
  under `cv/`.

## Prerequisites

- [Typst Install](https://typst.app/open-source)
- Make (optional, for using the provided Makefile)
- Fonts are bundled in `fonts/` and referenced automatically during compilation.

## Quick Start

- Build a development PDF (`local.pdf`):
    - Using Make: `make gen/local`
    - Directly with Typst: `typst compile main.typ local.pdf --font-path fonts --ignore-system-fonts`
- Build the release PDF (`ken_esparta_cv.pdf`, the one CI publishes):
    - `make gen/build`
- Build a PDF with a short hash in the filename:
    - `make gen/revision`
- Clean generated PDFs:
    - `make clean`

The generated PDF will appear in the project root.

## Project Structure

- `main.typ` — Entry point that includes the section templates.
- `title.typ` — Name and role heading.
- `contact.typ` — Contact links and social info.
- `intro.typ` — Short professional summary.
- `experience.typ` — Work experience section, rendered from JSON.
- `additional-experience.typ` — Earlier roles, rendered from JSON.
- `projects.typ` — Selected projects, rendered from JSON.
- `education.typ` — Education history, rendered from JSON.
- `skills.typ` — Skills by category, rendered from JSON.
- `config.typ` — Theme colors, common helpers, and reusable components.
- `fonts/` — Local font files used by the layout.
- `data/` — All data sources used to populate the resume sections:
    - `experience.json`
    - `additional-experience.json`
    - `projects.json`
    - `education.json`
    - `skills.json`
- `Makefile` — Convenience tasks for building and cleaning.

## Editing Your Resume

Update the JSON files in `data/` to change content. Keys are straightforward and self-descriptive.

- experience.json
    - Fields per job: `company`, `position`, `location`, `from`, `to`, `short_description`, `description` (array of
      bullet points)
    - Dates use the format `MM-YYYY`. An empty `to` value means "Now".
- projects.json
    - Fields per project: `name`, `institution`, `link`, `link_name`, `description` (array of bullet points)
- education.json
    - Fields per entry: `school`, `location`, `degree`, `from`, `to`
- additional-experience.json
    - Same fields as experience.json: `company`, `position`, `location`, `from`, `to`, `short_description`,
      `description`
- skills.json
    - Array of objects with: `category` and `items` (array of strings), rendered as two columns of cards in plain
      text so ATS parsers read each category with its items

After editing, run a build command again to regenerate the PDF.

## Customization

- Colors and helpers live in `config.typ`:
    - `ink` (body text), `primary-color` (names, headings), `accent-color` (Go teal for text accents and links),
      `highlight-color` (Gopher blue, decoration only), `muted-color` (dates, places)
    - `format-date` converts `MM-YYYY` strings into "Mon YYYY".
    - `entry` lays out one section entry (title, dates or place, subtitle, bullets) and keeps its header on the same
      page as the first bullet.
    - `mono-link` renders monospace links (contacts, project repositories).
- Page, text, list and section-heading styles are set in `main.typ`; sections are real headings (`= Projects`), so the
  PDF gets bookmarks.
- PDF metadata (title, author, keywords) is set with `set document` in `main.typ`.

## Tips

- Keep bullet points concise and outcome-focused.
- Prefer consistent verb tense and measurable results where possible.
- Rebuild after each change to verify the layout still fits on two pages.

## Troubleshooting

- If Typst can't find the fonts, pass `--font-path fonts` (the Makefile does). `--ignore-system-fonts` makes sure
  only the bundled fonts are used, so local and CI builds match.
- If dates render unexpectedly, confirm the `MM-YYYY` format (e.g., `10-2022`).


## License
This project is licensed under the MIT License. See the LICENSE file for details.
