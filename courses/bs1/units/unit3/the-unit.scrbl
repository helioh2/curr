#lang curr/lib
@declare-tags[management]

@title{Unidade 3: Iniciando com Definições}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sqr sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]{
  @unit-descr{Alunos são apresentados à Janela de Definições, e aprendem a sintaxe de definir valores de vários tipos. Eles também são iniciados a sintaxe de definição de funções e criam exemplos.}
}
@unit-lessons{
@lesson/studteach[
     #:title "Revisão"
     #:duration "5 minutos"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "BS-PL.2" "6.NS.5-8" "F-IF.1-3")
     #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Language Table (see below)}]
     #:preparation @itemlist[@item{OPTIONAL: Hand out @(hyperlink "https://docs.google.com/document/d/1FN2uLBnwdk3N4Ci6-qf1n6z-M8KpToo27wqZmRlS5as/edit?usp=sharing" "Warmup activity sheet").}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Até agora, você viu Círculos de Avaliação, aprendeu sobre Assinaturas e experimentou com vários 
                                tipos de dados. Certifique-se de lembrar o que cada um desses é, e olhe nas lições anteriores se 
                                você precisar.
                                @activity[#:forevidence (list "BS-PL.2&1&1" "6.NS.5-8&1&2")]{
                                     Você pode pensar em três funções que desenham formas? Veja se você pode escrever suas Assinaturas sem 
                                     precisar olhar novamente na página de Assinaturas. Qual tipo de dado é sempre cercado por aspas? 
                                     Quais são as coordenadas do canto inferior esquerdo da tela? E da parte superior direita? 
                                     }
                                }
                        @teacher{@management{Revise Círculos de Avaliação, dando atenção especial para @vocab{tipos} e @vocab{assinaturas}. 
                                            Certifique-se que os alunos estão confortáveis ouvindo - e usando - os termos apropriados para descrever o código.}}
                        }
                 ]}

       
