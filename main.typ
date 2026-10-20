#import "config.typ": ink, primary-color, highlight-color

#set document(
  title: "Ken Esparta — CV",
  author: "Ken Esparta",
  keywords: ("Go", "Golang", "Backend", "Microservices", "React", "TypeScript", "AWS", "Kubernetes"),
)

#set page(
  paper: "a4",
  margin: 35.6pt,
  background: place(top, rect(width: 100%, height: 5pt, fill: gradient.linear(primary-color, highlight-color))),
)
#set text(font: "Open Sans", size: 9.9pt, fill: ink)
#set par(justify: true, leading: 0.6em, spacing: 1em)
// Adjacent block spacings collapse to the larger one; 0.7em is the gap after a heading.
#set block(spacing: 0.7em)
#set list(marker: text(fill: highlight-color, size: 1.3em)[•], spacing: 0.9em)

// Headings carry a built-in 1.4em text scale that em values here would be
// measured against, so this rule uses absolute sizes.
#show heading.where(level: 1): it => block(width: 100%, above: 21pt, below: 13pt, {
  box(width: 3.5pt, height: 9pt, radius: 1.75pt, fill: highlight-color)
  h(6pt)
  text(font: "Capriola", fill: primary-color, weight: "regular", size: 11.9pt, it.body)
  h(8pt)
  box(width: 1fr, move(dy: -3.6pt, line(length: 100%, stroke: 0.6pt + highlight-color.lighten(55%))))
})

#include "title.typ"

#include "contact.typ"

#include "intro.typ"

#include "experience.typ"

#include "additional-experience.typ"

#include "projects.typ"

#include "education.typ"

#include "skills.typ"
