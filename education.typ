#import "config.typ": entry, format-date

= Education

#for school in json("data/education.json") {
  entry(
    [#school.school, #school.location],
    [#format-date(school.from) — #format-date(school.to)],
    subtitle: text(weight: 500, school.degree),
  )
}
