#lang curr/lib
@declare-tags[management]

@title{Unit 4: The Design Recipe}

@unit-overview/auto[#:lang-table (list (list "Número" @code{+ - * / sq sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Figura"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]{
@unit-descr{Alunos continuam a praticar a Design Recipe aplicando-a em problemas simples.}
 }
@unit-lessons{
@lesson/studteach[
     #:title "The Design Recipe"
     #:duration "25 minutos"
     #:overview "Os alunos são formalmente apresentados aos passos da Design Recipe."
     #:learning-objectives @itemlist[@item{Os alunos praticam usando Assinaturas para criar exemplos de funções}
                                     @item{Students learn to abstract over examples to create functions}]
     #:evidence-statements @itemlist[@item{Given a definition, students will be able to identify the Name, Type and Value that is defined.}
                                     @item{Given a contract and purpose statement for a simple, one-variable function, students will be able to write two Examples}
                                      @item{Given two examples for a simple function, students will be able to identify the variable}
                                      @item{Given two examples for a simple function, students will be able to write the definition}]
     #:product-outcomes @itemlist[@item{Students will use the Design Recipe to define a function, which is used to make a rocket fly.}]
     #:standards (list "A-SSE.1-2" "F-IF.1-3" "F-IF.4-6" "BS-DR.1" "BS-DR.2" "BS-DR.3" "8.F.1-3")
     #:materials @itemlist[@item{Canetas/lápis para os alunos, giz fresquinho para professores}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Language Table (see below)}
                            @item{@resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "Caderno do Estudante"] com nome na capa, e algo para escrever}]
     #:preparation @itemlist[@item{Write agenda on board}
                              @item{Display Class posters, Language Table, Design Recipe}
                              @item{"Rocket" [Rocket.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/openEditor?publicId=KY4s7msuh6" "WeScheme")] preloaded on students' machines}
                              @item{Seating arrangements: ideally clusters of desks/tables}
                              @item{OPTIONAL: Hand out @(hyperlink "https://docs.google.com/document/d/134VD2NShK_VxDog4VG4lMm4jTbpxm2H2cSXqZbHwwSg/edit?usp=sharing" "Warmup activity sheet").}]
     #:prerequisites (list "Defining Functions")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{Watch out for students confusing the rocket's height and time - many students will assume that the @code{rocket-height} function produces the time the rocket has been flying, rather than how high it is.}]}
                @pacing[#:type "challenge"]{@itemlist[@item{Can students make the rocket fly faster?}
                                                       @item{Can students make the rocket sink, instead of fly?}
                                                       @item{Can students make the rocket fly faster over time?}]}
                )
      ]{
        @points[ @point{@student{Funções são um ponto chave na animação de programas de computador. Uma função que desenha uma figura estática de um gato,
                    por exemplo, pode colocá-lo em diferentes localizações com base na entrada. Quando a entrada muda ligeiramente
                    com base no tempo ou de uma interação do usuário, o gato parecerá se mover. Isto é similar a maneira como animações flip-book funcionam (animações feitas em caderno),
                    onde cada página desenhada é uma figura estática, que mudou um pouquinho da anterior. Quando as páginas
                    são passadas rapidamente, as figuras parecem mudar sem problemas.
                    @bannerline{@bitmap{images/flipbookSlides.png}}
                                 }
                        @teacher{@management{Review the importance of definitions for students (defining values helps cut down on redundancy 
                                             and makes future changes easier, defining functions allows for simplicity and testability. 
                                             Be sure to use vocabulary regularly and carefully, pushing students to use the proper terms 
                                             throughout.)}
                                  }
                        }
                 @point{@student{@animated-gif{images/flipbook.gif}Colocando essas imagens juntas, temos uma animação de foguete subindo na tela.
                                  Vamos ver um exemplo deste tipo de animação, usando uma função para fazer o foguete decolar! Vá para
                                  @worksheet-link[#:page 11 #:name "Design-Recipe-Rocket-Height"] em seu "Caderno do Estudante", e leia a "Word Problem" atentamente.
                         @bannerline{O foguete decola, viajando 7 metros por segundo. Escreva uma função chamada @code{rocket-height} que recebe 
                     o número de segundos que se passaram desde que ele decolou, e que produza a altura que o foguete está no momento.}
                         @activity[#:forevidence (list "BS-M&1&1" "BS-DR.1&1&1" "F-IF.1-3&1&1" "F-IF.4-6&1&1")]{
                                    @itemlist[@item{O que a fução @code{rocket-height} recebe como entrada? Esssa entrada é de qual tipo de dado?}
                                              @item{O que a função produz como saída? De que tipo de dado ela é?}
                                              @item{Quais são as três partes da @vocab{Assinatura}?}
                                              @item{Qual o @vocab{Nome} da função que você está sendo convidado a definir?}
                                              @item{Qual o @vocab{Domínio} da função?}
                                              @item{Qual a @vocab{Imagem} da função?}]}}
                         @teacher{Check student understanding carefully, to make sure students read the problem carefully. It may be helpful to draw a diagram or table showing the change of rocket position on the board, and to have students verbally walk through a few examples.}
                         }
                 @point{@student{A Assinatura é uma forma de pensar sobre a função de um modo geral, sem ter que se preocupar como exatamente ela vai funcionar ou como ela será usada. Começando com uma simples questão como essa, os próximos passos ficam mais fáceis de se pensar. Contudo, a Assinatura nem sempre tem informção suficiente! O Domínio de @code{star}, por exemplo, especifica que a função recebe como entrada um Número e duas Strings, mas não menciona que a primeira String deve ser @code{"solid"} ou @code{"outline"}. Para adicionar essa informação, programadores escrevem @vocab{Declarações de Propósito}, que são frases simples que explicam o que a função faz.
                                 @activity[#:forevidence (list "BS-DR.1&1&2" "F-IF.1-3&1&5")]{Abaixo da Assinatura, copie a seguinte Declaração de Propósito para @code{rocket-height}.}
                                 @code[#:multi-line #t]{; rocket-height : Number -> Number
                                                        ; multiplica o número de segundos por 7 para encontrar a altura}}
                         @teacher{This is an opportunity to talk about the importance of writing, clarity, and brevity. What information is essential for a purpose statement? What information is irrelevant?  A good purpose statement describes what is computed and how its inputs are used; it should go beyond the information given in the contract and implicit in the name of the function.}
                         }
                 @point{@student{Em posse da Assinatura e da Declaração de Propósito, torna-se fácil escrever um @code{EXEMPLO}. Todo exemplo começa com o nome da função e uma entrada de exemplo, ambos escritos na Assinatura. Neste caso, você sabe que a função é chamada de @code{rocket-height} e ela espera receber apenas um número como entrada. A Declaração de Propósito vai além, dizendo a você que a entrada é multiplicada por 7. Podemos usar isso para escrever exemplos, com diferentes números de segundos como Entrada.
                                @code[#:multi-line #t]{; rocket-height : Number -> Number
                                                       ; multiplica o número de segundos por 7 para encontrar a altura
                                                       (EXAMPLE (rocket-height 11) 
                                                                (* 11 7))
                                                       (EXAMPLE (rocket-height 72) 
                                                                (* 72 7))}
                                @bold{Nota:} O exemplo mostrado acima foi quebrado em duas linhas! Como as funções e exemplos ficaram mais complexos, torna-se difícil apertá-los em uma única linha. Em seus cadernos, todo exemplo e definição de agora em diante usará o formato duas linhas.
                                @activity[#:forevidence (list "BS-DR.2&1&1" "8.F.1-3&1&3" "F-IF.1-3&1&4")]{Em seu caderno, escreva dois novos exemplos de @code{rocket-height} usando diferentes valores para os números de segundos. Ambos os exemplos terão muito em comum (eles usam @code{rocket-height} como nome da função, multiplicam sua entrada por 7, etc). Assim que terminar de escrevê-las, circule apenas as partes dos exemplos que são *** @italic{mutáveis}, ou seja, que mudam comparando os dois exemplos.}}
                         @teacher{The main idea for students in this activity is to realize that the Contract and Purpose Statement can be relied upon to write examples. Ask students to justify  every part of each example, using only the Contract and Purpose Statement.  Students are often tripped up by the switch from one-line examples to two-line ones. Be @italic{very} careful to point this out to students, and to check their workbooks to see where they are writing their examples. At the end of the activity, make sure that students circle ONLY what has changed.}
                 }
                 @point{@student{Comparando os dois exemplos diferentes, é fácil dizer o que muda. De acordo com a Declaração de Propósitos, é o número de segundos que o foguete esteve voando.
                                 @activity[#:forevidence (list "BS-DR.2&1&3" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "7.EE.3-4&1&4")]{No seu caderno, ***rotule os item que você circulou como "segundos".}}
                         @teacher{Have a discussion with students about why "seconds" is a better name than "time". Talk about specificity, relevance, and readability.}}
                 @point{@student{Rotulando o que é @italic{mutável} dá aos programadores um sentido para os nomes das @vocab{variáveis} de uma função. Variáveis são espaços reservados para valores que podem ser diferentes em diferentes momentos. Uma função que calcula o quanto você paga ao mês para mandar mensagens de texto, por exemplo, pode ter uma variável para o número de mensagens que você enviou.(EXEMPLO ULTRAPASSADO? PODERIA SER COM O NUMERO DE MINUTOS FALADOS EM LIGAÇÕES AO MÊS? MAIS ATUAL?). O número de mensagens que você enviou pode variar de um mês para outro, mas o preço por cada mensagem ainda custa 20 centavos.
                                                  @activity[#:forevidence (list "BS-DR.3&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2")]{Quantas variáveis a função @code{rocket-height} tem? Qual o nome de cada variável? Defina a função, usando todas as informações dos seus Exemplos, Assinaturas e Declaração de Propósitos.}
                                  @code[#:multi-line #t]{; rocket-height : Number -> Number
                                                       ; multiplica o número de segundos por 7 para encontrar a altura
                                                       (EXAMPLE (rocket-height 11) 
                                                                (* 11 7))
                                                       (EXAMPLE (rocket-height 72) 
                                                                (* 72 7))
                                                       (define (rocket-height seconds)
                                                                (* seconds 7))}
                                  }
                         @teacher{As with the Examples, ask students to justify each part of the definition. In this case, the function name can be derived from the Contract, and the variable name and function body from the Examples.}}
                 @point{@student{A Receita de Projeto permite que programadores se concentrem em um passo do problema de cada vez, e usar as estapas anteriores para ajudar a completar o próximo passo.
                                 @activity{@itemlist[@item{O que a @vocab{Assinatura} diz ao programador sobre a função?}
                                                      @item{O que a @vocab{Declaração de Propósito} diz ao programador sobre a função?}
                                                      @item{Como a Assinatura e a Declaração de Propósito ajudam um programador a escrever @vocab{Exemplos}?}
                                                      @item{Por que é útil circular e rotular partes dos Exemplos que mudam?}
                                                      @item{Como fazer todos esses passos ajudam o programador a definir uma função?}]}
                                 }
                         @teacher{}
                         }
                 @point{@student{Você pode ter notado que os Exemplos de @code{rocket-height} escreveu a multiplicação como @code{(* 11 7)},
                    ao invés da resposta real (@code{77}). Por que se preocupar para mostrar o caminho de como o cálculo é realizado? Ao fazer isso,
                    Exemplos podem fornecer dicas sobre o processo que está ocorrendo. No código de Foguete fornecida(Rocket.rkt de
                    @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | ou em @editor-link[#:public-id "KY4s7msuh6" "arquivo online"]),
                    você verá porque é tão importante mostrar seu trabalho ao escrever exemplos.
                                 @activity{Clique em "Run", e espere até uma janela com um foguete aparecer na tela e número para "time" e "height" no topo. Esta anumação está definida para atualizar o foguete toda vez que a Barra de Espaço é pressionada, para simular o tempo passando. Aperte a Barra de Espaço algumas vezes, e perceba que o tempo no topo da janela aumenta. O foguete se move? O tempo está passando, mas a altura do nosso foguete não mudou! Feche a janela do foguete, e veja o código.}}
                         @teacher{}
                         }
                 @point{@student{A Assinatura para esta função está correta: o Nome da função, Domínio e Imagem estão todos escritos aqui. Entretanto, o próximo passo definitivamente apresenta alguns problemas:
                                  @itemlist[#:style 'ordered
                                                    @item{Há apenas um exemplo. Isso torna dificil perceber o que está mudando na função, o que poderia levar a erros na identificação de variáveis}
                                                    @item{O exemplo não mostra como a altura é calculada - em vez disso, o programador escreveu apenas o "resultado", ***sem mostrar como calculou a resposta.}]
                                  }
                         @teacher{}
                         }
                         
                 @point{@student{Ao pular esses passos nos Exemplos, pode ser fácil cometer erros ao definir a função.
                                 @activity[#:forevidence (list "BS-DR.2&1&3" "8.F.1-3&1&3")]{Você pode ver o erro que o programador cometeu?}
                                 Sem ver vários Exemplos, o programador não conseguiu perceber que a altura do foguete tem que ser calculada @italic{a cada entrada}. Em vez disso, o programa produz o mesmo número(neste caso, zero). Como resultado, o foguete está sempre em zero, não importa quantos segundos se passaram.
                                 @activity{@itemlist[@item{Conserte o Exemplo do programador para mostrar o cálculo realizado.}
                                                      @item{Escreva um segundo Exemplo, abaixo do primeiro.}
                                                      @item{Corrija a definição da função, de modo que multiplica o número de segundos por 7.}
                                                      @item{Clique em "Run", e use a barra de espaço para fazer o foguete voar!}]}
                                 }
                         @teacher{}
                         }
        ]}

       
@lesson/studteach[
     #:title "Praticando a Receita de Projeto"
     #:duration "40 minutos"
     #:overview "Students use the Design Recipe to define simple functions (of one and two variables), given various word problems"
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[@item{Given a contract and purpose statement for a simple function, students will be able to write two Examples.}
                                      @item{Given two examples for a simple function, students will be able to identify the variable}
                                      @item{Given two examples for a simple function, students will be able to write the definition}]
     #:product-outcomes @itemlist[@item{Students will write functions to solve simple problems by using the Design Recipe}]
     #:exercises (list (make-exercise-locator "Practicing-the-Design-Recipe" "examples-same-contracts1")
                       (make-exercise-locator "Practicing-the-Design-Recipe" "match-contracts-examples1"))
     #:standards (list "A-SSE.1-2" "F-IF.1-3" "F-IF.4-6" "BS-DR.1" "BS-DR.2" "BS-DR.3")
     #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Language Table}
                            @item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbook"] folders with names on covers, and something to write with}]
     #:preparation @itemlist[@item{Write agenda on board}
                              @item{Display Class posters, Language Table, Design Recipe}
                              @item{Seating arrangements: ideally clusters of desks/tables}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{This is the first time they've seen abstraction over image functions, and students are likely to think that @code{red-square} needs to take in other arguments, such as "solid" and "red".}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}
                                                       @item{}
                                                       @item{}]}
                )
      ]{
        @points[@point{@student{A Receita de Projeto é um guia para definir funções, na qual programadores usam para ter certeza que o código que eles escrevem fará aquilo que eles querem. ***Cada passo deve ser o mais simples possível, dessa maneira erros podem ser detectados no inicio da atividade. Esse guia tem uma série de passos:
                                @itemlist[@item{Transformar um problema descrito para uma Assinatura}
                                           @item{Escrever Exemplos baseados na Assinatura}
                                           @item{Definir uma função que combine com os exemplos}]
                                Comece praticando cada um desses passos, um de cada vez.
                        @activity[#:forevidence (list "BS-DR.1&1&1" "F-IF.1-3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&1")]{
                                  Para cada um dos seguintes problemas, escreva a Assinatura:
                                  @itemlist[@item{Defina a função 'estrela-roxa', que recebe como entrada o tamanho da estrela, e produza um contorno de estrela na cor roxa, com o tamanho recebido.}
                                             @item{Defina a função 'ponto', que recebe como entrada uma cor, e produza um círculo sólido(preenchido com a cor recebida) de raio tamanho 50.}
                                             @item{Para encontrar a média de dois números, eles devem ser somados e depois divididos por dois. Defina a função 'media', que recebe dois números como entrada e produza a média deles.}
                                             @item{A ***logo de uma companhia é uma palavra desenhada grande, em letras vermelhas, inclinada em alguns graus. Defina uma função 'logo', que receba o nome da companhia e a rotação, e produza a logo dessa companhia}]
                                  Coloque um bom @vocab{Nome} para cada função, e lembre que o @vocab{Domínio} e @vocab{Imagem} podem apenas incluir @vocab{tipos} como Números, Figuras, Strings, etc.}}
                        @teacher{If students come up with different Domains or Ranges for their functions, have them explain their thinking for each one. These conversations are an important part of this step!}
                        }
                 @point{@student{A Assinatura é a base para uma função, que dá ao programador informação suficiente para usá-las: o nome da função, os tipos de dados que espera receber e o tipo de dado que ela retorna.
                                 @activity[#:forevidence (list "BS-DR.2&1&1" "8.F.1-3&1&3" "F-IF.1-3&1&4")]{
                                          Agora que você completou as Assinaturas de todos os quatro problemas, tente criar dois Exemplos para cada um deles.}}
                         @teacher{Challenge students to defend their Examples (their function name, the number of inputs, their types and the type of the returned value). Make sure that the two Examples for each function have @italic{different input values}! For each of these questions, students must be able to point to the specific part of their Contract as the justification for their Example.}}
                 @point{@student{Uma vez que você tenha dois Exemplos ou mais, deve ser fácil identificar o que muda entre eles. Na verdade, o número de itens que mudam deve ser o número de itens do Domínio: se o Domínio tem um Número e uma String, então esses dois valores deve ser o que muda entre seus Exemplos.
                                 @activity[#:forevidence (list "BS-DR.2&1&3" "BS-DR.2&1&3" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "7.EE.3-4&1&4")]{
Identifique o que muda entre seus Exemplos do mesmo desafio, e use essas informações para definir suas quatro funções.}}
                         @teacher{Make sure students have chosen good variable names for their function definitions, and ask students to justify every part of the function body. The only acceptable answers should be "I copied this because it's the same in both Examples", or "I used a variable name because it differs between Examples."}}
                @point{@student{@activity[#:forevidence (list "BS-DR.3&1&1" "F-IF.1-3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&1")]{
                                       Vá para @worksheet-link[#:page 12 #:name "Design-Recipe-Red-Square"] em sua apostila, e leia a questão atentamente.
                                          @itemlist[@item{Circlule o @vocab{Nome} da função, e sublinhe sua entrada e o que ela produz.}
                                                       @item{Escreva a @vocab{Assinatura} para essa função, usando as partes sublinhadas para ajudar a encontrar o @vocab{Domínio} e @vocab{Imagem}.}
                                                       @item{Abaixo da Assinatura, escreva a @vocab{Declaração de Propósito} resumindo o que a função faz em uma simples frase}]}
                                }
                        @teacher{Challenge students to explain why this function does not need to know the color of the square, or whether or not it is solid. They main idea here is that the function already "knows" these things, so the only thing that is changing is the size of the square.
                                 Note that there are actually two easy solutions here: using the @code{square} function, or using @code{rectangle} with the same variable for width and height.}
                        }
                 @point{@student{Lembre-se de que a Assinatura e a Declaração de Propósito podem ser usados para escrever Exemplos, mesmo que o programador não tenha certeza de como começar.
                                 @activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.2&1&1" "8.F.1-3&1&3" "F-IF.1-3&1&4")]{
                                           Usando apenas a Assinatura e a Declaração de Propósito, veja o que você pode responder das questões a seguir:
                                           @itemlist[@item{Todo Exemplo começa com o nome da função. Onde você poderia encontrar o nome da sua função?}
                                                      @item{Todo Exemplo deve incluir alguma entrada de amostra. Onde você poderia encontrar quantas entradas essa função precisa, e de que tipos elas são?}
                                                      @item{Todo Exemplo deve conter uma expressão para o que a função deveria @italic{fazer} quando recebe uma entrada. Onde você pode olhar para descobrir o que a função faz?}
                                                      @item{Escreva dois Exemplos no papel, e então circule e ***rotule o que muda entre eles.}]}}
                        @teacher{Make sure students realize that every answer can be found in the Contract or Purpose Statement. Suggestion: write these steps on the board, and draw arrows between them to highlight the process. The goal here is to get students into the habit of asking themselves these questions each time they write Examples, and then using their own work from the previous step to find the answers. NOTE: students can solve this using either @code{square} or @code{rectangle}. The latter requires them to use the same variable twice, which is a useful thought-exercise.}
                        }
                 @point{@student{Uma vez que os dois Exemplos foram escritos e a variável(ou variáveis) foram ***rotuladas, torna-se fácil definir a função.
                                 @activity[#:forevidence (list "BS-DR.3&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "7.EE.3-4&1&4")]{
                                           Usando a Assinatura, a Declaração de Propósito e os Exemplos, veja o que você pode responder das questões a seguir:
                                           @itemlist[@item{Toda definição de função começa com o nome. Onde você já escreveu o nome antes?}
                                                      @item{Toda definição deve conter os nomes das variáveis para as entradas. Onde você já escreveu elas?}
                                                      @item{Toda definição deve funcionar exatamente da mesma maneira como os Exemplos funcionam. Onde é que você olha para descobrir o que a função deve @italic{fazer}?}
                                                      @item{Escreva a definição da função 'quadrado-vermelho' no papel.}]}}
                        @teacher{}
                        }
                 @point{@student{Ao digitar a definição de função, certifique-se de digitar as três partes: A Assinatura e a Declaração de Propósito,
                                 os Exemplos e a Definição. Quando "Run" for clicado, o computador irá ler a definição, testar seus
                                 Exemplos para ter certeza de que funcionam corretamente, e então irá adicionar a definição da função na
                                 linguagem dele. Uma vez adicionado, ***você pode usar essa função como se fosse construída no seu computador.
                                 @activity[#:forevidence (list "BS-IDE&1&1")]{
                                             @editor-link[#:definitions-text "; red-square : Number -> Image
; draw a solid, red square using the given size
(EXAMPLE (red-square 42) (square 42 \"solid\" \"red\"))
(EXAMPLE (red-square 73) (square 73 \"solid\" \"red\"))
(define (red-square size) (square size \"solid\" \"red\"))"
                                                          "Teste essa função usando diferentes valores como entrada e veja o resultado."]
                                             }
                                 }
                        @teacher{}
                        }
                 @point{@student{Algumas funções recebem mais de um entrada. A função @code{quadrado-vermelho} sempre faz quadrados vermelhos sólidos(preenchidos por dentro), com o tamanho sendo o único elemento que muda. Supondo que, nós queremos uma função que faça quadrados vermelhos que sejam @italic{ou} sólidos @italic{ou} ***apenas o contorno de um quadrado? Isto significaria que tamanho e o estilo podem variar, então o usuário poderia digitar @code{(red-square 50 "solid")} ou @code{(red-square 50 "outline")}
                                 @activity[#:forevidence (list "BS-DR.1&1&1" "F-IF.1-3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&1")]{
                                           @itemlist[@item{How would that change the Domain of the function?}
                                                      @item{How would the Examples have to change?}
                                                      @item{How would the definition change?}]
                                            Change each part of the code you typed, to allow @code{red-square} to take in "solid" or "outline" as a second argument.}}
                        @teacher{}
                        }
                 @point{@student{The Design Recipe can be used for functions that take any number of inputs. As a simple example, take the following word problem:
                                 @activity[#:forevidence (list "8.F.1-3&1&3" "F-IF.1-3&1&4" "BS-DR.3&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "7.EE.3-4&1&4")]{
                                           Turn to @worksheet-link[#:page 13 #:name "Design-Recipe-Yard-Area"] in the workbook, and read the word problem carefully.
                                                   @itemlist[@item{Circle the @vocab{Name} of the function, and underline what it takes in and what it produces.}
                                                              @item{How many things does this function take as input? Are they Numbers? Strings? Images?}
                                                              @item{Write the @vocab{Contract} for this function, using what you underlined to help you find the @vocab{Domain} and @vocab{Range}.}
                                                              @item{Underneath the Contract, write the @vocab{Purpose Statement} by summarizing what the function does in a single sentence.}
                                                              @item{Write two Examples for this function, then circle and label what varies between them.}
                                                              @item{Write the Definition for this function.}]}
                                 }
                         @teacher{If time allows, pass out extra Design Recipe worksheets [@resource-link[#:path "DesignRecipeWorksheet.pdf" #:label "PDF"] | @resource-link[#:path "DesignRecipeWorksheet.odt" #:label "Ooo"]], and have students practice with other word problems. Practice variations on red-square, involving two inputs changing while other parameters stay fixed.}
                        }
                 ]
         }
         
@lesson/studteach[
     #:title "The Design Recipe (Algebra)"
     #:duration "40 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "A-SSE.1-2" "F-IF.1-3" "F-IF.4-6" "F-BF.3-4" "BS-DR.1" "BS-DR.2" "BS-DR.3")
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:prerequisites (list "Practicing the Design Recipe") 
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{@points[@point{@student{The real power of programming isn't how well you know the language. It's about how well you can use it to solve problems! 
                                You've learned about a powerful tool that helps you take word problems on paper and turn them into functions on the computer: 
                                the @vocab{Design Recipe}! It turns out that the Design Recipe can also be used to help you solve word problems in algebra, too!
                                @activity[#:forevidence (list "F-IF.1-3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&1" "BS-DR.1&1&1")]{
          Turn to @worksheet-link[#:page 36 #:name "Math-Rocket-Distance"] in your workbooks, read the word problem careflly, and write down the contract 
                  for the function:
                  @italic{"A rocket is flying from Earth to Mars at 80 miles per second. Write a function that describes the distance @math{D} the rocket 
                           has traveled, as a function of time @math{t}}."
                  }}
                        @teacher{}
                        }
                 @point{@student{The distance a rocket travels is measured in numbers of miles, and time is measured in numbers of seconds. This gives us
                                 the contract: 
                                 @bannerline{@math{distance : Number \rightarrow Number}}
                                 Just as before, the Contract gives us a strong hint about how to write the Examples. Here is one Example, written in 
                                 Racket code:  @code{(EXAMPLE (distance 5) (* 5 80))}  Here's the same example, written in algebra: 
                                 @math{distance(5) = 5 \times 80}
                                 @activity[#:forevidence (list "F-IF.1-3&1&2" "F-IF.1-3&1&4" "F-IF.1-3&1&5" "F-IF.4-6&1&3" "A-SSE.1-2&1&1" "BS-DR.2&1&1")]{
                                     Write two additional Examples for this function, using Algebraic notation.}
                                 }
                         @teacher{Point out that the Contract hasn't changed @italic{at all} between Racket and Algebra. 
                                  @management{If students are struggling with the change in syntax, let them first write the Examples in Racket, and 
                                              then convert them to Algebra by following the model shown here.}}
                         }
                 @point{@student{As before, a function's variables can be identified by writing two Examples, and looking at what changes between them.
                                 @activity[#:forevidence (list "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "7.EE.3-4&1&4" "BS-DR.2&1&3" "BS-DR.3&1&1")]{
                                           Using the Examples you've written, identify the variable(s) for the function. 
                                           Then define the function @italic{using Algebraic syntax}.}
                                 The Design Recipe helps transition from a written description of a function into a formal definition, 
                                 @bannerline{@math{distance(4) = 4 \times 80}
                                              @math{distance(7) = 7 \times 80}
                                              @math{distance(t) = t \times 80}}}
                         @teacher{}}
                 @point{@student{@activity[#:forevidence (list "F-IF.1-3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&1" "BS-DR.1&1&1")]{
                                           Turn to @worksheet-link[#:page 37 #:name "Math-Rocket-Time"] in your workbooks, read the word problem, and write 
                                           down the Contract for the function described there: @italic{"A rocket is traveling from Earth to Mars
                                           at 80 miles per second. Write a function that describes the time the rocket has been traveling, as 
                                           a function of distance."}
                                          }
                                  }
                         @teacher{Point out that this is the same relationship between distance and time as before, 
                                  @bold{only now we want be able to see the relationship from the opposite direction}: time in terms of 
                                  distance, rather than distance in terms of time.}
                         }
            @point{@student{Once we have the Contract, it's easy to write Examples:
                            @math{time : Number \rightarrow Number}
                            @activity[#:forevidence (list "F-BF.3-4&1&4" "F-IF.1-3&1&2" "F-IF.1-3&1&4" "F-IF.1-3&1&5" "F-IF.4-6&1&3" "A-SSE.1-2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1")]{
                                      Use the Contract to write two Examples for this function, then identify the variable(s) for the function. 
                                      @itemlist[@item{How many variables does this function have?}
                                                 @item{Name the variable(s).}
                                                 @item{Define this function, using Algebraic syntax.}]}}
                    @teacher{}
                    }
            @point{@student{Once your function is set up, it's easy to just plug in values and get answers back. @italic{With most word problems, the hard part is setting up the function in the first place.} Luckily, the Design Recipe makes setting up that function a lot easier! We've just used it to set up two different functions, which could be used to give us answers in terms of distance or time. Defining functions is like building tools, which you can use to solve simple problems or combine together to solve more complex ones.
                    @activity{Suppose you wanted to know how far the rocket traveled in 6 seconds: which of the two functions here would you use? What if you wanted to know how long it takes for the rocket to go a thousand miles?}}
            @teacher{Ask students to identify which function they would use to answer a variety of different questions.}
            }
            @point{@student{@activity{Turn to @worksheet-link[#:page 38 #:name "Math-Rocket-Collision"] in your workbooks, read the word problem carefully: 
                                              @italic{"A rocket leaves Earth, headed for Mars at 80 miles per second. At the exact same time, an asteroid
                                                      leaves Mars traveling towards Earth, moving at 70 miles per second. If the distance from the Earth 
                                                      to Mars is 50,000,000 miles, how long will it take for them to collide?"}
                                                    @itemlist[@item{What are the facts that the problem @bold{gives you}?}
                                                               @item{What is the problem @bold{asking you for}?}
                                                               @item{Use your answers to complete the following sentence: "Given ____, write a function that produces ____."}
                                                               @item{If such this function existed, what would be a good name for it?}]}}
                                   @teacher{Ultimately, the problem is asking students about a functional relationship between distance and collision-time.}
                                   }
                            @point{@student{If we had a function that computed collision-time, it would be easy to answer this question just by plugging in the distance between the Earth and Mars. Rather than start worrying about setting up an equation, you can use the Design Recipe to build the function itself!
                                            @activity[#:forevidence (list "F-IF.1-3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&1" "BS-DR.2&1&1")]{
                                                   Write down the contract for this function, then write two Examples using different distances.}}
                                    @teacher{}
                                    }
                            @point{@student{By now, you've got the contract for this function and a good purpose statement:
                                            @bannerline{@math{collide : Number \rightarrow  Number}
                                                         @math{collide(0) = ...}}}
                                    @teacher{}
                                    }
                             @point{@student{So now we need to figure out what calculations go after the equals sign. Luckily, we have a hint: we know that whatever it is, it must come out to zero, since we know that they've already collided when they are zero miles apart. 
                                             @activity{If the rocket is going 80 miles/second, and the asteroid is going 70 miles/second, @italic{how fast are they approaching each other?}}}
                                     @teacher{}
                                     }
                             @point{@student{@math{60 + 70 = 150}, so we know that they are getting closer and closer together at a rate of 150 miles per second. This isn't that different from our @code{time} function: we have some speed, and we want to know how much time it will take to go a given distance. So what do we write for our example?
                                              @bannerline{@math{collide(0) = 0/150}}
                                              @activity{Write two Examples of your own using different distances, then define the function so it works with any distance.}}
                                     @teacher{}
                                     }
                             @point{@student{By now, you may already see the big picture: the distance given in this problem can be plugged into the equation without having to define the function itself. Sometimes the Design Recipe will get you to the answer without even having to finish! Other times, however, you may not see the big picture until you've broken the problem down into smaller parts, each with it's own function.
                                             @activity{Open your workbooks to @worksheet-link[#:page 39 #:name "Math-Blank-Recipe"], and practice using the Design Recipe to solve other problems.}}
                                     @teacher{You can add as many pages as you like to the workbooks, using any algebra problem you like. We recommend using word problems from your students' algebra textbook, or even from your state's standardized test!}
                                     }]
         }
       
       
@lesson/studteach[
     #:title "Closing"
     #:duration "5 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{In this unit, you started to see how functions are useful in writing animations: functions help produce information (such as the height of a rocket) that are used to create scenes in a game.  With the extra practice writing functions and using the Design Recipe, you are now ready to start writing functions that will move the elements within your own game.}
                        @teacher{@management{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                                        @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                                        @item{Pass out exit slips, dismiss, clean up.}]}}
                        }
                        ]}
}
