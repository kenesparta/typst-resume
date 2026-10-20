#import "config.typ": entry, at-sign, meta-sep, format-date, accent-color

= Experience

#for job in json("data/experience.json") {
  entry(
    [#job.position #at-sign #text(fill: accent-color, job.company)],
    [#format-date(job.from) — #format-date(job.to) #meta-sep #job.location],
    subtitle: text(weight: 600, job.short_description),
    bullets: job.description,
  )
}
