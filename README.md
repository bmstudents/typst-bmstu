# [BMSTU typst](https://github.com/bmstudents/typst-bmstu)

В данном репозитории представлены основные шаблоны работ для студентов, оформленные в типографической системе [Typst](https://typst.app):

## Getting started

1. Согласно официальной инструкции установить `typst` версии `0.12.0`: [ссылка](https://github.com/typst/typst?tab=readme-ov-file#installation)

2. Установить библиотеки `bmstu` и `gost7.32-2017`:

    **Для Linux/MacOS** выполнить скрипт:

    ```sh
    sh <(curl -sSfL https://raw.githubusercontent.com/bmstudents/typst-bmstu/refs/heads/master/install.sh)
    ```

    **Для Windows** выполнить скрипт в `powershell`:

    ```powershell
    Invoke-RestMethod -Uri "https://raw.githubusercontent.com/bmstudents/typst-bmstu/refs/heads/master/install.ps1" -OutFile "$env:TEMP\install.ps1"; & "$env:TEMP\install.ps1"
    ```

3. Прочитать гайд по ссылке: [тык](./docs/documentation.md)

## Документация

Гайд по ссылке: [тык](./docs/documentation.md)
