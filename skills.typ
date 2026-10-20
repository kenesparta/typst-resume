= Skills

#grid(
  columns: (auto, 1fr),
  column-gutter: 1em,
  row-gutter: .8em,
  ..json("data/skills.json").map(c => (
    text(weight: 700, c.category),
    c.items.filter(i => i != "").join[ #sym.dot.c ],
  )).flatten(),
)
