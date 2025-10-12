#import "config.typ": section_title, secondary_color, accent_color

#section_title("Skills")

#let skills_data = json("data/skills.json")

#let skill_card(name, experience_time) = {
  box[
    #box(
      fill: secondary_color.lighten(90%),
      stroke: secondary_color + 1pt,
      inset: .6em,
    )[
      #align(center)[
        #text(weight: 700, size: 0.9em)[#name]
      ]
    ]#box(
      fill: accent_color.lighten(90%),
      stroke: secondary_color + 1pt,
      inset: .6em,
    )[
      #align(center)[
        #text(fill:accent_color, weight: 500, size: 0.9em)[#experience_time]
      ]
    ]
  ]
}

#for skill in skills_data {
  skill_card(skill.name, skill.experience_time)
  h(.5em)
}