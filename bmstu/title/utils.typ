#let mk_title_header() = {[      
    #set align(center)
    #set text(size: 10pt)
    #grid(
        columns: (18%, 85%),
        [
            #set align(left)
            #v(-10pt)
            #figure(
                placement: bottom,
                image("../bmstu_logo.jpg", width: 70%),
            )
        ],
        [
            #set par(leading: 0.5em)
            #set align(center)
            *Министерство науки и высшего образования Российской Федерации\
            Федеральное государственное бюджетное образовательное учреждение\
            высшего образования\
            «Московский государственный технический университет\
            имени Н.Э. Баумана\
            (национальный исследовательский университет)»\
            (МГТУ им. Н.Э. Баумана)*
       ]
    )
    #line(length: 100%, stroke:3pt)
    #v(-10pt)
    #line(length: 100%, stroke:0.5pt)
    #v(10pt)
]}

#let mk_title_header_row(name, data, no_upper:false) = {
    if (data != ""){[
        #set text(weight: "regular", size: 11pt)
        #set par(first-line-indent: 0em)
        #set align(left)
        #upper(name)
        #if(no_upper){data} else {[*#upper(data)*]}
    ]}
}


#let mk_title_student_sign(author, date) = {[
    #set text(weight:"regular")
    #set align(bottom)
    #set text(14pt)
    
    #grid(
        columns: (100pt, 1fr, 3.5fr),
        gutter: 40pt,
        align(left)[Студент #v(12pt)], 
        align(center)[
            #v(2pt)
            #author.group
            #v(-14pt)
            #line(length: 90pt, stroke: 1pt)
            #v(-14pt)
            #text(size:10pt)[(Группа)]
        ],
        grid(
            columns:(5fr, 5fr),
            gutter:30pt,
            align(center)[
                #v(2pt)
                #align(right)[#date]
                #v(-14pt)
                #line(length: 100pt, stroke: 1pt)
                #v(-14pt)
                #text(size:10pt)[(Подпись, дата)]
            ],
            align(center)[
                #v(2pt)
                #author.nwa
                #v(-14pt)
                #line(length: 110pt, stroke: 1pt)
                #v(-14pt)
                #text(size:10pt)[(И. О. Фамилия)]
            ],
        )
    ) 
]}

#let mk_title_teacher_sign(adviser, date) = {[
    #set text(weight:"regular")
    #set align(bottom)
    #set text(14pt)
    #grid(
        columns: (100pt, 1fr, 3.5fr),
        gutter: 40pt,
        align(left)[#adviser.work #v(12pt)], 
        align(center)[],
        grid(
            columns:(5fr, 5fr),
            gutter:30pt,
            align(center)[
                #v(2pt)
                #align(right)[#date]
                #v(-14pt)
                #line(length: 100pt, stroke: 1pt)
                #v(-14pt)
                #text(size:10pt)[(Подпись, дата)]
            ],
            align(center)[
                #v(2pt)
                #par(leading: 0.3em)[#adviser.nwa]
                #v(-14pt)
                #line(length: 110pt, stroke: 1pt)
                #v(-14pt)
                #text(size:10pt)[(И. О. Фамилия)]
            ],
        )
    ) 
]}

#let mk_title_year_city(city, year)= {[
    #set align(center)
    #set text(14pt)
    #city #year г.
]}