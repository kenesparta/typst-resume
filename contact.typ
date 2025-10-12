#import "config.typ": secondary_color

#let new_contact(goto_link, show_text) = {
    text(weight: 900, fill: secondary_color, size: .9em)[#link(goto_link)[#show_text]]
}

#grid(
  columns: 4,
  column-gutter: 1fr,
  new_contact("https://linkedin.com/in/kenesparta", "linkedin.com/in/kenesparta"),
  new_contact("mailto:kenesparta@pm.me", "kenesparta@pm.me"),
  new_contact("https://github.com/kenesparta", "github.com/kenesparta"),
  new_contact("https://kenesparta.dev", "kenesparta.dev")
)

#v(0.2em)