# [BMSTU typst](https://github.com/bmstudents/typst-bmstu)

В данном репозитории представлены основные шаблоны работ для студентов, оформленные в типографической системе [Typst](https://typst.app).

Для работы необходимы пакеты `bmstu:0.2.0` (набор удобных функций для работы над документами), `gost732-2017:0.3.0` (базовая поддержка оформления по ГОСТ 7.32-2017).

Актуальные версии пакетов: `bmstu:0.2.0` `gost732-2017:0.3.0`.

Репозиторий пакета typst-g7.32-2017: [ссылка](https://github.com/bmstudents/typst-g7.32-2017)

## Getting started

1. Установить `typst` версии `0.12.0` и библиотеки `bmstu` и `gost7.32-2017`:

    **Для Linux/MacOS** выполнить скрипт:

    ```sh
    sh <(curl -sSfL https://raw.githubusercontent.com/bmstudents/typst-bmstu/refs/heads/main/install.sh)
    ```

    **Для Windows** выполнить скрипт в `powershell`:

    ```powershell
    irm https://raw.githubusercontent.com/bmstudents/typst-bmstu/refs/heads/main/install.ps1 | iex
    ```

2. Создать файл `foo.typ` с содержимым

    ```typst
    #import "@local/gost732-2017:0.3.0": *
    #import "@local/bmstu:0.2.0": *

    #show: гост732-2017

    #содержание()

    = Введение

    Краткий гайд, как начать писать документы по ГОСТ.

    = Пример оформления работы по ГОСТ

    #lorem(200)

    = Заключение

    Заключительный раздел.
    ```

3. Выполнить компиляцию файла: `typst compile foo.typ`

## Примеры работы

- обзор возможностей библиотеки в папке [examples](https://github.com/bmstudents/typst-bmstu/tree/main/example)
- РПЗ по курсовой работе по дисциплине Схемотехника: [ссылка](https://github.com/vzalygin/bmstu-ics6/tree/master/cource-papers/schemach/%D1%80%D0%BF%D0%B7)

## Документация (В процессе разработки)

Гайд по ссылке: [тык](./docs/documentation.md)

## Известные ограничения

Актуальная версия библиотеки не гарантирует корректное отображение вложенных списков. Данное ограничение исходит из некорректной работы транслятора `typst`.