@lesson/studteach[
     #:title "Definindo Variáveis"
     #:duration "10 minutos"
     #:overview "Alunos definem nomes para valores simples (Números, Strings e Figuras) e usam eles em expressões"
     #:learning-objectives @itemlist[]
     #:evidence-statements  @itemlist[@item{Students will be able to define names for Number, String and Image values.}
                                       @item{Students will be able to identify the name, domain, range, and variable name for a function, when presented with a completed Design Recipe.}
                                      @item{Students will be able to explain what happens when the "Run" button is pressed.}]
     #:product-outcomes @itemlist[]
     #:standards (list "BS-PL.3" "BS-IDE")
     #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}
                            @item{Language Table (see below)}]
     #:preparation @itemlist[]
     #:prerequisites (list "Intro to Programming" "Contracts")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
  @points[@point{@student{Suponde que queremos fazer uma imagem que tem 50 triângulos, sólidos e idênticos. Você teria que escrever 
                                @code{(triangle 50 "solid" "red")} cinquenta vezes! Para piorar a situação, qualquer alteração a esses triãngulos 
                                teria que ser repetida a todos as cinquenta expressões! Bons programadores sabem que seu esforço é melhor gasto em 
                                outro lugar, então eles fizeram com que as linguagens de programação evitassem toda essa repetição. 
                                Eles escrevem algo uma vez, e definem um atalho na linguagem, e então usam esse atalho onde quiserem.}
                       @teacher{}}
                @point{@student{Nós nomeamos valores em nossa linguagem usando a declaração @vocab{define}. Vamos ver 
                               @editor-link[#:definitions-text "(define shape1 (triangle 50 \"solid\" \"red\"))\n"
                                                               #:interactions-text ""
                                                               "um exemplo de uma definição"]
                               , que define @code{shape1} para ser um triângulo sólido vermelho. Quando você clicar em "Run", você pode digitar @code{shape1} 
                               na Janela de Iterações e o computador mostrará a você um triângulo vermelho. O que você pensa que aconteceria se você 
                               digitasse @code{shape1} @italic{sem clicar} em "Run"?
                               }
                        @teacher{Certifique-se que os alunos vejam o que acontece quando @code{shape1} é executada sem clicar primeiro em "Run", para que 
                                 eles possam ler e entender o erro. Da mesma forma, peça para modificarem a definição e calcular @code{shape1} 
                                 novamente - ainda sem clicar em "Run". É importante para eles entenderem que executar um programa 
                                 faz com que o computador @italic{leia as definições}, e que qualquer mudança precisar abriga a ser lidos novamente.
                                 }
                        }
                @point{@student{Definições vão na parte esquerda da tela(ao lado da Janela 
                               de Iterações); que é chamada de @vocab{Janela de Definições}.        
                               @activity[#:forevidence (list "BS-PL.3&1&1")]{
                                     @itemlist[@item{Digite a definição de @code{shape1} na @vocab{Janela de Definições}.}
                                                @item{Clique "Run" para que o computador leia a definição.}
                                                @item{O que você pensa que vai acontecer quando você digita @code{shape1} na Janela de Iterações?}
                                                @item{Adicione uma nova linha na janela de definições, logo abaixo da definição de @code{shape1}. Adicione uma nova 
                                                      definição chamada @code{shape2}, e defina para ser um círculo sólido azul, de tamanho de raio 20.}
                                                @item{Clique "Run", e tente calcular @code{shape2}.}
                                                @item{Na próxima linha, defina um novo valor chamado @code{idade} para ser o quantos anos você tem.}
                                                @item{Na próxima linha, defina um novo valor chamado @code{nome} para ser uma String que representa seu nome.}]
                                      }
                               
                          @bannerline{Cada vez que "Run" é clicado, o computador lê todas as definições e às adiciona a linguagem. Se uma 
                                      definição é modificada, o computador continuará usando a definição anterior até que "Run" seja clicado e leia no novo valor.}
                          }
                        @teacher{}
                        }
                @point{@student{@activity[#:forevidence (list "BS-PL.3&1&1" "BS-IDE&1&2")]{
                                    Uma nova linha na Janela de Definições, defina um valor chamado @code{cor-dos-olhos} para ser a cor dos seus olhos.
                                    Não clique "Run" ainda! 
                                    @itemlist[@item{Vá para a Janela de Iterações e tente calcular @code{cor-dos-olhos}. Você deve receber uma mensagem de
                                                    erro que o computador não sabe sobre @code{cor-dos-olhos}, porque você não clicou em "Run" 
                                                    depois de adicionar a definição.}
                                              @item{Clique em "Run".}
                                              @item{Digite @code{cor-dos-olhos} novamente na janela de Iterações. Desta vez você não deve receber uma mensagem de erro.}]}
                                 Definiçẽs são úteis porque podemos reutilizá-las em outras expressões. Por exemplo, podemos usar @code{cor-dos-olhos} 
                                 dentro de outra expressão, como em @code{(circle 10 "solid" cor-dos-olhos)}. Vamos praticar usando as definições dentro de outras expressões.
                                 }
                        @teacher{}
                        }
                @point{@student{@activity[#:forevidence (list "BS-PL.3&1&1" "BS-IDE&1&1")]{
                                    Crie as definições a seguir na Janela de Definições, e verifique-as na Janela de Iterações: 
                                    @itemlist[@item{Defina um valor chamado @code{premio} para ser uma estrela sólida amarela (você pode escolher o tamanho).}
                                              @item{Defina uma valor chamado @code{grande} que usa @code{scale} para fazer seu @code{premio} três vezes maior.}
                                              @item{Defina uma valor chamado @code{girar} que usa @code{rotate} para girar sua grande estrela amarela por @code{45} graus.}
                                              @item{Digite @code{girar} na Janela de Iterações, e certifique-se de obter uma grande e inclinada estrela amarela.}
                                              @item{Acontece que as estrelas verdes são mais populares em prêmios que as amarelas. Altere a definição de seu @code{premio} para fazer a estrela verde ao invés da amarela. Clique "Run" para que o computador leia sua nova definição.}
                                              @item{Agora digite @code{girar} na janela de Iterações novamente. De que cor a estrela apareceu? Se você definiu as expressões @code{grande} e @code{girar} para usar suas definições, você deve conseguir uma estrela verde inclinada! Se você não conseguiu uma estrela verde, tente consertar suas definições para fazer isso acontecer.}
                                             ]
                                   }
                          }
                        @teacher{É importante dar as alunos tempo suficiente para experimentar o @code{define}. Eles precisam entender que e podem usar 
                                 os nomes definidos no lugar dos valores. Peça a eles definirem vários valores (cada um de um tipo), e então pratique usando-os 
                                 dentro de outras expressões.}
                        }
                 ]
}
       
