#import "config.typ": secondary-color

#set document(
  title: "Ken Esparta — CV",
  author: "Ken Esparta",
  keywords: ("Go", "Golang", "Backend", "Microservices", "React", "TypeScript", "AWS", "Kubernetes"),
)

#set page(paper: "a4", margin: 35.6pt)
#set text(font: "Open Sans", size: 9.9pt)
#set par(justify: true, leading: 0.6em, spacing: 1em)
// Adjacent block spacings collapse to the larger one; 0.7em is the gap after a heading.
#set block(spacing: 0.7em)
#set list(marker: text(size: 1.5em, baseline: -0.1em)[•], spacing: 0.9em)

// Headings carry a built-in 1.4em text scale that em values here would be
// measured against, so this rule uses absolute sizes.
#show heading.where(level: 1): it => block(
  width: 100%,
  above: 21pt,
  below: 9.7pt,
  inset: (bottom: 6.2pt),
  stroke: (bottom: (paint: secondary-color.lighten(10%), dash: "dashed")),
  text(font: "Capriola", fill: secondary-color, weight: "regular", size: 11.9pt, it.body),
)

#include "title.typ"

#include "contact.typ"

#include "intro.typ"

#include "experience.typ"

#include "additional-experience.typ"

#include "projects.typ"

#include "education.typ"

#include "skills.typ"
