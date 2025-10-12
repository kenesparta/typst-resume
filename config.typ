#let primary_color = rgb("#BA4011")
#let secondary_color = rgb("#F88426")
#let accent_color = rgb("#5467D4")


#let at_text = text(font: ("Capriola", "Capriola"),  weight: 700, size: 0.95em)[\@]


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
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  )

  let month_name = months.at(month_num - 1)
  return month_name + " " + year
}


#let section_title(title_name) = {
    text(font: ("Capriola", "Capriola"), fill: primary_color, weight: 900, size: 1.3em)[#h(-0.02em) #title_name]
    v(-0.5em)
}
