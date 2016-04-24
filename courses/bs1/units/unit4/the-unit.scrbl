#lang curr/lib
@declare-tags[management]

@title{Unit 4: A Receita de Projeto}

@unit-overview/auto[#:lang-table (list (list "Número" @code{+ - * / sq sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Figura"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]{
@unit-descr{Alunos continuam a praticar a Design Recipe aplicando-a em problemas simples.}
 }
@unit-lessons{
@lesson/studteach[
     #:title "A Receita de Projeto"
     #:duration "25 minutos"
     #:overview "Os alunos são formalmente apresentados aos passos da Design Recipe."
     #:learning-objectives @itemlist[@item{Os alunos praticam usando Assinaturas para criar exemplos de funções}
                                     @item{Students learn to abstract over examples to create functions}]
     #:evidence-statements @itemlist[@item{Given a definition, students will be able to identify the Name, Type and Value that is defined.}
                                     @item{Given a contract and purpose statement for a simple, one-variable function, students will be able to write two Examples}
                                      @item{Given two examples for a simple function, students will be able to identify the variable}
                                      @item{Given two examples for a simple function, students will be able to write the definition}]
     #:product-outcomes @itemlist[@item{Estudantes usarão a Receita de Projeto para definir uma função, que será usada para fazer o foguete voar.}]
     #:standards (list "A-SSE.1-2" "F-IF.1-3" "F-IF.4-6" "BS-DR.1" "BS-DR.2" "BS-DR.3" "8.F.1-3")
     #:materials @itemlist[@item{Caneta/lápis para os alunos, giz fresquinho para professores}
                            @item{***Class poster (List of rules, language table, course calendar)}
                            @item{***Language Table (see below)}
                            @item{@resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "Apostila"] com nome na capa, e algo para escrever}]
     #:preparation @itemlist[@item{Escreva o plano da aula no quadro}
                              @item{Mostre Cartazes da Classe, Language Table, Receita de Projeto}
                              @item{"Rocket" [Rocket.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/openEditor?publicId=KY4s7msuh6" "WeScheme")] précarregado na máquina dos alunos}
                              @item{Arranjos de assento: idealmente formando grupos}
                              @item{OPCIONAL: Entregue @(hyperlink "https://docs.google.com/document/d/134VD2NShK_VxDog4VG4lMm4jTbpxm2H2cSXqZbHwwSg/edit?usp=sharing" "atividade de Aquecimento").}]
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
                        @teacher{@management{Comente a importância de definições para os alunos (definição de valores ajuda a reduzir redundância e
                     faz mudanças futuras mais fáceis, definição de funções permite a simplicidade e realização de testes.
                     Certifique-se de usar o vocabulário com regularidade e coom cuidado, empurrando os alunos a usar os
                     termos apropriados por toda parte.)}
                                  }
                        }
                 @point{@student{@animated-gif{images/flipbook.gif}Colocando essas imagens juntas, temos uma animação de foguete subindo na tela.
                                  Vamos ver um exemplo deste tipo de animação, usando uma função para fazer o foguete decolar! Vá para
                                  @worksheet-link[#:page 11 #:name "Receita de Projeto: Foguete-Altura"] em sua Apostila, e leia a "Word Problem" atentamente.
                         @bannerline{O foguete decola, viajando 7 metros por segundo. Escreva uma função chamada @code{altura-foguete} que recebe 
                     o número de segundos que se passaram desde que ele decolou, e que produza a altura que o foguete está no momento.}
                         @activity[#:forevidence (list "BS-M&1&1" "BS-DR.1&1&1" "F-IF.1-3&1&1" "F-IF.4-6&1&1")]{
                                    @itemlist[@item{O que a fução @code{altura-foguete} recebe como entrada? Esssa entrada é de qual tipo de dado?}
                                              @item{O que a função produz como saída? De que tipo de dado ela é?}
                                              @item{Quais são as três partes da @vocab{Assinatura}?}
                                              @item{Qual o @vocab{Nome} da função que você está sendo convidado a definir?}
                                              @item{Qual o @vocab{Domínio} da função?}
                                              @item{Qual a @vocab{Imagem} da função?}]}}
                         @teacher{Verifique a compreensão do aluno com cuidado, para garantir que os alunos leiam cuidadosamente o problema. Pode ser útil desenhar um diagrama ou tablea para mostrar a mudança de posição do foguete na placa, e que os alunos andem verbalmente através de alguns exemplos.}
                         }
                 @point{@student{A Assinatura é uma forma de pensar sobre a função de um modo geral, sem ter que se preocupar como exatamente ela vai funcionar ou como ela será usada. Começando com uma simples questão como essa, os próximos passos ficam mais fáceis de se pensar. Contudo, a Assinatura nem sempre tem informção suficiente! O Domínio de @code{star}, por exemplo, especifica que a função recebe como entrada um Número e duas Strings, mas não menciona que a primeira String deve ser @code{"solid"} ou @code{"outline"}. Para adicionar essa informação, programadores escrevem @vocab{Declarações de Propósito}, que são frases simples que explicam o que a função faz.
                                 @activity[#:forevidence (list "BS-DR.1&1&2" "F-IF.1-3&1&5")]{Abaixo da Assinatura, copie a seguinte Declaração de Propósito para @code{foguete-altura}.}
                                 @code[#:multi-line #t]{; altura-foguete : Number -> Number
                                                        ; multiplica o número de segundos por 7 para encontrar a altura}}
                         @teacher{Essa é uma oportunidade de falar da importância da escrita, clareza e concisão. Wual informação é essencial para a declaração de propósito? Qual informação não é tão importante? Uma boa declaração de propósito nos diz o que é computado e como a entrada é usada; ela deve ir além da informação dada na assinatura e implícita no nome da função.}
                         }
                 @point{@student{Em posse da Assinatura e da Declaração de Propósito, torna-se fácil escrever um @code{EXEMPLO}. Todo exemplo começa com o nome da função e uma entrada de exemplo, ambos escritos na Assinatura. Neste caso, você sabe que a função é chamada de @code{foguete-altura} e ela espera receber apenas um número como entrada. A Declaração de Propósito vai além, dizendo a você que a entrada é multiplicada por 7. Podemos usar isso para escrever exemplos, com diferentes números de segundos como Entrada.
                                @code[#:multi-line #t]{; foguete-altura : Number -> Number
                                                       ; multiplica o número de segundos por 7 para encontrar a altura
                                                       (EXAMPLE (foguete-altura 11) 
                                                                (* 11 7))
                                                       (EXAMPLE (foguete-altura 72) 
                                                                (* 72 7))}
                                @bold{Nota:} O exemplo mostrado acima foi quebrado em duas linhas! Como as funções e exemplos ficaram mais complexos, torna-se difícil apertá-los em uma única linha. Em seus cadernos, todo exemplo e definição de agora em diante usará o formato duas linhas.
                                @activity[#:forevidence (list "BS-DR.2&1&1" "8.F.1-3&1&3" "F-IF.1-3&1&4")]{Em seu caderno, escreva dois novos exemplos de @code{foguete-altura} usando diferentes valores para os números de segundos. Ambos os exemplos terão muito em comum (eles usam @code{foguete-altura} como nome da função, multiplicam sua entrada por 7, etc). Assim que terminar de escrevê-las, circule apenas as partes dos exemplos que são *** @italic{mutáveis}, ou seja, que mudam comparando os dois exemplos.}}
                         @teacher{A ideia principal para alunos nessa atividade é perceber que Assinaturas e Declarações de Propósito podem ser invocadas para escrever exemplos. Peça aos alunos para justificar cada parte do exemplo, usando apenas a Assinatura e a Declaração de Propósito. Eles muitas vezes tropeçam em mudar de uma-linha para exemplos em duas-linhas. Tenha @italic{muito} cuidado ao apontar isso para os alunos,  e verifique suas apostilas para ver onde estão escrevendo seus exemplos. No fim da atividade, tenha certeza de que eles circularam APENAS o que mudou.}
                 }
                 @point{@student{Comparando os dois exemplos diferentes, é fácil dizer o que muda. De acordo com a Declaração de Propósitos, é o número de segundos que o foguete esteve voando.
                                 @activity[#:forevidence (list "BS-DR.2&1&3" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "7.EE.3-4&1&4")]{No seu caderno, ***rotule os item que você circulou como "segundos".}}
                         @teacher{Converse com os alunos do porque "segundos" é um melhor nome que "tempo". Fale sobre especificidade, relevância e legibilidade de código.}}
                 @point{@student{Rotulando o que é @italic{mutável} dá aos programadores um sentido para os nomes das @vocab{variáveis} de uma função. Variáveis são espaços reservados para valores que podem ser diferentes em diferentes momentos. Uma função que calcula o quanto você paga ao mês para mandar mensagens de texto, por exemplo, pode ter uma variável para o número de mensagens que você enviou.(EXEMPLO ULTRAPASSADO? PODERIA SER COM O NUMERO DE MINUTOS FALADOS EM LIGAÇÕES AO MÊS? MAIS ATUAL?). O número de mensagens que você enviou pode variar de um mês para outro, mas o preço por cada mensagem ainda custa 20 centavos.
                                                  @activity[#:forevidence (list "BS-DR.3&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2")]{Quantas variáveis a função @code{foguete-altura} tem? Qual o nome de cada variável? Defina a função, usando todas as informações dos seus Exemplos, Assinaturas e Declaração de Propósitos.}
                                  @code[#:multi-line #t]{; foguete-altura : Number -> Number
                                                       ; multiplica o número de segundos por 7 para encontrar a altura
                                                       (EXAMPLE (foguete-altura 11) 
                                                                (* 11 7))
                                                       (EXAMPLE (foguete-altura 72) 
                                                                (* 72 7))
                                                       (define (foguete-altura seconds)
                                                                (* seconds 7))}
                                  }
                         @teacher{Como nos Exemplos, peça que os alunos justifiquem cada parte da difinição. Neste caso, o nome da função pode ser conseguido na Assinatura, e nome da variável e corpo da função podem vir dos Exemplos.}}
                 @point{@student{A Receita de Projeto permite que programadores se concentrem em um passo do problema de cada vez, e usar as estapas anteriores para ajudar a completar o próximo passo.
                                 @activity{@itemlist[@item{O que a @vocab{Assinatura} diz ao programador sobre a função?}
                                                      @item{O que a @vocab{Declaração de Propósito} diz ao programador sobre a função?}
                                                      @item{Como a Assinatura e a Declaração de Propósito ajudam um programador a escrever @vocab{Exemplos}?}
                                                      @item{Por que é útil circular e rotular partes dos Exemplos que mudam?}
                                                      @item{Como fazer todos esses passos ajudam o programador a definir uma função?}]}
                                 }
                         @teacher{}
                         }
                 @point{@student{Você pode ter notado que os Exemplos de @code{foguete-altura} escreveu a multiplicação como @code{(* 11 7)},
                    ao invés da resposta real (@code{77}). Por que se preocupar em mostrar como o cálculo é realizado? Ao fazer isso,
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
     #:overview "Alunos usam a Receita de Projeto para definir simples funções (de uma ou duas variáveis), dando vários problemas para resolver"
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[@item{Given a contract and purpose statement for a simple function, students will be able to write two Examples.}
                                      @item{Given two examples for a simple function, students will be able to identify the variable}
                                      @item{Given two examples for a simple function, students will be able to write the definition}]
     #:product-outcomes @itemlist[@item{Os alunos escreverão funções para resolver problemas simples usando a Receita de Projeto}]
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
                                  @itemlist[@item{Defina a função 'estrela-roxa', que recebe como entrada o tamanho da estrela, e produza um "contorno" de estrela na cor roxa, com o tamanho recebido.}
                                             @item{Defina a função 'ponto', que recebe como entrada uma cor, e produza um círculo sólido(preenchido com a cor recebida) de raio tamanho 50.}
                                             @item{Para encontrar a média de dois números, eles devem ser somados e depois divididos por dois. Defina a função 'media', que recebe dois números como entrada e produza a média deles.}
                                             @item{A ***logo de uma companhia é uma palavra desenhada grande, em letras vermelhas, inclinada em alguns graus. Defina uma função 'logo', que receba o nome da companhia e a rotação, e produza a logo dessa companhia}]
                                  Coloque um bom @vocab{Nome} para cada função, e lembre que o @vocab{Domínio} e @vocab{Imagem} podem apenas incluir @vocab{tipos} como Números, Figuras, Strings, etc.}}
                        @teacher{Se aparecerem diferentes Domínios e Imagens para suas funções, deixe eles explicarem seu pensamento para cada um. Essas conversas são uma parte importante desta etapa!}
                        }
                 @point{@student{A Assinatura é a base para uma função, que dá ao programador informação suficiente para usá-las: o nome da função, os tipos de dados que espera receber e o tipo de dado que ela retorna.
                                 @activity[#:forevidence (list "BS-DR.2&1&1" "8.F.1-3&1&3" "F-IF.1-3&1&4")]{
                                          Agora que você completou as Assinaturas de todos os quatro problemas, tente criar dois Exemplos para cada um deles.}}
                         @teacher{Desafie seus alunos a defender seus Exemplos(Nome da função, número de entradas, seus tipos e o valor de retorno). Esteja certo de que os dois Exemplos tenham @italic{diferentes valores de entrada}! Para cada uma dessas perguntas, os alunos devem ser capazes de apontar para a parte específica de dua Assinatura como justificativa de seu Exemplo.}}
                 @point{@student{Uma vez que você tenha dois Exemplos ou mais, deve ser fácil identificar o que muda entre eles. Na verdade, o número de itens que mudam deve ser o número de itens do Domínio: se o Domínio tem um Número e uma String, então esses dois valores deve ser o que muda entre seus Exemplos.
                                 @activity[#:forevidence (list "BS-DR.2&1&3" "BS-DR.2&1&3" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "7.EE.3-4&1&4")]{
Identifique o que muda entre seus Exemplos do mesmo desafio, e use essas informações para definir suas quatro funções.}}
                         @teacher{Esteja certo que os alunos escolheram bons nomes de variáveis para suas definições, e peça para justificarem cada parte do corpo da função. As únicas resposta aceitáveis devem ser "Eu copiei isto porque está presente nos dois Exemplos", ou "Eu usei uma variável porque é o que muda entre Exemplos."}}
                @point{@student{@activity[#:forevidence (list "BS-DR.3&1&1" "F-IF.1-3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&1")]{
                                       Vá para @worksheet-link[#:page 12 #:name "Design-Recipe-Red-Square"] em sua apostila, e leia a questão atentamente.
                                          @itemlist[@item{Circlule o @vocab{Nome} da função, e sublinhe sua entrada e o que ela produz.}
                                                       @item{Escreva a @vocab{Assinatura} para essa função, usando as partes sublinhadas para ajudar a encontrar o @vocab{Domínio} e @vocab{Imagem}.}
                                                       @item{Abaixo da Assinatura, escreva a @vocab{Declaração de Propósito} resumindo o que a função faz em uma simples frase}]}
                                }
                        @teacher{Desafie os alunos a explicar porque esta função não precisa saber a cor do quadrado, ou se é sólido ou não. A ideia principal aqui é que a função já "sabe" essas coisas, então a única coisa que é mutável é o tamanho do quadrado.
                                 Perceba que na verdade existem duas soluções fáceis: usando a função @code{square}, ou usando @code{rectangle} com a mesma variável para largura e altura.}
                        }
                 @point{@student{Lembre-se de que a Assinatura e a Declaração de Propósito podem ser usados para escrever Exemplos, mesmo que o programador não tenha certeza de como começar.
                                 @activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.2&1&1" "8.F.1-3&1&3" "F-IF.1-3&1&4")]{
                                           Usando apenas a Assinatura e a Declaração de Propósito, veja o que você pode responder das questões a seguir:
                                           @itemlist[@item{Todo Exemplo começa com o nome da função. Onde você poderia encontrar o nome da sua função?}
                                                      @item{Todo Exemplo deve incluir alguma entrada de amostra. Onde você poderia encontrar quantas entradas essa função precisa, e de que tipos elas são?}
                                                      @item{Todo Exemplo deve conter uma expressão para o que a função deveria @italic{fazer} quando recebe uma entrada. Onde você pode olhar para descobrir o que a função faz?}
                                                      @item{Escreva dois Exemplos no papel, e então circule e ***rotule o que muda entre eles.}]}}
                        @teacher{Esteja certo de que os alunos percebam que toda resposta pode ser encontrada na Assinatura ou na Declaração de Propósito. Sugestão: escreva estes passos no quadro, e desenhe setas entre eles para destacar o processo. O objetivo aqui é fazer com que os alunos tenham o hábito de fazer-se estas perguntas cada vez que forem escrever Exemplos, em seguida, usar seu próprio esforço do passo anterior para encontrar as respostas. NOTA:alunos podem usar tanto @code{square} como @code{rectangle}. O último requer usar a mesma variável duas vezes, o que é um ótimo exercício-mental.}
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
                                           @itemlist[@item{Como isso altera o Domínio da função?}
                                                      @item{Onde os Exemplos mudariam?}
                                                      @item{Onde a definição muda?}]
                                            Mude o código que você digitou, para permitir que @code{quadrado-vermelho} receba com entrada "solid" ou "outline" como segundo argumento.}}
                        @teacher{}
                        }
                 @point{@student{A Receita de Projeto pode ser usada em funções com qualquer número de entradas. Um simples exemplo, pegue o seguinte ***word problem:
                                 @activity[#:forevidence (list "8.F.1-3&1&3" "F-IF.1-3&1&4" "BS-DR.3&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "7.EE.3-4&1&4")]{
                                           Vá para a @worksheet-link[#:page 13 #:name "Receita de Projeto-Area-Jardim"] em sua apostila e leia o problema atentamente.
                                                   @itemlist[@item{Círcule o @code{Nome} da função, e sublinhe a entrada e o que ela produz.}
                                                              @item{Quantos itens a função recebe como entrada? São Números? Strings? Figuras?}
                                                              @item{Escreva a @vocab{Assinatura} para essa função, usando o que você sublinhou para ajudar-te a encontrar o @vocab{Domínio} e @vocab{Imagem}.}
                                                              @item{Abaixo da Assinatura, escreva a @vocab{Declaração de Propósito} resumindo o que a função faz em uma única frase.}
                                                              @item{Escreva dois Exemplos para esta função, então círcule e nomeie o que varia entre.}
                                                              @item{Escreva a Definição para esta função.}]}
                                 }
                         @teacher{Se o tempo permitir, dê uma olhada nas folhas de Exercício extra da Receita de Projeto [@resource-link[#:path "DesignRecipeWorksheet.pdf" #:label "PDF"] | @resource-link[#:path "DesignRecipeWorksheet.odt" #:label "Ooo"]], e pratique com os alunos com outras questões. Seja uma variação do quadrado-vermelho, envolvendo duas entradas que variam, enquanto outros parâmetros continuam fixos.}
                        }
                 ]
         }
         
@lesson/studteach[
     #:title "A Receita de Projeto (Algebra)"
     #:duration "40 minutos"
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
      ]{@points[@point{@student{O verdadeiro poder da programação não é o quanto você conhece a linguagem. É o quão bem você pode usá-la para resolver seus problemas! 
                                Você já aprendeu sobre uma poderosa ferramenta que ajuda-lhe a pôr ***problemas escreito no papel e então transformá-los em funções no computador:
                                a @vocab{Receita de Projeto}! Acontece que a Receita de Projeto também pode ser usada para ajudar a resolver problemas na matemática também! 
                                @activity[#:forevidence (list "F-IF.1-3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&1" "BS-DR.1&1&1")]{
          Vá para @worksheet-link[#:page 36 #:name "Math-Rocket-Distance"]  em sua Apostila, leia o problema atentamente e escreva a Assinatura
                     para a função:
                  @italic{"Um foguete está voando da Terra para Marte a 80 quilômetros por segundo. Escreva uma função que retorne a distância @math{D} que o
                      foguete viajou, em função do tempo @math{t}}."
                  }}
                        @teacher{}
                        }
                @point{@student{A distância que o foguete viaja é medida em número de quilômetros, e o tempo é medido em número de segundos. Isto
                                dá-nos a Assinatura:
                                 @bannerline{@math{distancia : Numero \rightarrow Numero}}
                                 Assim como antes, a Assinatura nos dá uma forte dica de como escrever Exemplos. Aqui está um Exemplo, escrito em
                                 Racket:  @code{(EXEMPLE (distancia 5) (* 5 80))}  E aqui o mesmo exemplo, escrito em algebra:
                                 @math{distancia(5) = 5 \times 80}
                                 @activity[#:forevidence (list "F-IF.1-3&1&2" "F-IF.1-3&1&4" "F-IF.1-3&1&5" "F-IF.4-6&1&3" "A-SSE.1-2&1&1" "BS-DR.2&1&1")]{
                                     Escreva mais dois Exemplos, usando notação Algébrica.}
                                 }
                         @teacher{Destaque que a Assinatura @italic{não mudou em nada} entre Racket e Algebra. 
                                  @management{Se os alunos estão lutando com a mudança de sintaxe, deixe-os primeiro escrever os Exemplos em racket, e 
                                              então converta-os em Algebra seguindo o modelo mostrado aqui.}}
                         }
                 @point{@student{Assim como antes, as variáveis da função podem ser identificadas escrevendo dois Exemplos, e olhando p que muda entre eles.
                                 @activity[#:forevidence (list "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "7.EE.3-4&1&4" "BS-DR.2&1&3" "BS-DR.3&1&1")]{
                                           Usando os Exemplos que você escreveu, identifique as variável(eis) da função.
                                           Então defina a função @italic{usando o estilo Algébrico}.}
                                 A Receita de Projeto ajuda na transição de uma descrição escrita de uma função para uma definição formal,
                                 @bannerline{@math{distancia(4) = 4 \times 80}
                                              @math{distancia(7) = 7 \times 80}
                                              @math{distancia(t) = t \times 80}}}
                         @teacher{}}
                 @point{@student{@activity[#:forevidence (list "F-IF.1-3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&1" "BS-DR.1&1&1")]{
                                           Vá para a @worksheet-link[#:page 37 #:name "Math-Rocket-Time"] em sua apostila, leia a descrição do problema e
                     escreva a Assinatura para esta função: @italic{"Um foguete está viajando da Terra para Marte a 80 quilômetros por
                      segundo. Escreva uma função que retorna o tempo que o foguete esteve viajando, em função da distância."}
                                          }
                                  }
                         @teacher{Aponte que esta é a mesma relação entre distância e tempo de antes, 
                                  @bold{mas desta vez estamos vendo a relação na direção oposta}: o tempo em função 
                                  da distância(entramos com a distancia e descobriamos o tempo), em vez da distância em termos de tempo.(o contrário)}
                         }
            @point{@student{Uma vez que já temos a Assinatura, é fácil escrever Exemplos:
                            @math{tempo : Numero \rightarrow Numero}
                            @activity[#:forevidence (list "F-BF.3-4&1&4" "F-IF.1-3&1&2" "F-IF.1-3&1&4" "F-IF.1-3&1&5" "F-IF.4-6&1&3" "A-SSE.1-2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1")]{
                                      Use a Assinatura para escrever Exemplos para esta função, e então identifique a variável(eis) da função.
                                      @itemlist[@item{Quantas variáveis esta função possui?}
                                                 @item{Nome da(s) variável(eis).}
                                                 @item{Defina esta função, usando a sintaxe Algébrica.}]}}
                    @teacher{}
                    }
            @point{@student{Uma vez definida sua função, é fácil inserir valores e receber os resultados de volta. @italic{Como na maioria dos problemas, a parte mais difícil é a definição da função.} Felizmente, a Receita de Projeto torna essa configuração muito mais fácil! Nós acabamos de usá-la para configurar duas funções diferentes, que podem ser usadas para nos dar respostas em termos de distância e tempo. Definição de funções é como construir ferramentas, que podem ser usadas para resolver problemas simples ou combinadas juntas para resolver os mais complexos.
                    @activity{Suponha que você queira saber quanto o foguete viajou em 6 segundos: qual das duas funções você usaria? E se você quizer saber quanto tempo demora para o foguete viajar mil quilômetros?}}
            @teacher{Peça aos alunos a identificar qual função eles usariam para responder uma variedade de diferentes questões.}
            }
            @point{@student{@activity{Vá para @worksheet-link[#:page 38 #:name "Math-Rocket-Collision"] em sua apostila, e leia a questão atentamente: 
                                              @italic{"Um foguete deixa a Terra, viajando a Marte a 80 auilômetros por segundo. No mesmo momento, um asteróide
                      passa por Marte viajando em direção a Terra, viajando a 70 quilômetros por segundo. Se a distância da Terra
                      a Marte é de 50.000.000 quilômetros, quanto tempo levará para que elem se colidam?"}
                                                    @itemlist[@item{Quais são as informação que o problema @bold{lhe disse}?}
                                                               @item{O que o problema está pedindo pra você?}
                                                               @item{Use suas respostas para completar a seguinte frase: "Dada a ___________, escreva uma função que produza _________."}
                                                               @item{Caso essa função exista, qual seria um bom nome para ela?}]}}
                                   @teacher{Na última análise, o problema está pedindo aos alunos uma relação entre distância e tempo-de-colisão.}
                                   }
                            @point{@student{Se tivéssemos uma função que calcula tempo-de-colisao, seria fácil responder essa pergunta apenas conectando a distância entre Terra e Marte. Ao invés de começar a se preocupar com a criação de uma equação, vocẽ pode usar a Receita de Projeto para construir a sua própria função!
                                            @activity[#:forevidence (list "F-IF.1-3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&1" "BS-DR.2&1&1")]{
                                                   Escreva a assinatura para essa função, e então escreva dois Exemplos usando diferentes distâncias.}}
                                    @teacher{}
                                    }
                            @point{@student{Até agora, você tem a assinatura para a função e uma boa declaração de propósito:
                                            @bannerline{@math{colisao : Numero \rightarrow  Numero}
                                                         @math{colisao(0) = ...}}}
                                    @teacher{}
                                    }
                             @point{@student{Então agora precisamos descobrir que cálculos vão depois do sinal de igual. Felizmente nós temos uma dica: Nós sabemos que qualquer que seja a entrada, ***it must come out to zero, since we know that they've already collided when they are zero miles apart.(eles ja colidiram quando a distância entre eles for zero) 
                                             @activity{Se o fuguete está a 80 quilômetros/segundo, e o asteróide a 70 quilômetros/segundo, @italic{quanto eles se aproximam a cada segundo?}}}
                                     @teacher{}
                                     }
                             @point{@student{@math{60 + 70 = 150}, por isso sabemos que eles estão cada vez mais perto em um ritmo de 150 quilômetros por segundo. Isto não é diferente da nossa função @code{tempo}: nós temos uma velocidade, e queremos saber quanto tempo leva para chegar a uma certa distância. Como nó escrevemos para nosso exemplo?
                                              @bannerline{@math{colisao(0) = 0/150}}
                                              @activity{Escreva dois Exemplos usando diferentes distâncias, então defina uma função que funcione com qualquer distância.}}
                                     @teacher{}
                                     }
                             @point{@student{Aqui você pode ja pode ter visto o quadro geral: a distância dada neste problema pode ser ligada a função sem ter que definir uma função para ela. Às vezes a Receita de Projeto te dá a resposta mesmo sem ter chegado ao fim! Outras vezes, você pode não ver o quadro geral até que tenha quebrado o problema em partes pequenas, cada uma com sua própria função.
                                             @activity{Abra sua apostila na @worksheet-link[#:page 39 #:name "Math-Blank-Recipe"], e pratique usando a Receita de Projeto para resolver outros problemas.}}
                                     @teacher{Você pode adicionar quantas páginas quiser em sua apostila, usando qualquer questão de algebra que quiser. Nós recomendamos usar questões de algebra a partir do livro de algebra dos seus alunos, ou questões padronizadas, fique a vontade!}
                                     }]
         }
       
       
@lesson/studteach[
     #:title "Encerramento"
     #:duration "5 minutos"
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
        @points[@point{@student{Nesta unidade, você começou a ver como funções podem ser úteis em construir animações: funções ajudam a produzir informação(como a altura de um foguete) que pode ser usada para criar cenas em um jogo. Com prática extra na escrita de funções e usando a Receita de Projeto, agora você está preparado para começar a escrever funções que irão mover os elemento dentro do seu próprio jogo.}
                        @teacher{@management{@itemlist[@item{Peça que alunos digam voluntariamente o que aprenderam nesta lição}
                                                        @item{Comportamentos de recompensa que você valoriza: trabalho em equipe, fazer anotações, engajamento, etc}
                                                        @item{***Pass out exit slips, dismiss, clean up.}]}}
                        }
                        ]}
}
