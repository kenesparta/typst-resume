#import "config.typ": section_title, accent_color

#section_title("Skills")

#let skills_data = json("data/skills.json")

#for skill_category in skills_data {
  text(weight: 700, size: 1em)[#skill_category.category]
  h(1em)
  for (index, item) in skill_category.items.enumerate() {
    if item != "" {
      box(
        fill: accent_color.lighten(92%),
        inset: .6em,
        radius: 1em,
        baseline: .6em
      )[
        #text(weight: 500, size: .9em)[#item]
      ]
      if index < skill_category.items.len() - 1 and skill_category.items.at(index + 1) != "" {
        h(.5em)
      }
    }
  }

  v(-0.5em)
}