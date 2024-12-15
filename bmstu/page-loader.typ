#let страница(изображение, номер: true) = {
    if (номер) {
        page(
            background: изображение
        )[]
    } else {
        page(
            margin: (left: 0mm, right: 0mm, top: 0mm, bottom: 0mm),
            background: изображение
        )[]
    }
}
