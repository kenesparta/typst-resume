#import "config.typ": section_title, primary_color, accent_color, at_text

#section_title("Project")

#let projects_data = json("data/projects.json")

#for project in projects_data [
  #text(fill: primary_color, weight: 500, size: 1.1em)[#project.name]
  #h(1fr)
  #text(fill: accent_color, weight: 500, size: .9em)[#project.institution]
  #v(-0.4em)
  #text(weight: 500)[#link(project.link)[#project.link]]
  #v(-0.4em)
  #if project.description.len() > 0 [
    #list(
      ..project.description.map(desc => {
        if desc != "" {
          [#desc]
          v(0.3em)
        }
      }).filter(item => item != none)
    )
  ]

  #v(-0.2em)
]
