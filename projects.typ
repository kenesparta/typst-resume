#import "config.typ": entry, mono-link

= Projects

#for project in json("data/projects.json") {
  entry(
    project.name,
    project.institution,
    subtitle: mono-link(project.link, project.link_name),
    bullets: project.description,
  )
}
