// Ink for body text, navy for names and headings, Go teal for text accents
// (AA contrast on white), Gopher blue for decoration only, grey for dates.
#let ink = rgb("#1E2430")
#let primary-color = rgb("#0B2545")
#let accent-color = rgb("#007D9C")
#let highlight-color = rgb("#00ADD8")
#let muted-color = rgb("#5B6472")

#let at-sign = text(font: "Capriola", fill: muted-color, size: 0.95em)[\@]
#let meta-sep = [#h(.2em) #text(fill: highlight-color, size: 1.3em, baseline: 0.12em)[•] #h(.2em)]

// "MM-YYYY" -> "Mon YYYY"; an empty string means the entry is ongoing.
#let format-date(date) = {
  if date == "" {
    return "Now"
  }
  let (month, year) = date.split("-").map(int)
  datetime(year: year, month: month, day: 1).display("[month repr:short] [year]")
}

#let mono-link(dest, body) = link(dest, text(font: "Google Sans Code", fill: accent-color, weight: 600, size: .95em, body))

// A section entry: title with its meta (dates, place) on the right, an optional
// subtitle, then bullets. The header is sticky so it never ends a page without
// at least its first bullet.
#let entry(title, meta, subtitle: none, meta-size: 1em, bullets: ()) = {
  let bullets = bullets.filter(b => b != "")
  let has-bullets = bullets.len() > 0
  // Space between entries; it sits below the last block of the entry.
  let gap = 1.7em
  block(
    below: if has-bullets { 0.9em } else { gap },
    sticky: has-bullets,
    breakable: false,
    grid(
      columns: (1fr, auto),
      column-gutter: 1em,
      row-gutter: 0.8em,
      align: (left + bottom, right + bottom),
      text(fill: primary-color, weight: 600, size: 1.1em, title),
      text(fill: muted-color, weight: 600, size: meta-size, meta),
      ..if subtitle != none { (grid.cell(colspan: 2, subtitle),) },
    ),
  )
  if has-bullets {
    block(above: 0.9em, below: gap, list(..bullets))
  }
}
