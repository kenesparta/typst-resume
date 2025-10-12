#import "config.typ": primary_color

#let experience_data = json("data/experience.json")
#let at_text = text(font: ("Capriola", "Capriola"), size: 1.2em)[\@]

#let format_date(date_str) = {
  if date_str == "Present" {
    return "Present"
  }

  let parts = date_str.split("-")
  if parts.len() != 2 {
    return date_str
  }

  let month_num = int(parts.at(0))
  let year = parts.at(1)

  let months = (
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
  )

  let month_name = months.at(month_num - 1)
  return month_name + " " + year
}

#for experience in experience_data [
  #text(fill: primary_color, weight: 900)[#experience.position #at_text #experience.company]
  #h(0.8em)
  #text(weight: 900)[#format_date(experience.from) - #format_date(experience.to)]

  #if experience.description.len() > 0 [
    #for desc in experience.description [
      #if desc.situation != "" or desc.tasks != "" or desc.action != "" or desc.result != "" [
        #if desc.situation != "" [
          *Situation:* #desc.situation
        ]
        #if desc.tasks != "" [
          *Tasks:* #desc.tasks
        ]
        #if desc.action != "" [
          *Action:* #desc.action
        ]
        #if desc.result != "" [
          *Result:* #desc.result
        ]

        #v(0.5em)
      ]
    ]
  ]

  #v(1em)
]
