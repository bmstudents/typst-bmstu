#let страница(изображение, номер: true, содержимое: [], формат: "a4", повернуто: false) = context {
  if номер {
    page(
      margin: (left: 30mm, right: 15mm, top: 20mm, bottom: 20mm),
      footer-descent: 10mm,
      background: изображение,
      paper: формат,
      flipped: повернуто,
    )[#par[#содержимое]]
  } else {
    page(
      margin: (left: 0mm, right: 0mm, top: 0mm, bottom: 0mm),
      footer: none,
      background: изображение,
      paper: формат,
      flipped: повернуто,
    )[#par[#содержимое]]
  }
}
