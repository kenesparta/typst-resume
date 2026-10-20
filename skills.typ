#import "config.typ": primary-color, highlight-color

= Skills

#let sep = [#h(.45em)#text(fill: highlight-color, size: .8em)[•]#h(.45em)]

// Plain text (not pills) so text extraction keeps each category in reading order.
// Each item is a box so a row only wraps between items, never inside one.
#set par(justify: false)
#grid(
  columns: (auto, 1fr),
  inset: (x: .6em, y: .5em),
  fill: (_, y) => if calc.even(y) { highlight-color.lighten(91%) },
  ..json("data/skills.json").map(c => (
    text(fill: primary-color, weight: 600, c.category),
    c.items.filter(i => i != "").map(box).join(sep),
  )).flatten(),
)
