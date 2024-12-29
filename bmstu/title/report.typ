#import "utils.typ":*
#import "../bmstu.config.typ":config
#let mk_title_report_work(work_type, work_num) = {[
    #v(-40pt)
    #set align(center + horizon)
    
    #text(tracking: 5pt, weight: "bold", size: 16pt)[ОТЧЕТ]
    #set text(tracking: 0pt, size:14pt, weight: "bold")

    #if (work_type != "") and (work_num != "") {[
        #set align(center)
        #grid(
            columns: 2,
            align(right)[по #work_type № ], 
            align(center)[
                #v(2pt)
                #work_num
                #v(-14pt)
                #line(length: 40pt, stroke: 1pt)
                #h(0pt)
            ]
        ) 
    ]}
]}

#let mk_title_report_discipline(discipline_name) = {[
    #if discipline_name != "" {[
        #set align(left)
        #grid(
            columns: 2,
            [
                #set align(right)
                Дисциплина: #h(5pt)
            ], 
            [
                #set align(left)
                #v(0pt)
                #h(1pt)
                #discipline_name
                #v(-13.5pt)
                #line(length: 380pt, stroke: 1pt)
            ]
        ) 
    ]}
]}

#let mk_title_report_theme(theme, themecol2) = {[
    #if theme != "" {[
        #set align(left)
        #grid(
            columns: 2,
            [
                #set align(right)
                #align(top)[Название: #h(5pt)]
                #(if themecol2 != ""{v(22pt)}) 
            ], 
            [
                #set align(left)
                #set text(weight:"regular")
                #par(first-line-indent: 0em)[#theme]
                #v(-13.5pt)
                #line(length: 400pt, stroke: 1pt)
                #(if themecol2 != ""{
                    v(-6pt)
                    h(1pt)
                    themecol2
                    v(-13.5pt)
                    line(length: 400pt, stroke: 1pt)
                })
            ]
        )
    ]}
]}

// Составляет титульный лист.
#let title_report(
  caf_name: config.caf_name,
  faculty_name: config.faculty_name,
  id_study_field: config.id_study_field,
  study_field: config.study_field,
  work_type: config.work_type,
  work_num: config.work_num,
  discipline_name: config.discipline_name,
  theme: config.theme,
  themecol2:config.themecol2,
  author: config.author,
  adviser: config.adviser,
  city: config.city,
  date: config.date,
  year: config.year, 
) = {[
    // #set document(title: theme)
    #set page(margin: (bottom: 10mm))
    #set text(font: "Times New Roman", size: 14pt, lang: "ru")

    #if (date == true) {date = datetime.today().display("[day].[month].[year repr:last_two]")}
    #if (date == false) {date = ""}
    #if (id_study_field != "") {
        study_field = id_study_field + " " + study_field
    }

    #mk_title_header()

    #mk_title_header_row("Факультет:", faculty_name)
    #mk_title_header_row("Кафедра:", caf_name)
    #mk_title_header_row("Направление подготовки:", study_field, no_upper: true)

    #mk_title_report_work(work_type, work_num)
    #mk_title_report_discipline(discipline_name)
    #mk_title_report_theme(theme, themecol2)

    #mk_title_student_sign(author, date)
    #mk_title_teacher_sign((nwa:adviser.nwa, work:"Преподаватель"), date)

    #v(20pt)
    #mk_title_year_city( city, year)
]}

// deprecated
#let mk_title_page(
  caf_name: "",
  faculty_name: "",
  study_field: "",
  work_type: "",
  work_num: "",
  discipline_name: "",
  theme: none,
  themecol2:"",
  author: (),
  adviser: (),
  city: "",
  date: datetime.today().display("[day].[month].[year]"),
  year: datetime.today().display("[year]"), 
) = {title(
  caf_name: caf_name,
  faculty_name: faculty_name,
  study_field: study_field,
  work_type: work_type,
  work_num: work_num,
  discipline_name: discipline_name,
  theme: theme,
  themecol2:themecol2,
  author: author,
  adviser: adviser,
  city: city,
  date: date,
  year: year, 
)}
// end-deprecated


#let титул_отчета(
    кафедра: config.caf_name,
    факультет: config.faculty_name,
    код_направления: config.id_study_field,
    направление: config.study_field,
    тип_работы: config.work_type,
    номер_работы: config.work_num,
    дисциплина: config.discipline_name,
    название_работы: config.theme,
    название_работы_кол2:config.themecol2,
    автор: config.author,
    руководитель: config.adviser,
    город: config.city,
    дата: config.date,
    год: config.year, 
) = {
    title_report(
        caf_name: кафедра,
        faculty_name: факультет,
        id_study_field: код_направления,
        study_field: направление,
        work_type: тип_работы,
        work_num: номер_работы,
        discipline_name: дисциплина,
        theme: название_работы,
        themecol2:название_работы_кол2,
        author: (nwa:автор.фио, group:автор.группа),
        adviser: (nwa:руководитель.фио),
        city: город,
        date: дата,
        year: год, 
    ) 
}

#let титул_отчета_иу6(
    код_направления: config.id_study_field,
    направление: config.study_field,
    тип_работы: config.work_type,
    номер_работы: config.work_num,
    дисциплина: config.discipline_name,
    название_работы: config.theme,
    название_работы_кол2:config.themecol2,
    автор: config.author,
    руководитель: config.adviser,
    город: config.city,
    дата: config.date,
    год: config.year, 
) = титул_отчета(
    факультет: "Информатика и системы управления",
    кафедра: "Компьютерные системы и сети",
    код_направления: код_направления,
    направление: направление,
    дисциплина: дисциплина,
    тип_работы: тип_работы,
    номер_работы: номер_работы,
    название_работы: название_работы,
    название_работы_кол2: название_работы_кол2,
    автор: автор,
    руководитель: руководитель,
    город: город,
    дата: дата,
    год: год,
)

#let титул_отчета_иу6_ивт(
    тип_работы: config.work_type,
    номер_работы: config.work_num,
    дисциплина: config.discipline_name,
    название_работы: config.theme,
    название_работы_кол2:config.themecol2,
    автор: config.author,
    руководитель: config.adviser,
    город: config.city,
    дата: config.date,
    год: config.year, 
) = титул_отчета_иу6(
    код_направления: "09.03.01/03",
    направление: "Вычислительные машины, комплексы, системы и сети",
    дисциплина: дисциплина,
    тип_работы: тип_работы,
    номер_работы: номер_работы,
    название_работы: название_работы,
    название_работы_кол2: название_работы_кол2,
    автор: автор,
    руководитель: руководитель,
    город: город,
    дата: дата,
    год: год,
)