@lesson/studteach[
     #:title "Defining Variables (Algebra)"
     #:duration "10 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "7.EE.3-4" "A-SSE.1-2")
     #:materials @itemlist[@item{"Algebra Translation" [@resource-link[#:path "source-files/Algebra.rkt" #:label "DrRacket"] | @(hyperlink "http://www.wescheme.org/openEditor?publicId=s2s0tkTgeF" "WeScheme")] preloaded on students' machines, with monitors off.}]
     #:preparation @itemlist[]
     #:prerequisites (list "Defining Variables")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
             @point{@student{In our programming language, variables are defined by: 
                             @bannerline{@code[#:multi-line #t]{(define x 4)
                                                                (define y (+ 4 9))
                                                                (define z (* x 2))}}
                             Values can be fixed (like the first example), the result of an expression (the second), or even be defined in terms of other 
                             variables (the third). We can do the same things in algebra:
                             @bannerline{@math{x = 4}
                                          @math{y = 4+9}
                                          @math{z = x \times 2}}
                             @activity[#:forevidence (list "7.EE.3-4&1&4" "A-SSE.1-2&1&1")]{Convert the following three Algebra definitions into Racket definitions:
                                       @itemlist[@item{@math{dollars = 16.50}}
                                                 @item{@math{feet = 2 \times 3}}
                                                  @item{@math{inches = feet \times 12}}]
                                       }}
                     @teacher{For this activity write all Racket expressions on one side of the board, and all algebra expressions on the other.
                              You'll want to line them up as closely as possible, to reinforce the connection between the two languages.}
                     }
            @point{@student{@activity{Turn to @worksheet-link[#:page 35 #:name "Translating-to-Algebra"] page 35 in your workbooks. 
                                      You will see a bunch of value definitions written in code - take 2 minutes to convert this into math. GO!}}
                    @teacher{}
                    }]
         }
     
@lesson/studteach[
     #:title "Game Images"
     #:duration "30 minutes"
     #:overview "Students define values in their videogames"
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students will name their videogame project}
                                  @item{Students will modify the definitions for @code{TITLE, TITLE-COLOR, BACKGROUND, PLAYER, TARGET} and @code{DANGER}}]
     #:standards (list "BS-PL.3")
     #:materials @itemlist[@item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbook"] folders with names on covers.}]
     #:preparation @itemlist[@item{Create student game files. [See the (teachers-only) @resource-link[#:path "teachers/teachers-guide/teachers-guide.html" #:label "Teachers Guide"]]}
                              @item{On student machines: Student Game Files (generated from "Game" template [Game.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=Y36jKsvXsZ" "WeScheme")])}]
     #:prerequisites (list "Defining Values" "Strings and Images" "Brainstorming")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity{Open the videogame file (Game.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"]
                                          or @editor-link[#:public-id "Q1X9Y8ZayX" "the online template"] so that you can see the code,
                                          and click "Run". (You may need to wait a few seconds for the images to load!) The window that
                                          appears is a running videogame, but you probably notice that nothing is moving - even if you 
                                          hit the "up" or "down" arrows! For now, click the "close" button to return to the code.}
                                 This file contains a list of definitions, where you will get to define how your game characters look, move, and interact. As you scroll down to the bottom, you'll see a bunch of 
                                 dummy definitions that have been filled in for you. It is up to @italic{you} to come up with definitions for your own game!
                                 @activity{Scroll to the very bottom of the screen, reading each of the things you will have to define. Stop when you get to the very bottom, where you see 
                                           @code{(make_game...)} used as part of a definition. What do you notice about the values passed into @code{make_game}?}
                                 @code{make_game} is a function that has been provided for you, which takes all of your definitions and assembles them into a running game. Behind the scenes, @code{make_game}
                                 inserts your definitions inside a giant function that is called every tenth of a second, and uses your definitions to decide what is happening at that moment.}
                        @teacher{You can remind students that Bootstrap:2 will show them how to write this function, and customize it to create more advanced games (multiplayer, maze, etc).}
                        }
                 @point{@student{In the Definitions window, you will see that this program defines several values: @code{TITLE}, for example, is defined to the be the String @code{"My Game"}.
                                @activity[#:forevidence (list "BS-PL.3&1&1")]{@itemlist[@item{If you type @code{TITLE} into the Interactions window, what do you think it would evaluate to?}
                                           @item{What other definitions do you see?}
                                           @item{What are their values?}
                                           @item{What are their types?}
                                           @item{Try evaluating each of these values in the Interactions window, starting with @code{BACKGROUND}}]}
                                }
                        @teacher{@management{By now, you should have students' graphics already created, and 
                                             @(hyperlink "../../resources/teachers/teachers-guide/teachers-guide.html#addingimages" "added to the file)").}
                                  The purpose of this activity is to increase students' confidence in @italic{reading} and @italic{talking about} code. 
                                  Make sure students get a lot of practice speaking aloud, both to each other and to the instructor.}
                        }
                 @point{@student{If you don't like the definitions provided here, you can change them! You can modify the @code{TITLE} and @code{TITLE-COLOR} 
                                    to change what is displayed at the top of your screen, and you can change the definitions for your game images as well: 
                                    @(video-link (hyperlink "http://www.teachertube.com/viewVideo.php?video_id=288261" "Video: A screencast of this section - follow along to see how to change images in your game")).}
                         @teacher{Images should be in PNG or GIF format. Background images should be 640x480, and character images should generally be 
                                   no larger than 200px in either dimension. Make sure that the character images have transparent backgrounds! 
                                   TIP: use animated GIFs for the characters - not only does the animation make the game look a lot better, but these 
                                   images usually have transparent backgrounds to begin with. For more instructions on setting up the game files and
                                   images, read the @(hyperlink "../../resources/teachers/teachers-guide/teachers-guide.html#addingimages" "Coding Instructions") 
                                   document.}
                         }
                 @point{@student{If you want to change one of your definitions so that the image is smaller or larger, you can use the @code{scale} function:
                                  @code[#:multi-line #t]{; scale : Number Image -> Image}
                                  This function resizes the @code{Image} based on the @code{Number}. For example, @code{(scale 10 (triangle 5 "solid" "green")} will make the that tiny triangle ten times as large, while @code{(scale 0.5 (rectangle 200 100 "outline" "purple"))} will shrink the rectangle by half.
                                  @activity{Practice using @code{scale} to grow and shrink different images. If you would like to experiment with more functions, try using the contracts below:
                                                           @code[#:multi-line #t]{; flip-vertical : Image -> Image
                                                                                  ; flip-horizontal : Image -> Image
                                                                                  ; rotate : Number Image -> Image}
                                                              @editor-link[#:interactions-text "(scale 3 (star 50 \"solid\" \"red\"))"
                                                                           "Try playing with this example"]
                                                           }
                                  }
                         @teacher{If a student struggles here, you should fall back to the Circles of Evaluation and Contracts. For example: have the student first draw a circle for @code{rotate}, and have them use the Contract to figure out what the inputs are. When they get to the second input (the @code{image}), ask them what kind of shape they want to rotate. Whatever their answer is, have them look it up in their contracts page, and draw a Circle of Evaluation @italic{inside} the one they drew for @code{rotate}. Once the Circle of Evaluation is correct, have them convert it to code. Once they are confident, you can challenge them to apply another operation to the whole expression, perhaps flipping the rotated shape vertically.}
                         }
                 @point{@student{Another definition in this program is @code{SCREENSHOT}. This expression uses the @code{put-image} function to layer one image on top of another, using coordinates to decide where to place each image. 
                         @activity{Advertisements for videogames often have static pictures (called @italic{screenshots}) of the game in action, so people will know what it looks like to play. Change the coordinates used in the definition of @code{SCREENSHOT} so that you have a picture of your game. (Remember: the screen is 640 pixels wide, by 480 pixels tall!)}}
                         @teacher{This can be a useful opportunity to review coordinates, especially for students who need the practice.}
                        }
                 @point{@student{Being able to define values in a programming language is a powerful tool, which allows programmers to simplify their code and make it both more readable and maintainable. }
                         @teacher{}
                         }
             ]
         }
       
