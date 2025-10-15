#import "config.typ": section_title, accent_color

#section_title("Skills")

#let skills_data = json("data/skills.json")

#for skill_category in skills_data {
  text(weight: 500, size: 1em)[#skill_category.category]
  h(.5em)
  for (index, item) in skill_category.items.enumerate() {
    if item != "" {
      box(
        fill: accent_color.lighten(85%),
        inset: .4em,
        radius: .4em,
        baseline: 0.4em
      )[
        #text(size: 0.88em)[#item]
      ]
      if index < skill_category.items.len() - 1 and skill_category.items.at(index + 1) != "" {
        h(0.5em)
      }
    }
  }

  v(-0.3em)
}