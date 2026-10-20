#import "config.typ": accent-color, highlight-color, muted-color

= Skills

#let sep = text(fill: muted-color)[, ]

// One card per category, two per row. Items stay plain text (not pills) and the
// label keeps the body text size: both keep text extraction in reading order.
// Each item is a box so lines wrap between items, never inside one.
#let skill-card(category) = block(
  width: 100%,
  stroke: (left: 1.5pt + highlight-color.lighten(35%)),
  inset: (left: 8pt, y: 1pt),
  {
    block(below: .4em, text(fill: accent-color, weight: 700, category.category))
    category.items.filter(i => i != "").map(box).join(sep)
  },
)

#set par(justify: false)
#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.6em,
  row-gutter: .9em,
  ..json("data/skills.json").map(skill-card),
)