@lesson/studteach[
     #:title "Defining Functions"
     #:duration "20 minutes"
     #:overview "Students are get a taste of the Design Recipe, but primarily they're introduced to the syntax for function definition."
     #:learning-objectives @itemlist[@item{Students will be able to define very simple functions, given a simple word problem.}]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Students will define at least two functions, using the Design Recipe}]

     #:exercises (list (make-exercise-locator "Defining-Functions" "match-examples-functions1")
                       (make-exercise-locator "Defining-Functions" "create-contracts-examples1"))
     #:standards (list "F-IF.1-3" "F-IF.4-6" "F-BF.1-2" "BS-PL.3" "BS-DR.1" "BS-DR.2" "BS-DR.3")
     #:materials @itemlist[@item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbook"] folders with names on covers.}]
     #:preparation @itemlist[]
     #:prerequisites (list "Contracts" "Stings and Images" )
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
                 ]{
                   @points[@point{@student{Defining a @vocab{value} is helpful when a program has lots of identical expressions. Sometimes, however, a program has expressions that aren't identical, but are just @italic{very similar}. A program that has fifty solid, green triangles can be simplified by defining a single value, @italic{as long as they are all the same size}. But what if a program has fifty green triangles of different sizes?}
                                   @teacher{}
                                   }
                            @point{@student{Think about the Image functions you have already used, 
				           like @code{star} and @code{circle}.  They take inputs and produce 
					   images.  Similarly, we might want a green-triangle function that 
					   takes the size as an input and produces a green triangle.  
					   The programming language doesn't provide this function, 
					   but it does let you define your own functions.  We want to define
					   our own function (let's call it @code{gt}, for green triangle) that
					   takes in a Number and produces a solid green triangle of whatever size we want.
                                           @itemlist[@item{@code{(gt 10)} would be a shortcut for @code{(triangle 10 "solid" "green")}}
                                                     @item{@code{(gt 20)} would be a shortcut for @code{(triangle 20 "solid" "green")}}
                                                     @item{@code{(gt 1980)} would be a shortcut for @code{(triangle 1980 "solid" "green")}}
                                                     @item{@code{(gt 98)} would be a shortcut for @code{(triangle 98 "solid" "green")}}
                                                     @item{and so on...}]
                                            Problems that require a function definition can be phrased as a word problem such as the following:
                                            @bannerline{Define a function @code{gt}, which takes in a Number and produces a solid, green triangle of the given size.}
                                            Luckily, we can follow specific steps to define functions from word problems.  Let's work through the steps to 
                                            define @code{gt}.
                                            }
                                    @teacher{To make this more concrete, have a student "act" as gt. To call the function, another student says "gt ten!" 
                                             (calling out both the name of the function and the input). The actor responds "triangle ten solid green", 
                                             to signify the work that the function does when it receives an input.}
                                    }
                            @point{@student{@bannerline{Step 1: Write the Contract}
                                             The first step in defining a function is to write its @vocab{Contract}.  Contracts summarize three pieces 
                                             of essential information about a function:
                                              @itemlist[@item{The @vocab{Name} of the function: in this case, the name is given, as @code{gt}}
                                                         @item{The @vocab{Domain} of a function, which is the types of data that the function expects: in this case, just a single Number.}
                                                         @item{The @vocab{Range} of this function, which is the type of data that the function produces: in this case an Image since it produces solid, green triangles}]
                                              Here's the @code{gt} Contract written as code.  The line starts with a semicolon, followed by the name, a colon, the Domain, an arrow, then the Range:
                                              @code[#:multi-line ""]{; gt : Number -> Image}
                                              Word problems give several clues as to the name, Domain, and Range of a function.  Be sure to read the problem carefully! Some word problems will describe functions that take multiple inputs in their Domain, or inputs of different types.
                                              @activity[#:forevidence (list "BS-DR.1&1&1")]{
                                                              Open your workbook to @worksheet-link[#:name "Fast-Functions"], where it says 
                                                              "fast functions", and write the Contract for the @code{gt} function.}}
                                    @teacher{It is often a good idea to give students examples of different word problems, and have them pick out the 
                                             contract for each one. @(new-paragraph) Contracts are written as @italic{comments} in Racket: whenever Racket 
                                             sees a semicolon, it ignores the rest of the line after the semicolon.  This means that you will never get an 
                                             error message from Racket for a malformed comment.  That also means that you have to check your students' 
                                             contracts more closely, because the computer will not check anything about them (format or contents).}
                                    }
                            @point{@student{@bannerline{Step 2: Give Examples}
                                             It's always a good idea to think through a few examples before defining the function. Examples show 
                                             the shortcut that a function is trying to provide.  This programming language provides a special 
                                             construct, called @code{EXAMPLE}, which helps you write down how the function is used and what it 
                                             should compute. You can see two such examples here, written under the contract:
                                             @code[#:multi-line ""]{; gt : Number -> Image
                                                                    (EXAMPLE (gt   50) (triangle   50 "solid" "green"))
                                                                    (EXAMPLE (gt  100) (triangle  100 "solid" "green"))}
                                             These examples tell the computer that writing @code{(gt 50)} should produce the same result as
                                             @code{(triangle 50 "solid" "green")}, and that @code{(gt 100)} is equivalent to 
                                             @code{(triangle 100 "solid" "green")}. The word problem specifies that the examples @italic{must} 
                                             use the name 'gt', and must all produce solid, green triangles.
                                             @activity[#:forevidence (list "BS-PL.3&1&2" "BS-DR.2&1&1" "F-BF.1-2&1&1" "F-IF.1-3&1&2" "F-IF.1-3&1&4")]{
                                                       In your workbook, write two examples of your own for this function.}}
                                    @teacher{@bold{Be sure to point out that EXAMPLE is capitalized, and that all examples are written in the definitions window.} Many students will follow along here without really understanding, simply by pattern-matching. Be sure to ask them lots of questions, to have them justify each step:
                                             @itemlist[@item{Why does the example have to start with gt? (Because it's the Name of the function, specified in the contract)}
                                                        @item{How do we know @code{gt} requires only one number? (Because it's the Domain of the function, specified in the contract)}
                                                        @item{How do we know to use @code{triangle}? (Because the word problem tells us what shape it has to produce)}
                                                        @item{How do we know the triangle has to be solid and green? (Because the word problem tells us what shape it has to produce)}
                                                        @item{How do we know the correct order for the inputs to @code{triangle}? (The contract for @code{triangle} tells us)}] 
                                                                                                                                                                          One of the big ideas here is that each step informs the subsequent step. Make sure to explicitly connect them for students, pointing out that the Contract gives strong hints about how to write each part of the examples. }
                                    }
                            @point{@student{Programmers often write several examples for each function. Examples like these are a way for a 
                                            programmer to think through their work.  Examples also make it easy to look at what parts of the
                                            expression can change, or @italic{vary}, depending on the inputs.
                                    @activity[#:forevidence (list "BS-DR.2&1&3" "F-IF.1-3&1&2" "F-IF.1-3&1&4" "F-IF.4-6&1&1")]{
                                                  Write the following examples on paper and circle the parts of the examples that are different:
                                             @code[#:multi-line ""]{(EXAMPLE (gt   50) (triangle   50 "solid" "green"))
                                                                    (EXAMPLE (gt  100) (triangle  100 "solid" "green"))}}

                                    Once you know which parts of the expression change, label the circles with a name that describe their contents.
                                    For example, in our two @code{gt} examples, we have circled the @italic{size} of the triangle.  Your circled and
                                    labeled expressions should look like the following diagram: 
                                    @bannerline{@bitmap{images/circled-examples.png}}}
                            @teacher{Pay close attention to what students circle: they should circle something in each part of the Example 
                                     (the function use on the left and the expression on the right); they should also use the same name for 
                                     the same concept across the expressions.  Their circles will correspond to the variables in their functions, 
                                     so the variables should appear in both the left and the right sides of the Example.}
                                    }
                            @point{@student{@bannerline{Step 3: Define the function}
                                             After writing the Contract, two Examples, and the labeled circles, defining the function itself is 
                                             relatively simple.
                                             @itemlist[@item{Copy everything that stays the same (everything that wasn't circled) in one of your
                                                             EXAMPLE lines (onto paper or into your editor)}
                                                       @item{In place of each circle, write the label you gave to that circle}
                                                       @item{Change @code{EXAMPLE} to @code{define}}]
                                             @code[#:multi-line ""]{; gt : Number -> Image
(EXAMPLE (gt   50) (triangle   50 "solid" "green"))
(EXAMPLE (gt  100) (triangle  100 "solid" "green"))
(define  (gt size) (triangle size "solid" "green"))}}
                                    @teacher{This can be a good opportunity to point out that the parts of the examples that were changeable 
                                             (or @italic{vary-able}) are what determines when we need to use the @italic{variable}.}
                                    }
                            @point{@student{@activity[#:forevidence (list "BS-PL.3&1&3" "BS-DR.3&1&1" "F-IF.1-3&1&2")]{
                                               @itemlist[@item{On your paper, define the @code{gt} function, then type the @vocab{Contract}, @vocab{Examples} 
                                                               and @code{Definition} into the Definitions window.}
                                                         @item{Click "Run", to have the computer read this definition.}
                                                         @item{Use the function you've defined, by typing @code{(gt 100)} in the Interactions window.}
                                                         @item{Try using the function with different Numbers}]}
                                    @editor-link[#:definitions-text "; gt : Number -> Image
(EXAMPLE (gt 50) (triangle 50 \"solid\" \"green\"))
(EXAMPLE (gt 95) (triangle 95 \"solid\" \"green\"))
(define (gt size) (triangle size \"solid\" \"green\"))"
                                                 "Your answer should look something like this."]
                                    }
                                    @teacher{}
                                    }
                            @point{@student{These steps are knows as the @vocab{Design Recipe}, which is a powerful tool for defining functions based on word problems.
                                            @bannerline{Practice: Write a function @code{bc}, which takes in a Number and produces a solid, blue circle of the given size.}
                                            @activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1" "F-IF.1-3&1&2" "F-IF.1-3&1&4" "F-IF.4-6&1&1")]{
                                                      In your workbook (still on @worksheet-link[#:name "Fast-Functions"]), fill out the @vocab{Contract} 
                                                      for this function.
                                                      @itemlist[@item{What is the function's Name?}
                                                                 @item{What is the function's Domain?}
                                                                 @item{What is the function's Range?}]
                                                      Using the Contract you've written, write two @vocab{Examples} for the function.
                                                      @itemlist[@item{What part of the Contract helps you fill in the left side of an Example?}
                                                                 @item{What part of the Contract tells you what the function needs as an input?}
                                                                 @item{How can the Range of a function help you write the Example?}]
                                                      Looking at those two examples, circle the parts that are @italic{change-able}, then label them with a good @vocab{variable name}.
                                                      @itemlist[@item{Is the variable name you chose the same as the one you chose for @code{gt}? Why or why not?}
                                                                 @item{Why is it helpful to choose a variable name before defining the function?}]
                                                      Now write the @vocab{function definition}, using the Examples you've written.}
                                            }
                                    @teacher{You will want to explicitly connect each step in the Design Recipe to every other step. Ask students to justify 
                                             each part of their @bold{Contract} by referring back to the Word Problem, to justify each step of their 
                                             @bold{Examples} by referring back to the Word Problem @italic{and} Contract, and finally to justify each 
                                             step of the @bold{definition} by referring to the Examples. The same variable name can be used in multiple
                                             functions, just as in math (where many functions use @code{x} as the variable name, for example)}
                                    }
                            @point{@student{Thinking through the word problem step-by-step, we arrive at:
                                             @code[#:multi-line ""]{; bc : Number -> Image
(EXAMPLE (bc     16) (circle     16 "solid" "blue"))
(EXAMPLE (bc    421) (circle    421 "solid" "blue"))
(define  (bc radius) (circle radius "solid" "blue"))}
                                            }
                                    @teacher{}
                                    }
                             @point{@student{@bannerline{Practice: Write a function @code{dot}, which takes in a Color and produces a solid circle of the given color, with a radius of 20.}
                                            @activity[#:forevidence (list  "BS-DR.1&1&1" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1" "F-IF.1-3&1&2" "F-IF.1-3&1&4" "F-IF.4-6&1&1")]{
                                                    In your workbook (still on @worksheet-link[#:name "Fast-Functions"]), fill out the @vocab{Contract} for this function.
                                                      @itemlist[@item{What is the function's Name?}
                                                                 @item{What is the function's Domain?}
                                                                 @item{What is the function's Range?}]
                                                      Using the Contract you've written, write two @vocab{Examples} for the function, then circle and label the variables.
                                                      @itemlist[@item{What part of the Contract helps you fill in the left side of an Example?}
                                                                 @item{What part of the Contract tells you what the function needs as input?}
                                                                 @item{How can the Range of a function help you write the Example?}
                                                                 @item{What is a good variable name for what changes between these Examples.}]
                                                      Now write the @vocab{function definition}, using the Examples you've written.}
                                            Thinking through the word problem step-by-step, we arrive at:
                                             @code[#:multi-line ""]{; dot : String -> Image
(EXAMPLE (dot  "red") (circle 15 "solid"  "red"))
(EXAMPLE (dot "blue") (circle 15 "solid" "blue"))
(define  (dot  color) (circle 15 "solid"  color))}
                                            }
                                    @teacher{}
                                    }]
                    }


@lesson/studteach[
     #:title "Defining Functions (Algebra)"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "A-SSE.1-2" "F-IF.1-3" "F-IF.4-6")
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:prerequisites (list "Defining Functions" "Defining Variables (Algebra)")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{@points[@point{@student{You've seen many functions defined in Racket, for example: 
                                @code{(define (f x) (+ x 1))}
                        @activity[#:forevidence (list  "F-IF.1-3&1&2" "F-IF.1-3&1&4" "F-IF.4-6&1&1")]{@itemlist[@item{What is the name of this function?}
                                             @item{How many variables does it take?}
                                             @item{What is the name of the variable(s)?}
                                             @item{What does this function do to the variable @code{x}?}
                                             @item{Define a function @code{g}, which takes in a variable @code{q} and multiplies it by 20.}]}}
                        @teacher{Make sure students understand that the function is named @italic{f}, and not "fx" or "f of x". Have students practice other function definitions, to make sure they're comfortable translating a verbal description into Racket syntax.}
                        }
                 @point{@student{To translate these functions into algebra, we do something similar to what we did with the values. Here is the same function @code{f}, written in algebra syntax: @math{f(x) = x + 1}                                                                                                      @activity{Translate the function @code{g} into algebra, using the translation of @code{f} as a model. Once that is complete try defining a function @math{h}, which takes in a variable @code{x} and divides it by 2.}}
                         @teacher{Have students practice this translation with a few other functions, again translating from a verbal description (rather than Racket syntax).}}
                 @point{@student{@activity{Translate the rest of the functions, listed on @worksheet-link[#:page 35 #:name "Translating-to-Algebra"].}}
                         @teacher{}
                         }]
         }
                 
                 
@lesson/studteach[
     #:title "Closing"
     #:duration "5 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
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
        @points[@point{@student{In this unit, you learned how to name values and define functions.  You will use named values to provide images for your game elements.  You will use functions to make your game elements move.  As you will see soon, functions are critical to making games.  You'll do a bit more practice with them in the next unit, including writing your first function that makes something move across the screen.}
                        @teacher{@management{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                                        @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                                        @item{Pass out exit slips, dismiss, clean up.}]}}
                        }
                        ]}
}

