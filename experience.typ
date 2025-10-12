#import "config.typ": primary_color, accent_color, at_text, format_date

#let experience_data = json("data/experience.json")

#for experience in experience_data [
  #text(fill: primary_color, weight: 700, size: 1.15em)[#experience.position #at_text #experience.company]
  #h(1fr)
  #text(fill: accent_color, weight: 700, size: 1.1em)[#format_date(experience.from) — #format_date(experience.to)]
  #v(-0.5em)

  #if experience.description.len() > 0 [

    #text(weight: 500)[#experience.short_description]

    #list(
      ..experience.description.map(desc => {
        if desc.situation != "" or desc.tasks != "" or desc.action != "" or desc.result != "" {
          let content = ""
          if desc.situation != "" {
            content += desc.situation
            content += h(.3em)
          }

          if desc.tasks != "" {
            content += desc.tasks
            content += h(.3em)
          }

          if desc.action != "" {
            content += desc.action
            content += h(.3em)
          }

          if desc.result != "" {
            content += desc.result
            content += h(.3em)
          }

          [#content]
        }
      }).filter(item => item != none)
    )
  ]

  #v(0.5em)
]
