# [BMSTU typst](https://github.com/pluttan/typst-bmstu)

В данном репозитории представлены основные шаблоны работ для студентов, оформленные в типографической системе [Typst](https://typst.app):

## Установка

Склонируйте репозиторий в `$HOME`

```bash
git clone https://github.com/pluttan/typst-bmstu $HOME/typst-bmstu
```

И запустите инсталлятор (установка отличается для разных операционных систем - см. `install.sh`):

```bash
~/typst-bmstu/install.sh
```

## 1. Пример студенческой работы (титульный лист, оглавление, ссылки на источники)

Использование:
```typst
#import "@docs/bmstu:1.0.0": *

#show: student_work.with(
  caf_name: "Компьютерные системы и сети",// Название кафедры (необязательно)
  faculty_name: "Информатика и системы управления", // Название факультета (необязательно)
  work_type: "доте", // Вид работы (в предложном падеже) и ее номер (необязательно)
  work_num: "1",
  discipline_name: "Теория графов", // Название дисциплины (необязательно)
  theme: "Вариант 12. Алгоритм обхода графов в глубину", // Тема работы (необязательно)
  author: (group: "ИБО-ТС-22", nwa: "Богданчиков К.А."), // Автор работы и его группа
  adviser: (nwa: "Сухотерин А.В."),// Преподаватель
  city: "Королёв", // Город (не обязательно)
  date: "06.11.2004", // Дата (не обязательно, при отсутствии подставляется дата компиляции)
  year: "2004", // Год (не обязательно, при отсутствии подставляется год компиляции) 
  table_of_contents: true, // Содержание (необязательно, по умолчанию false) 
  links: ( // Ссылки (необязательно) 
    (type: "doc", title: "hhhДоктрина информационной безопасности Российской Федерации (от 5 декабря 2016 г.)"),
    (type: "book", author: "Титов Климентий", title: "Севейна", publisher: "Литрес.Самиздат", year: "2019"),
    (type: "web", title: "Writing In Typst Tutorial", link: "https://typst.app/docs/tutorial/writing-in-typst", access_date: "22.09.2023"),
  ),
)
```
Скриншот:
![Пример](example-report.png)