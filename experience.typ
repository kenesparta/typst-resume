#import "config.typ": primary_color, accent_color, at_text, format_date

#let experience_data = json("data/experience.json")

#for experience in experience_data [
  #text(fill: primary_color, weight: 900, size: 1.2em)[#experience.position #at_text #experience.company]
  #h(1fr)
  #text(fill: accent_color, weight: 900, size: 1.1em)[#format_date(experience.from) — #format_date(experience.to)]

  #if experience.description.len() > 0 [
    #list(
      ..experience.description.map(desc => {
        if desc.situation != "" or desc.tasks != "" or desc.action != "" or desc.result != "" {
          let content = ""
          if desc.situation != "" {
            content += desc.situation
          }
          if desc.tasks != "" {
            content += desc.tasks
          }
          if desc.action != "" {
            content += desc.action
          }
          if desc.result != "" {
            content += desc.result
          }
          [#content]
        }
      }).filter(item => item != none)
    )
  ]

  #v(0.5em)
]
