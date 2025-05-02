# [BMSTU typst](https://github.com/bmstudents/typst-bmstu)

В данном репозитории представлены основные шаблоны работ для студентов, оформленные в типографической системе [Typst](https://typst.app):

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
    #import "@local/bmstu:0.1.1": *

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

## Документация

Гайд по ссылке: [тык](./docs/documentation.md)
