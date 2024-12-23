#let страница(изображение, номер: true, содержимое: []) = {
    if (номер) {
        page(
            background: изображение
        )[#par[#содержимое]]
    } else {
        page(
            margin: (left: 0mm, right: 0mm, top: 0mm, bottom: 0mm),
            background: изображение
        )[#par[#содержимое]]
    }
}
