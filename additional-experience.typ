#import "config.typ": entry, at-sign, meta-sep, format-date

= Additional Experience

#for job in json("data/additional-experience.json") {
  entry(
    [#job.position #at-sign #job.company],
    [#format-date(job.from) — #format-date(job.to) #meta-sep #job.location],
    meta-size: .9em,
  )
}
