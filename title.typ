#import "config.typ": primary-color, accent-color

#show title: it => block(below: 11pt, text(font: "Capriola", fill: primary-color, weight: "regular", size: 22pt, it.body))

#block(below: 1.1em)[
  #title[#h(-0.1em)Ken Esparta]
  #text(font: "Capriola", fill: accent-color, size: 1.15em)[#h(-0.1em)Senior Software Engineer (Go)]
]
