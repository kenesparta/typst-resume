#import "config.typ": section_title
#import "config.typ": primary_color, accent_color, at_text, format_date

#section_title("Education")

#let education_data = json("data/education.json")

#for education in education_data [
  #text(fill: primary_color, weight: 500, size: 1em)[#education.school, #education.location]
  #h(1fr)
  #text(fill: accent_color, weight: 500, size: .9em)[#format_date(education.from) — #format_date(education.to)]
  #v(-0.5em)

  #text(size: 1em,weight: 400)[#education.degree]
  #v(0.5em)
]
