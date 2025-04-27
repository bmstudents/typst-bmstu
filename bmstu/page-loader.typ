#let страница(изображение, номер: true, содержимое: [], формат: "a4", повернуто: false) = {
    if (номер) {
        page(
            background: изображение,
            paper: формат,
            flipped: повернуто
        )[#par[#содержимое]]
    } else {
        page(
            margin: (left: 0mm, right: 0mm, top: 0mm, bottom: 0mm),
            background: изображение,
            paper: формат,
            flipped: повернуто
        )[#par[#содержимое]]
    }
}
