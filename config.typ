#let primary_color = rgb("#BA4011")
#let secondary_color = rgb("#F88426")
#let accent_color = rgb("#5467D4")

#let primary_color = rgb("#0077B6")
#let secondary_color = rgb("#2A52BE")
#let accent_color = rgb("#009996")

#let at_text = text(font: ("Capriola", "Capriola"),  weight: 700, size: 0.95em)[\@]


#let format_date(date_str) = {
  if date_str == "" {
    return "Now"
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


#let section_title(title_name) = {
    v(0.1em)
    text(font: ("Capriola", "Capriola"), fill: secondary_color, weight: 900, size: 1.1em)[#h(-0.02em) #title_name]
    v(-0.9em)
    line(length: 100%, stroke: (paint: secondary_color.lighten(0%), dash: "dashed"))
}
