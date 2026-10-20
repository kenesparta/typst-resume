#import "config.typ": entry, format-date, muted-color

= Education

#for school in json("data/education.json") {
  entry(
    [#school.school#text(fill: muted-color, weight: 500)[, #school.location]],
    [#format-date(school.from) — #format-date(school.to)],
    subtitle: text(weight: 500, school.degree),
    gap: 1.15em,
  )
}
