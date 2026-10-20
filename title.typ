#import "config.typ": primary-color, accent-color

#show title: it => block(below: 10.7pt, text(font: "Capriola", fill: primary-color, weight: "regular", size: 18.8pt, it.body))

#block(
  width: 100%,
  inset: (bottom: 0.62em),
  below: 1em,
  stroke: (bottom: (paint: accent-color.lighten(10%), dash: "dashed")),
)[
  #title[#h(-0.1em)Ken Esparta]
  #text(font: "Capriola", fill: accent-color, size: 1.1em)[#h(-0.1em)Senior Software Engineer (Go)]
]
