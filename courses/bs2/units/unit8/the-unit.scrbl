#lang curr/lib

@title{Unidade 8: Detecção de Colisões}
@declare-tags[management]

@unit-overview/auto[#:lang-table (list (list "Número" @code{+ - * / sq sqrt expt}) 
                                       (list "String" @code{string-append string-length})                          
                                       (list "Figura" @code{rectangle circle triangle ellipse radial-star scale rotate put-image})
                                       (list "Booleano" @code{= > < string=? and or}))]{   
@unit-descr{Students return to the Pythagorean Theorem and distance formula they used in Bootstrap 1, this time with data structures and the full update-world function.}
}
@unit-lessons{
@lesson/studteach[#:title "Introdução"
        #:duration "5 minutos"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{Lápis/canetas aos alunos, e giz/marcadores de quadro branco aos professores}
                            @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                            @item{Ambiente de Edição (WeScheme ou DrRacket com o pacote bootstrap-teachpack instalado)}
                            @item{Apostila dos Alunos}
                            @item{Tablea de Linguagem}
                            @item{Recortes da Figura do Gato e do Cachorro}
                            @item{Cutouts of Pythagorean Theorem packets [@(resource-link #:path "images/pythag1.png" #:label "1"), @(resource-link #:path "images/pythag2.png" #:label "2")] - 1 per cluster}
                            @item{The Ninja World 5 file [NW5.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @editor-link[#:public-id "hTE94bR2V5" "WeScheme"] preloaded on students' machines}]
        #:preparation @itemlist[@item{Arranjos de assento: preferencialmente aglomerando as mesas}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Agora mesmo, tanto no Mundo Ninja quanto nos seus jogos, nada acontece quando o jogador colide com outro 
                                personagem do jogo. Precisamos escrever uma função que muda isso. Isto vai precisar de 
                                um pouco de matemática, mas felizmente é exatamente o mesmo que estava no Bootstrap:1.
                                @bitmap{images/numberline.png}                               
                                @activity{@itemlist[@item{Na imagem acima, o quão distantes o gato e o cachorro estão?}
                                                     @item{Se o gato foi movido um espaço para a direita, o quão longe eles estariam?}
                                                     @item{E se o gato e o cachorro trocassem de lugar um com o outro?}]}
                                
                                Em uma dimensão, assim como em uma régua, encontrar a distância é muito fácil. Se os personagens 
                                estão na mesma linha, você apenas subtrai uma coordenada da outra, e você consegue a distância. 
                                No entanto, se tudo o que fizermos for subtrair o segundo número do primeiro, a função funcionaria apenas 
                                metado do tempo!

                                @activity{Quando o gato e o cachorro foram trocados, você ainda subtrai a posição do cachorro da 
                                          posição do gato, ou subtrai a posição do gato da posição do cachorro? Por que?}}
                        @teacher{Desenhe uma linha numérica no quadro, com os recortes do gato e do cachorro nas posições dadas.
                                 Peça aos alunos para dizerem a você a distância entre eles, e mova as imagens de acordo. 
                                 Fazer com que os alunos façam isso também pode funcionar: desenhe uma linha numérica, peça que dois alunos fiquem em pé em diferentes 
                                 pontos da linha, usando seus braço ou recortes para dar aos objetos diferentes tamanhos. Movimente os alunos pela 
                                 linha numérica até eles se encontrarem, e calcula a distância na linha numérica.}}
                 ]
         }

@lesson/studteach[#:title "Distância em 1D"
        #:duration "10 minutos"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Distâncias não podem ser negativas, então precisamos ter certeza de sempre subtrair o número 
                                menor do número maior. Se os personagens estão na mesma dimensão, existem duas condições:
                                se o primeiro número for maior, e a outra se o segundo número for maior.
                                @activity{@itemlist[@item{Que tipo de função nós precisamos, quando temos várias 
                                                          @italic{condições}?}
                                                     @item{Vá para a @worksheet-link[#:page 36 #:name "Design Recipe Line Length"].}
                                                     @item{Qual é o Nome da função? O Domínio? A Imagem?}
                                                     @item{Escreva dois exemplos para @code{tamanho-linha} em que ela diminui o 
                                                           menor número do maior. Comece com um exemplo usando 
                                                           os números 23 e 5, e depois faça um segundo exemplo com 5 e 23 na 
                                                           @italic{outra ordem}.}]}
@code[#:multi-line #t]{(EXAMPLE (tamanho-linha 23 5) (- 23 5))
                       (EXAMPLE (tamanho-linha 5 23) (- 23 5))}}
                        @teacher{}}
                 @point{@student{Agora temos uma ideia dos resultados para a instrução @code{cond}, mas a função @code{cond} também 
                                precisa de Testes. Nós queremos @italic{testar} para ver ser o primeiro 
                                número dado para @code{tamanho-linha} é maior que o segundo número. 
                                @activity{@itemlist[@item{Como você escreveria esse teste em código no Racket?}
                                                     @item{E qual seria o resultado para esse teste? Se @code{a} é
                                                           maior que @code{b}, qual número deve ser subtraído do 
                                                           outro?}
                                                     @item{Como você poderia incluir um teste para saber se os dois números são iguais,
                                                           @italic{sem} adicionar um terceiro ramo no @code{cond}?}
                                                     @item{Escreva a definição para @code{tamanho-linha}.}]}     
@code[#:multi-line #t]{(define (tamanho-linha a b)
                       (cond
                       [(> a b) (- a b)]
                       [(>= b a) (- b a)]))}}
                        @teacher{É possível substituir o segundo teste com um @code{else}, porque existem apenas duas opções:
                                 @code{tamanho-linha} vai subtrair @code{b} de @code{a}, ou @code{a} do @code{b}. (Se os 
                                 números são iguais, não importa a ordem com que eles são subtraídos.) No entanto, d
                    bers are equal, it doesn't matter which is subtracted.) No entanto, fazer com que os alunos escrevam os 
                                 testes completos os faz pensar sobre o que exatamente está sendo testado em cada ramo da função.
                                 
                                 É possível evitar usar um condicional inteiro pegando o valor absoluto da diferença 
                                 (a função @code{abs} faz isso); se você está trabalhando com alunos mais velhos que já conhecem sobre
                                 valor absoluto você poderia mostrá-los. Usando @code{cond}, no entanto, enfatiza como estruturas de código surge 
                                 dos exemplos.}}
                 ]
         }

@lesson/studteach[#:title "A Formulada Distância"
        #:duration "20 minutos"
        #:overview ""
        #:learning-objectives @itemlist[@item{Reinforce their understanding of the distance formula}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[ @item{Students will write the distance function}]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Unfortunately you don't have any code to calculate the distance in two dimensions.
                                All you have so far is something that tells you the length in only the x- or y-dimension.                   
                                @bitmap{images/ABCgraph.png}
                                @activity{@itemlist[@item{How could you find the distance between the two points shown
                                                          in this image?}
                                                     @item{How could you find the length of the dotted line, also 
                                                           called the @vocab{Hypoteneuse}?}]}
                                Let's start with what we do know: the dotted line sort of makes a triangle, and we can
                                find out the length of the other two sides, labeled "A," "B" and "C." 
                                @activity{What is the line-length of A?}
                                To make your life easier, you can use the function you already wrote: @code{line-length}.
                                In this example, (line-length A) is 4 and (line-length B) is 3, but we still don't know C.}
                        @teacher{@management{Draw this image on the board, with the lines labeled "A", "B", and "C".}}}
                 @point{@student{Ancient civilizations had the same problem: they also struggled to find the distance
                                 between points in two dimensions. Let’s work through a way to think about this problem:
                                 what expression computes the length of the hypoteneuse of a right triangle?}
                       @teacher{@management{This exercise is best done in small groups of students (2-3 per group).} 
                                 Pass out Pythagorean Proof materials [@(resource-link #:path "images/pythag1.png" #:label "1"), 
                                 @(resource-link #:path "images/pythag2.png" #:label "2")] to each group, and have them
                                 review all of their materials:@itemlist[@item{A large, white square with a smaller one drawn inside}
                                                                          @item{Four gray triangles, all the same size}]
                                 Everyone will have a packet with the same materials, but each group's triangles are
                                 a little different. The activity workes with triangles of all sizes, so each pair will
                                 get to test it out on their own triangles. @management{draw the diagram on the board.}}
                        }
                @point{@student{@bitmap{images/csquared.png}For any right triangle, it is possible to draw a picture 
                                 where the hypoteneuse is used for all four sides of a square. In the diagram shown 
                                 here, the white square is surrounded by four gray, identical right-triangles, each 
                                 with sides A and B. The square itself has four identical sides of length C, which 
                                 are the hypoteneuses for the triangles. If the area of a square is expressed by 
                                 @math{side * side}, then the area of the white space is @math{C^{2}}.}
                        @teacher{Have students place their gray triangles onto the paper, to match the diagram.}
                       }
                @point{@student{@animated-gif{images/Pythag_anim.gif} By moving the gray triangles, it is possible 
                                 to create two rectangles that fit inside the original square. While the space 
                                 taken up by the triangles has shifted, it hasn't gotten any bigger or smaller.
                                 Likewise, the white space has been broken into two smaller squares, but in total
                                 it remains the same size. By using the side-lengths A and B, one can calculate
                                 the area of the two squares.
                                 @activity[#:forevidence (list "8.G.6-8&1&1" "8.G.6-8&1&1" "8.G.6-8&1&3")]{
                                      What is the area of the smaller square? The larger square?}}
                       @teacher{You may need to explicitly point out that the side-lengths of the triangles can be
                                used as the side-lengths of the squares.}
                       }
                @point{@student{@bitmap{images/absquare.png}The smaller square has an area of @math{A^{2}}, and the
                                 larger square has an area of @math{B^{2}}. Since these squares are just the original
                                 square broken up into two pieces, we know that the sum of these areas must be equal 
                                 to the area of the original square:
                                 @bannerline{@math{A^{2} + B^{2} = C^{2}}}
                                 @activity[#:forevidence (list "8.G.6-8&1&1" "8.G.6-8&1&2" "8.G.6-8&1&3")]{
                                     Does the same equation work for any values of A and B?}}
                       @teacher{}
                       }
                @point{@student{To get C by itself, we take the square-root of the sum of the areas:
                                @bannerline{@math{\sqrt{A^{2} + B^{2}} = C}}
                                Pythagoras proved that you can get the square of the hypotenuse by adding the squares 
                                of the other two sides. In your game, you're going to use the horizontal and vertical
                                distance between two characters as the two sides of your triangle, and use the 
                                Pythagorean theorem to find the length of that third side.}
                       @teacher{Remind students that A and B are the horizontal and vertical lengths, which are
                                calculated by @code{line-length}.}
                       }
                @point{@student{@activity{@itemlist[@item{Turn to @worksheet-link[#:page 37 #:name "Distance-Formula-With-Numbers"] 
                                                          of your workbook - you'll see the formula written out.} 
                                                     @item{Draw out the circle of evaluation, starting with the 
                                                           simplest expression you can see first.}
                                                     @item{Once you have the circle of evaluation, translate it 
                                                           into racket code at the bottom of the page, starting 
                                                           with @code{(EXAMPLE (distance 4 2 0 5) ...)}}]}
                                 Now you've got code that tells you the distance between the points (4, 2) and (0, 5).
                                 But we want to have it work for @italic{any} two points. It would be great if we had a 
                                 function that would just take the x's and y's as input, and do the math for us.}
                        @teacher{}}
                @point{@student{@activity{@itemlist[@item{Turn to @worksheet-link[#:page 38 #:name "Distance"], 
                                                           and read the problem statement and function header 
                                                           carefully.}
                                                      @item{Use the Design Recipe to write your distance function. 
                                                            Feel free to use the work from the previous page as your 
                                                            first example, and then come up with a new one of your own.}
                                                      @item{When finished, type your @code{line-length} and 
                                                            @code{distance} functions into your game, and see what happens.}
                                                      @item{Does anything happen when things run into each other?}]}
                                 You still need a function to check whether or not two things are colliding.}
                        @teacher{Pay careful attention to the order in which the coordinates are given to the 
                                 @code{distance} function. The player's x-coordinate (@code{px}) must be given first,
                                 followed by the player's y (@code{py}), character's x (@code{cx}), and character's y 
                                 (@code{cy}). Inside the body of the function, @code{line-length} can only calculate 
                                 lengths on the same axis (@code{(line-length px cx)} and @code{(line-length cx cy)}).
                                 Just like with making data structures, order matters, and the distance function will 
                                 not work otherwise. Also be sure to check that students are using @code{sq} and 
                                 @code{sqrt} in the correct places. }
                        }
                ]
         }
       
@lesson/studteach[#:title "Collide?"
        #:duration "10 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students will write the collide? function}]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{So what do we want to do with this distance? 
                                @activity{How close should your danger and your player be, before they hit 
                                          each other?}
                                At the top of @worksheet-link[#:page 39 #:name "collide"] you'll find the 
                                Word Problem for @code{collide?}. 
                                @activity{@itemlist[@item{Fill in the Contract, two EXAMPLES, and then write the
                                                          code. Remember: you WILL need to make use of the 
                                                          @code{distance} function you just wrote!}
                                                     @item{When you're done, type it into your game, under
                                                           @code{collide?}.}]}}
                        @teacher{Using visual examples, ask students to guess the distance between a danger
                                 and a player at different positions. How far apart do they need to be before
                                 one has hit the other? 
                                 @management{Make sure students understand what is going on by asking questions:
                                             If the collision distance is small, does that mean the game is hard 
                                             or easy? What would make it easier?}}
                        }
                 ]
         }
            
@lesson/studteach[#:title "update-world"
        #:duration "40 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Identify collision as yet another sub-domain which requires different behavior of the update-world function}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students will use different Cond branches to identify collisions in their games}]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Now that you have a function which will check whether something is colliding, 
                                you can go back to modifying Ninja World.
                                @activity{Out of the four major functions in the game (@code{update-world}, 
                                          @code{draw-world}, @code{keypress}, and @code{big-bang}), which 
                                          do you think you'll need to edit to handle collisions?}
                                We'll need to make some more branches for @code{cond} in @code{update-world}. 
                                What should happen when the cat collides with the dog? We want to put the dog 
                                offscreen, so that he can come back to attack again.}
                        @teacher{}}
                 @point{@student{@activity{@itemlist[@item{Start with the test: how could you check whether the
                                                          cat and dog are colliding? Have you written a function 
                                                          to check that?}
                                                     @item{What do the inputs need to be?}
                                                     @item{How do you get the @code{catY} out of the world?}
                                                     @item{What about the Cat's x-coordinate? She's always in the
                                                           center of the screen, so what will her x-coordinate 
                                                           always be?}
                                                     @item{How do you get the @code{dogX} out of the world?} 
                                                     @item{Is there a @code{dogY} in the world? Where in the 
                                                           game can you look to get that number? (Hint: in which
                                                           function do you @italic{draw} the images on the game 
                                                           screen?)}]}
@code[#:multi-line #t]{[(collide? 360 (world-catY w) (world-dogX w) 400) ...result...]}
Remember that @code{update-world} gives back a world, so what function should come first in our result?
@code[#:multi-line #t]{[(collide? 360 (world-catY w) (world-dogX w) 400) (make-world ...dogX...
                                                                                     ...rubyX...
			                                                             ...catY...)]}
                                @activity{And what should happen when the cat and dog collide? Can you think of a 
                                          number that puts the dog off the screen on the left side?}
             @code[#:multi-line #t]{[(collide? 360 (world-catY w) (world-dogX w) 400) (make-world -100
					                                                          ...rubyX...
					                                                          ...catY...)]}
                                @activity{Does the @code{rubyX} change when the dog and cat collide? How about 
                                          @code{catY}? How do you get each of those things out of the world?}
             @code[#:multi-line #t]{[(collide? 360 (world-catY w) (world-dogX w) 400) (make-world -100
					                                                          (world-rubyX w)
					                                                          (world-catY w))]}}
                        @teacher{Collision detection must be part of the @code{update-world} function because the
                                 game should be checking for a collision @italic{every time} the world is updated. Students may
                                 assume that @code{draw-world} should handle collision detection, but point out that the
                                 Range of @code{draw-world} is an Image, and their function must return a new world in order to
                                 set the locations of the characters after a collision.}}
                 
                 @point{@student{Now it's time to handle collisions in your game...
                                 @activity{Turn to @worksheet-link[#:page 40 #:name "Collide-Examples"] and write 
                                           some more tests and results. What characters in your game could collide 
                                           with each other? What should happen as a result? When you have written 
                                           each test and result down, type it into your game.}}
                         @teacher{Work in small groups to complete collision branches.}}
                ]
         }

@lesson/studteach[#:title "Closing"
        #:duration "5 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Congratulations! You've finished every lesson, and now it's up to you to make your 
                                game even better. Take some time to brainstorm...what else do you want your game to 
                                do? Next unit you can add even more things, so that your games are even cooler.}
                        @teacher{@management{Have students show each other their finished games, and start thinking about what 
                                 features they want to add next!}}}
                 ]
         }
       }

       
   