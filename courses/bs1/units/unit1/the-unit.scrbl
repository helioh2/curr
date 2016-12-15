#lang curr/lib

@title{Unidade 1: Games e Coordenadas}

@declare-tags[management]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
  @unit-descr{Os alunos discutem os componentes de seus jogos favoritos, e descobrem que eles podem ser reduzidos a uma série de coordenadas. Eles, então, exploram as coordenadas no plano cartesiano, e identificam as coordenadas para os personagens em um jogo em vários pontos no tempo. Uma vez que eles estiverem confortáveis com coordenadas, eles poderão ter idéias para seus próprios jogos e criar lista de amostras de coordenadas para diferentes pontos no tempo.}
}
@unit-lessons{
@lesson/studteach[
     #:title "Introdução"
     #:duration "5 minutos"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[@item{OPTIONAL: Hand out @(hyperlink "https://docs.google.com/document/d/1USFPXkeO5AbGOzm_U0tMv4NV3RrxTMTyg-bqIKUf4q4/edit?usp=sharing" "Warmup activity sheet").}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
             @point{@student{Bem vindo ao Bootstrap! Neste curso, você vai aprender uma nova linguagem de programação – uma maneira simples de dizer ao computador exatamente o que você quer que ele faça. Assim como inglês, espanhol ou francês, uma linguagem de programação tem seu próprio vocabulário e gramática que você terá que aprender. Felizmente, a linguagem que você vai usar aqui tem muito em comum com a matemática simples que você já sabe!}
                     @teacher{@management{Crie expectativas e regras para a aula.}
                              Faça uma conexão entre o material de estudo com as coisas que os alunos já sabem:
                              @itemlist[@item{What makes a language? Do some students already speak more than one language?}
                                         @item{Programming is very much a language, with its own syntax, semantics, etc}
                                         @item{Ask students about their favorite videogames. Be open about the scale of a modern game: they cost millions of dollars, are built by huge teams of programmers and artists, and are developed over years.}
                                         @item{Set expectations about what can be accomplished in a single, introductory programming class.}]}
                     }
              ]
         }

@lesson/studteach[
     #:title "Analisando uma Demonstração"
     #:duration "10 minutos"
     #:overview "Jogar um jogo simples, então deixe de lado por um tempo e tente descobrir o que está acontecendo no computador."
     #:learning-objectives @itemlist[@item{Model a simple videogame}]
     #:evidence-statements @itemlist[@item{Students will be able to identify the elements of a game and how each one changes during gameplay}]
     #:product-outcomes @itemlist[@item{Nas apostilas, os alunos criam um modelo de dados que descreve um videogame simples.}]
     #:standards (list "BS-M")
     #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket}
                             @item{If using DrRacket, make sure the Ninja.rkt file is loaded}
                             @item{"NinjaCat" [NinjaCat.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=LyMwExWayT" "WeScheme")] preloaded on students' machines}
                             @item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbook"] folders with names on covers, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
          @point{@student{Vamos começar a explorar um jogo simples, e, em seguida, descobrir como ele funciona. Abra  @run-link[#:public-id "LyMwExWayT" "este link"] para jogar o jogo, e passe um ou dois minutos explorando-o.  @italic{Você pode usar as teclas de setas para mover o gato para a esquerda, direita e saltar – tentar pegar o rubi e evitar o cão!.}}
                 @teacher{[@(hyperlink "https://www.youtube.com/watch?v=KSt_3ovWfjk" "Video")] Mostrar o Gato Ninja para as crianças, either letting them play or by demoing it in front of the class. You can move the cat up, down, left and right by using the arrow keys. 
                          Play until the students see all the characters (the clouds, the ruby, the dog and the cat), and be 
                          sure to point out the title and score as well.}
                 }
          
          @point{@student{Este jogo é composto por personagens, cada qual com seu próprio comportamento. O rubi se move da direita para a esquerda, como faz o cão. O Gato Ninja só se move quando você usar as teclas de setas para ele se movimentar. Descobriremos como funciona o jogo após entendermos como funciona cada personagem.}
                 @teacher{}
                 }
          
          @point{@student{@activity[#:forevidence (list "BS-M&1&1")]{@bitmap{images/game-table1.png} Vá para a página @worksheet-link[#:name "NinjaCat-Dissection"] de sua apostila. Aqui temos uma tabela, que usaremos para fazer uma engenharia-reversa do NinjaCat e ver como ele funciona. Preencha e primeira coluna com uma lista completa de todas as coisas no jogo.}
                           }
                 @teacher{Essa pode ser uma atividade em equipe. Peça aos alunos alguns exemplos, para ter certeza de que entenderam o que é pra ser listado: substantivos(nomes) como "o gato", não pode ser verbos como "pulando". @management{Durante esta atividade, caminhe e veja como os grupos ou duplas estão fazendo. Este é um bom momento para encorajar valores de trabaho conjunto e respeito - Diga "bom trabalho" quando ver algum! Quando o tempo acabar, dê uma contagem regressiva: "30...10... 5... 4... 3... 2... 1... LÁPIS ABAIXADOS, OLHOS AQUI!" Espere por silêncio completo e atenção total.}}
                 }
          
          @point{@student{Você listou todos os quatro personagens que se movem? O que mais temos no jogo? O plano de fundo faz parte do jogo? E a Pontuação (score)?}
                 @teacher{@management{Peça a algum aluno a vir ao quadro, e preencher na tabela o que encontraram pra primeira coluna. Se o tempo estiver curto, peça que eles digam de onde estão sentados o que escreveram.}}
                 }
          
          @point{@student{@activity{@bitmap{images/game-table2.png} Precisamos pensar também sobre o que está @italic{mudando} quando estamos jogando. O que acontece com o Rubi? Ele fica maior? Sua cor muda? Ele gira? A única coisa que muda no Rubi é sua @italic{posição}! Todo o restante sobre ele continua o mesmo. E sobre o cão? o Gato? Preencha o restante na segunda coluna, colocando tudo o que muda sobre cada personagem.}}
                 @teacher{}
                 }
                            
          @point{@student{Você percebeu que o Cão, o Rubi, a Nuvem e o Gato mudam apenas sua posição e nada mais? E sobre o Plano de Fundo - ele não muda em nada, então podemos @italic{deixá-lo de fora desta coluna!} Você percebeu que a Pontuação(Score) muda de valor? Você vai querer ter isso adicionado a sua lista também!}
                 @teacher{@management{Rapidamente preencha a segunda coluna no quadro.}}
                 }
          ]}

@lesson/studteach[
     #:title "Plano de Coordenadas"
     #:duration "15 minutos"
     #:overview "Students must use the Cartesian plane to describe the location of characters in a picture."
     #:learning-objectives @itemlist[@item{Understand the use of number lines in defining locations via coordinates}]
     #:evidence-statements @itemlist[@item{Students apply the number line as a tool for objectively defining location, first identifying how to apply it to 
                                           describe the position of a character onscreen in one dimension. This understanding is extended to two dimensions, 
                                           ultimately motivating the use of a coordinate grid.}]
     #:product-outcomes @itemlist[@item{Os alunos identificam as coordenadas dos personagens na imagem}]
     #:standards (list "6.NS.5-8" "N-Q" "5.G.1-2")
     #:materials @itemlist[@item{Cutouts of  @resource-link[#:path "images/ninjacat.png" #:label "NinjaCat"],  @resource-link[#:path "images/dog.png" #:label "Dog"]
                                 and the  @resource-link[#:path "images/ruby.png" #:label "Ruby"]}
                            @item{Student Workbooks, and something to write with}]
     #:preparation @itemlist[@item{Student Workbooks, and something to write with}]
     #:prerequisites (list "Dissecting a Demo")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{Are there locations that can be described using one coordinate system, that cannot be described 
                                                            using another? Can any valid coordinate system can be perfectly mapped to any other valid 
                                                            coordinate system?}]}
                )
        ]{
  @points[
      @point{@student{@bitmap{images/number-line.png}Computadores usam numeros para representar a posição do personagem na tela, usando uma règua para medir 
                       a distância, colocando o zero no canto esquerdo inferior da tela. Para nosso jogo, temos uma "régua imaginária" da tela que vai do 0 
                       (na esquerda) até 640 (na direita). Podemos pegar a imagem do Cão, e por em qualquer lugar dessa linha, e medir a distância até a 
                       margem do lado esquerdo. Qualquer outra pessoa que sabe sobre nossa linha será capaz de duplicar a posição exata do Cão, sabendo apenas 
                       o número. Qual seria a coordenada do Cão para ele estar do lado direito da tela? E no Centro? Qual coordenada iria colocar o Cão para frente 
                       da margem esquerda da tela?}
              @teacher{Os pontos-chave para os alunos são @italic{precisão} e @italic{objetividade}. Exeistem muitas possíveis respostas corretas, mas eles 
                       devem entender porque uma solução deve ser precisa e clara. Isso exige deles, propor soluções que compartilham um "zero" comum 
                       (o ponto de partida de sua linha numérica) e a direção (literalmente, a direção em que a posição do personagem é medida, neste caso na horizontal).
                       @management{Deixe os alunos conversarem sobre isso. Se o tempo permitir, peça para um alunos deixar a sala e deixe os outros escreverem 
                                   onde o Caõ está no quadro. Então remova o Cão, e chame o aluno que saiu para voltar, e deixe a turma direcionar ele usando 
                                   apenas o que eles anotaram anteriormente. Tente posicionar os personagem em diferentes lugares da linha, os alunos lhe dizem quais 
                                   são as coordenadas. Experimente dar descrições verbais (Ex. "No centro da tela", "Além do lado direito da 
                                   tela", etc.) e peça a ele traduzir isso em coordenadas.}}
              }

      @point{@student{@bitmap{images/cat-coordinates.png}By adding a second number line, we can locate a character anywhere on the screen in either 
                       dimension. The first line is called the x-axis, which runs from left to right. The second line, which runs up and down, is 
                       called the y-axis. A 2-dimensional @italic{coordinate} consists of both the x- and y-locations on the axes. Suppose we wanted
                       to locate NinjaCat's position on the screen. We can find the x-coordinate by dropping a line down from NinjaCat and read 
                       the position on the number line. The y-coordinate is found by running a line to the y-axis.}
              @teacher{A coordinate represents a single point, and an image is (by definition) many points. Some students will ask whether a
                       character's coordinate refers to the center of the image, or one of the corners. In this particular program, the center 
                       serves as the coordinate - but other programs may use another location. The important point in discussion with students
                       is that there is flexibility here, @italic{as long as the convention is used consistently}. @management{If time allows, 
                       invite volunteers up to the board to try placing NinjaCat and the Ruby at different locations. Have students identify the
                       coordinates at the corners of the screen. For additional practice, have students bisect each side of the screen and label
                       the midpoints.}}
              }
      @point{@student{When we write down these coordinates, we always put the x before the y (just like in the alphabet!). Most of the time, 
                      you'll see coordinates written like this: (200, 50) meaning that the x-coordinate is 200 and the y-coordinate is 50.}
              @teacher{}
              }

      @point{@student{Depending on how a character moves, their position might change only along the x-axis, only along the y-axis, or both. Look
                      back to the table you wrote in the workbook (@worksheet-link[#:name "NinjaCat-Dissection"]).
                      Can NinjaCat move up and down in the game? Can she move left and right? So what's changing: her x-coordinate, her y-coordinate, 
                      or both? What about the clouds? Do they move up and down? Left and right? Both?}
              @teacher{}
              }
      
      @point{@student{@activity[#:forevidence (list "N-Q&1&4" "5.G.1-2&1&1" "5.G.1-2&1&2")]{
                          @bitmap{images/game-table3.png}Fill in the rest of the table, identifying what is changing for each of your characters.}
                       }
              @teacher{}
              }
      
      @point{@student{@activity[#:forevidence (list "6.NS.5-8&1&2")]{Turn to @worksheet-link[#:name "NinjaCat-Coordinates"] in your game-planning workbook, and look at the
                                        project sheet that has a picture of the NinjaCat game. What are the coordinates at the bottom-left corner 
                                        of the screen? Top-right? Center? For practice, label the coordinates at the midpoint of @italic{each side}
                                        of the screen, then label the coordinates of each of the characters.}}
              @teacher{}
              }]
   }

@lesson/studteach[
     #:title "Brainstorming"
     #:duration "15 minutes"
     #:overview "Students select the theme and characters for their videogame"
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Os alunos completam a planilha de design do videogame, para projetar seu próprio jogo}]
     #:standards (list)
     #:materials @itemlist[@item{}]
     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket}
                             @item{If using DrRacket, make sure the Ninja.rkt file is loaded}
                             @item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        
        
@points[
        @point{@student{On @worksheet-link[#:name "Game-Design"], you'll find a planning template for you to make your own game. 
                           Just like we made a list of everything in the NinjaCat game, we're going to start with a list of everything in your game.}
                @teacher{@management{Put your names at the top of this page.}}
                }
         
        @point{@student{To start, your game will have with four things in it: 
                        @itemlist[
                                  @item{A Background, such as a forest, a city, space, etc.}
                                   @item{A Player, who can move when the user hits a key.}
                                   @item{A Target, which flies from the right to the left, and gives the player points for hitting it.}
                                   @item{A Danger, which flies from the right to the left, which the player must avoid.}]}
                @teacher{Have students walk through some sample themes, to make sure they understand the format of the game. For example: A football 
                         game might have a quarterback for the player, a rival player for the danger, and a football as the target. A jungle game
                         might have a monkey as the player, a snake as the danger, and bananas as the target.}
                }
        
        @point{@student{@activity{Now it's time to get creative! Fill out @worksheet-link[#:name "Game-Design"] in your 
                                  workbook for @italic{your} game, using your own player, target and danger.}}
                @teacher{@management{Be sure to consult with every team. A lot of students will have trouble fitting their ideas into this 
                                     format, or they'll struggle with coordinates. Be clear about what can and cannot be done! (e.g. - no 
                                     3d games, joysticks, multiplayer games, etc. Hint: students who have a well-worded description of their
                                     images will be happier with any images you could find them. Try searching for "Person" versus "Jogger",
                                     for example.}}
                }
        ]}

@lesson/studteach[
     #:title "Order of Operations"
     #:duration "20 minutes"
     #:overview "Students identify the order of operations for complicated arithmetic expressions through diagramming (circles) and 
                 evaluating (the numerical answer). This lesson introduces students to the Circle of Evaluation, which is a sentence 
                 diagramming tool for arithmetic expressions. This is a powerful way to understand Order of Operations, as it forces
                 students to focus on the structure of expressions over their computed result."
     #:learning-objectives @itemlist[@item{Understand the structure of arithmetic expressions}
	                             @item{Understand order of operations in an expression}
                                     @item{Write expressions as Circles of Evaluation}
                                     @item{Translate between Circle of Evaluation and arithmetic expressions}
]
     #:evidence-statements @itemlist[@item{Students will be able to explain why arithemetic expressions require structure}
                                     @item{Students will be able to identify the order of operations in an expression that includes 
                                           adding, subtracting, multiplying and dividing}                                     
                                     @item{Given a Circle of Evaluation, students will be able translate the expression into the 
                                           arithmetic expression it represents}
                                     @item{Given an arithmetic expression, students will be able to complete a partially-finished Circle
                                           of Evaluation for the same expression}
                                     @item{Given a bank of Circles of Evaluation and arithmetic expressions, students will be able to match them}
                                     @item{Students will be able to translate the structure of an arithmetic expression into a Circle of 
                                           Evaluation}
]
     #:product-outcomes @itemlist[@item{Os alunos convertem várias expressões aritméticas entre várias representações.}]
     #:standards (list "A-SSE.1-2" "BS-CE" "5.OA.1-2")
     #:exercises (list (make-exercise-locator "Order-of-Operations" "complete-coe-from-arith")
                       (make-exercise-locator "Order-of-Operations" "arith-to-coe1")
                       (make-exercise-locator "Order-of-Operations" "coe-to-arith1")
                       (make-exercise-locator "Order-of-Operations" "match-arith-coe1"))
     #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket}
                             @item{If using DrRacket, make sure the Ninja.rkt file is loaded}
                             @item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{Have students practice translating very simple (one-operation) expressions into 
                                                              simple (one-circle) Circles of Evaluation. By choosing the numbers in these 
                                                              examples carefully, you can gradually introduce nesting by replacing a number 
                                                              in one expression with the Circle of Evaluation for another expression that 
                                                              evaluates to the same number. @italic{Replace the 7 in @code{7+5} with the 
                                                                                                                     Circle for @code{10-3}.}}]}
                @pacing[#:type "misconception"]{@itemlist[@item{This is the first opportunity to expose students to core vocabulary words, 
                                                                so be sure to use words like @bold{function}, @bold{value} and @bold{expression} 
                                                                carefully and consistently. Ask students to identify the parts of a Circle of 
                                                                Evaluation, and push them to use the vocabulary as well.}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{@student{Math is a language, just like English, Spanish, or any other language. We use nouns, like "bread", "tomato", 
                                "mustard" and "cheese" to describe physical objects. Math has @vocab{values}, like the numbers @math{1}, 
                                @math{2} or @math{3}, to describe quantities. Humans also use verbs like "toast", "slice", "spread" and "melt" 
                                to describe operations on these nouns. Mathematics has @vocab{functions} like addition and subtraction, which
                                are operations performed on numbers. Just as you can "slice piece of bread", a person can also "add four and five".}

                        @teacher{Students should begin to look at math as a @italic{language}.  To help them with this, you can discuss syntax 
                                 and grammar of math, and its potential for ambiguity in the absence of a fixed order of operations.  Help 
                                 students see that math is a way to communicate calculations among people.}
                        }
                 @point{@student{A @vocab{mathematical expression} is like a sentence: it's an instruction for doing something.  The 
                                 expression @math{4+5} tells us to add 4 and 5.  To @vocab{evaluate} an expression, we follow the instructions 
                                 in the expression.  The expression @math{4+5} @vocab{evaluates to} @math{9}.                         
                        @activity{What does @math{8*4} evaluate to?  What does @math{20-16} evaluate to?  What does @math{16-20} evaluate to?}}
                       @teacher{}}
                 @point{@student{Sometimes, we need multiple expressions to accomplish a task.  If you were to write instructions for making 
                                 a sandwich, it would matter very much which came first: melting the cheese, slicing the bread, spreading the 
                                 mustard, etc. The order of functions matters in mathematics, too. If someone says "four plus two minus one", 
                                 they could mean several things:
                                @itemlist[@item{Add four and two, then subtract one: @math{(4+2) - 1}}
                                          @item{Add four to the result of subtracting one from two: @math{4 + (2-1)}}]
                        @activity{Write an expression of your own that can mean several things.}}
                        @teacher{}
                        }
                 
                 @point{@student{Depending on which way you read the expression, you might have very different results!  This is a problem, 
                                 because we often use math to share calculations between people.  For example, you and your cell phone company 
                                 should agree upfront on how much you will pay for sending text messages and making calls.  Different results
                                 might mean that your bill looks wrong.  We avoid problems by agreeing on the order in which to use the 
                                 different operations in an expression.  There are two ways to do this:
                               @itemlist[#:style 'ordered
                                         @item{We can all agree on an order to use}
                                         @item{We can add detail to expressions that indicate the order}]
                          @activity{Write down one reason why it is important to have rules about the order of operations.}}
                         @teacher{}}
                  @point{@student{@bitmap{images/PEMDASTriangle.png} Mathematicians didn't always agree on the order of operations, but now
                                   we have a common set of rules for how to evaluate expressions.  The pyramid on the right summarizes the 
                                   order.  When evaluating an expression, we begin by applying the operations written at the top of the 
                                   pyramid (multiplication and division). Only after we have completed all of those operations can we 
                                   move down to the lower level. If both operations are present (as in @math{4+2-1}), we read the expression
                                   from left to right, @vocab{apply}ing the operations in the order in which they appear.
                          @activity[#:forevidence (list "A-SSE.1-2&1&3" "5.OA.1-2&1&2")]{In what order should we apply the functions in the following example? 
                                    @math{19 \div 2 * 11 - 7 + 8}
                                    @itemlist[#:style 'ordered
                                              @item{@math{+ \div * - }}
                                              @item{@math{\div * - +}}
                                              @item{@math{\div * + -}}
                                              @item{@math{* \div + -}}]
}}
                         @teacher{This item covers PEMDAS (order of operations in ambiguous expressions).  You can skip this item if you
                                  do not need to cover PEMDAS.}
                         }

                @point{@student{@bitmap{images/FixedCircle.png} One way to indicate the order of operations in an expression is to first 
                                 draw the expression as a diagram.  This diagram is called a @vocab{Circle of Evaluation}.  Here you can
                                 see an example of a Circle of Evaluation, for the math expression @math{4-5}. Circles of Evaluation 
                                 show the structure that's going on inside an expression.  All Circles of Evaluation have two rules:
                       @bannerline{Circle Rule 1: Each circle must have one function, which goes at the top of the circle.}
                       @bannerline{Circle Rule 2: The numbers are written below, in order from left to right.}
                       @activity[#:forevidence "BS-CE&1&1"]{@bitmap{images/CircleBug.png}Which rule does this Circle of Evaluation break?}
                       }
                @teacher{[@(hyperlink "https://www.youtube.com/watch?v=AMFaPKHp3Mg" "Video")] This section benefits enormously from visual aids, diagrams, etc. Make sure you have plenty of board space to 
                         draw examples!}
                }
                @point{@student{@activity[#:forevidence (list "BS-CE&1&1" "5.OA.1-2&1&1")]{Try drawing the Circle of Evaluation for each of the following 
                                                                     expressions:
                                          @itemlist[#:style 'ordered
                                                    @item{@math{6*4}}
                                                    @item{@math{7-10}}
                                                    @item{@math{5 + 8}}
                                                    @item{@math{\frac{351}{-1} }}]
                                          }
                                 @bitmap{images/FixedCircle.png} Every Circle of Evaluation @vocab{evaluates to} the result of its 
                                 corresponding expression.  For example, the circle on the right evaluates to @math{-1}, because 
                                 the circle says to use subtraction (the function at the top) on the numbers in order (@math{4-5}).}
                        @teacher{It's important for students to view the Circles of Evaluation as "just another way of writing arithemetic". 
                                 Have students discuss whether associativity and commutativity still matter here (they do).}
                        }
                @point{@student{@bitmap{images/Nesting.png}To use multiple functions in the same expression, we can combine Circles
                                 of Evaluation.  Look at the Circle of Evaluation you've written for @math{351 / -1}. We already 
                                 know that the Circle for @math{4 - 5} will evaluate to @math{-1}, so we can @italic{replace the 
                                 number with the expression.} Does this change what the expression evaluates to?
                                @activity[#:forevidence (list "BS-CE&1&2" "5.OA.1-2&1&1")]{
                                      @bitmap{images/fill-in-circle.png}Finish writing the Circle of 
                                       Evaluation shown here, so that it represents @math{(23 + 7) * (13 - 5)}}
                      }
                        @teacher{From this point forward, the Circles of Evaluation are your assessment tool for Order of Operations. 
                                 Quizzing students by asking them to correctly evaluate an expression is fraught with false negatives,
                                 as many student might get the order right but may still have problems with basic calculations. This 
                                 method is also vulnerable to Commutativity, since a student will correctly evaluate @math{1*2+2} 
                                 even if they get the order of operations wrong! Circles of Evaluation have neither of these flaws,
                                 as they put the emphasis where it should be: exercising a student's ability to see the structure 
                                 inside the arithemetic.}
                        }
                @point{@student{@bitmap{images/NestedCircle.png}What does this Circle of Evaluation evaluate to?  Let's review how
                                 we evaluate a Circle:
                                 @itemlist[@item{We know we are multiplying because that's the function at the top of the Circle.} 
                                           @item{The Number @math{6} is the first number in the multiplication, because it's on 
                                                            the left-hand side.}
                                           @item{The second number in the multiplication is on the right-hand side.  The right-hand
                                                 side has a separate circle, so we need to @vocab{evaluate} the number for that 
                                                 circle.  The second number is therefore @italic{the result of adding 4 and 5}.}
                                           @item{@math{4 + 5} (the inner circle) evaluates to @math{9}, and @math{6 * 9} (the outer 
                                                  circle) evaluates to @math{54}.  This circle evaluates to @math{54}.}]
                        @activity[#:forevidence (list "BS-CE&1&3" "A-SSE.1-2&1&3" "5.OA.1-2&1&1")]{
                               @bitmap{images/NestedCircle2.png}Convert this Circle of Evaluation into an arithmetic expression.}
                        }
                        @teacher{Work through several of these examples with students, asking them to come up with arithmetic
                                 expressions and then convert them into Circles, or giving them Circles and having them 
                                 translate them back into arithmetic.  When you talk about Circles, be sure to consistently use
                                 the term @italic{function} for what's on top, rather than similar terms like "operation", "symbol",
                                 "procedure", "name", etc.  The Circles of Evaluation will help students see the similarity between
                                 arithmetic functions (like @math{+}) and algebraic functions (like @math{f}) if you use 
                                 terminology carefully.}
                        }
                @point{@student{@activity[#:forevidence (list "BS-CE&1&3" "A-SSE.1-2&1&3" "5.OA.1-2&1&1")]{
                              Match the following Circles of Evaluation with the corresponding arithmetic expressions:
                                  @(circeval-matching-exercise/math 
				    (list (math "9 * (4 - 3)")
					  (math "(9 * 4) - 3")
					  (math "(9 - 3) * 4")
					  (math "(2 + 4) / (6 - 3)")
					  (math "-5 * 2"))
				    (list "(/ (+ 2 4) (- 6 3))"
					  "(- (* 9 4) 3)"
					  "(* -5 2)"
					  "(* 9 (- 4 3))"
					  "(* (- 9 3) 4)"))}
                        }
                        @teacher{}
                        }
             ]
         }

@lesson/studteach[
     #:title "Intro to Programming"
     #:duration "15 minutes"
     #:overview "Students are introduced to the programming environment"
     #:learning-objectives @itemlist[@item{Convert Circles of Evaluation into code}
                                     @item{Enter and evaluate code expressions for arithmetic on the computer}
                                     @item{Understand the goal of error messages from the computer}]
     #:evidence-statements @itemlist[@item{Students will be able to identify the Interactions and Definitions windows}
                                     @item{Students will be able to enter and evaluate simple arithmetic expressions in the Interactions window}
                                     @item{Students will be able to convert Circles of Evaluation into correctly-formed programs}
                                     @item{Students will be able to explain an 'unbounded identifier' error message}
                                     @item{Students will be able to explain the purpose of error messages}
                                     @item{Given a Circle of Evaluation, students will be able to complete a partially-written program}
                                     @item{Given a bank of Circles of Evaluation and programs, students will be able to match them}]
     #:product-outcomes @itemlist[]
     #:standards (list "A-SSE.1-2" "N-Q" "BS-CE" "BS-PL.1" "BS-IDE")
     #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket}
                              @item{Student Workbooks, and something to write with}
                              @item{Overhead projector}]
     #:prerequisites (list "Order of Operations")
     #:exercises (list (make-exercise-locator "Intro-to-Programming" "complete-code-from-coe1")
                       (make-exercise-locator "Intro-to-Programming" "coe-to-code1")
                       (make-exercise-locator "Intro-to-Programming" "coe-code-matching1")
                       )
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{@student{Open the programming tool of your choice: If you've installed, DrRacket, double-click the 
                                application to launch it. If you are using the online-tool, @login-link["click here to log in"]
                                enter your username and password to log in, then click "Start a New Program".}
                        @teacher{@management{Have the students look at the editor on their computers. Refer to overhead 
                                             projector as necessary.}}
                        }
                 
                @point{@student{@bitmap{images/wireframeIDE.png}This screen is called the @vocab{editor}, and it looks something
                                 like the diagram you see here. There are a few buttons at the top, but most of the screen is 
                                 taken up by two large boxes: the @vocab{Definitions window} at the top and the 
                                 @vocab{Interactions window} at the bottom.}
                        @teacher{The Definitions window is where programmers define values and functions in their program, 
                                 while the Interactions window allows them to experiment with those values and functions. 
                                 This is analogous to writing a series of function definitions on a blackboard, and having 
                                 student evaluate expressions using those function on scrap paper. As students are not yet 
                                 defining values of their own, it is not important that students understand this distinction 
                                 right now.  For now, we will work only with the Interactions window.}
                        }
                
                @point{@student{A program is a @vocab{legal expression} that, when evaluated, produces a value. You've been
                                               writing programs using mathematical expressions since you first learned how 
                                               to add! Just as in English, there are rules that determine whether a sentence
                                               makes sense. Programs have rules too!  A program can be very complicated, but
                                               it doesn't have to be: the simplest programs of all are just Numbers.}
                        @teacher{@management{Draw students' attention to the Language Table (see Lesson Overview for Unit 1),
                                             which currently sits empty. Add "Numbers" to the Types section of the language 
                                             table.}}
                        }
                @point{@student{@bannerline{Code Rule 1: All values are legal expressions.}
                                 @activity[#:forevidence "BS-IDE&1&1"]{What do you think @code{4} will evaluate to? 
                                                                       @editor-link[#:interactions-text "4"
                                                                                    "Click here to test it out."]}
                                              @itemlist[@item{Enter 4 in the Interactions window and hit "Return". You
                                                              will see the value @code{4} appear on the next line in 
                                                              the Interactions window.}
                                                        @item{Type 10 in the Interactions window and hit "Return".  Now the 
                                                              value @code{10} appears in the Interactions window.}
                                                         @item{Try evaluating numbers, like @code{10345017}, or negative 
                                                               numbers, like @code{-2}. Is there a limit to how big a number can be?
                                                               What happens if you write a decimal? What happens when you click on
                                                               a decimal, like @code{1.5}? You get a new type of number, a 
                                                               fraction, like @code{3/2}.}]
                                }
                        @teacher{The editing environment evaluates all fractions and returns them as decimals by default. This can be
                                 surprising to students at first, so you may want to take a moment to explain what's going on, and 
                                 show them that these decimals can be converted back to fractions just by clicking on them.  The 
                                 environment uses standard annotations for repeating, non-terminating decimal expressions and 
                                 properly handles expressions like @math{(\sqrt -1)}.  If you want to work with those kinds of 
                                 numbers in your class, enter them to get familiar with how they appear in the Interactions window.}
                        }
           
                
                @point{@student{@activity[#:forevidence "BS-IDE&1&2"]{The computer obviously knows about Numbers, but what happens
                                                                      if you type in something that it @italic{doesn't} know about?
                                                                      Will it complain? Crash? Guess?
                                                                      @editor-link[#:interactions-text "dog" "Try asking the computer"] 
                                                                      to evaluate @code{dog} in the Interactions window.}
                                 These error messages are really useful for programmers. Rather than saying "this program doesn't 
                                work", the computer does the best it can to tell you what went wrong, and to give you as much 
                                information as possible to help you fix the problem. Make sure you always read these messages carefully!
                                 }
                        @teacher{The error message uses the term "variable".  Don't worry if your students don't already know this 
                                 term; we will teach it to them shortly.  For now, students just need to get used to error messages 
                                 and the kinds of problems that they catch in programs.}
                        }
                
                @point{@student{The Circles of Evaluation are also easy to convert into computer programs. To translate a Circle of
                                Evaluation into a program, begin with an open parenthesis @code{(}, and then the function written at
                                the top of the circle. Then translate the inputs from left to right in the same way, adding a closing
                                parenthesis @code{)} when you're done. This process gives us the second rule for @vocab{expressions}:  
                                @bannerline{Code Rule 2: Each open parenthesis is followed by one function, then by one or more legal
                                            expressions, and finally by a closing parenthesis.}
                                 @bitmap{images/FixedCircle.png}Here is the code for this Circle of Evaluation: @code{(- 4 5)}
                                 @activity[#:forevidence "BS-PL.1&1&2"]{ @editor-link[#:interactions-text "(- 4 5)" "See what happens"]
                                                                         when this code is entered into the Interactions window.
                                                                         Press the Return key to evaluate the program. You should 
                                                                         see @math{-1} as an answer.
                                                                        }
                        }
                        
                        @teacher{Have students practice converting simple Circles of Evaluation into code.  If you want to help students 
                                 understand when to use the parentheses, here are two explanations that we find useful.  First, the
                                 parens look like the Circle, and the Circle encloses the function name and its inputs.  Second, we
                                 use a more visual description of an ant eating its way through the expression.  The ant eats into the 
                                 Circle (an open paren), then goes to the function at the top, then to the arguments from left to right,
                                 then finally out of the Circle (a close paren).  If the ant encounters another Circle while writing 
                                 down the arguments, it needs another open paren, etc.}
                        }   
                @point{@student{@bitmap{images/NestedCircle.png}When a Circle of Evaluation has other circles inside of it, the 
                                 translation still follows the same rules: each Circle requires a new set of parentheses:
                                 @code{(* 6 (+ 4 5))}
                                 @activity[#:forevidence "BS-PL.1&1&2"]{@itemlist[@item{Try entering this code into the Interactions 
                                                                                        window. What should the program evaluate to 
                                                                                        when you hit Return?}
                                                     @item{Practice converting other Circles of Evaluation you've drawn into code.}]}}
                        @teacher{@management{Scaffolding for Pair Programming: Talk to students about the roles of @italic{Driver} 
                                             and @italic{Navigator}. The Driver is the student with their hands on the keyboard - they're 
                                             in charge of typing, using the mouse, etc. The Navigator should be telling the Driver what to
                                             type, and pointing out mistakes or suggesting things. It's important to clarify what these 
                                             roles are (perhaps reinforcing them with a visual), to ensure that both partners are active 
                                             and talking to one another about the task at hand.}}
                        }
               
                @point{@student{@bannerline{All of the expressions that follow the function name are called @vocab{arguments} to the 
                                            function. The following diagram summarizes the shape of an expression that uses a function. 
                                            @bitmap{images/ExpressionDiagram.png}}
                                @activity[#:forevidence (list "BS-CE&1&2" "BS-CE&1&4")]{
                                        For practice, turn to @worksheet-link[#:name "Circle-of-Evaluation-Practice"]
                                        in your workbook. For each mathematical expression, draw the Circle of Evaluation, then convert
                                        that Circle into Racket code.}}
                        @teacher{}
                        }
                @point{@student{When expressions don't follow the code rules, the computer will tell you that it found a problem.  The
                                computer also gives you information to help you fix the problem. This information is called an 
                                @vocab{error message}. We'll talk more about error messages later.  For now, we just want you to see 
                                a couple of error messages so that you'll know what they are if you run into one while programming.
                       @activity[#:forevidence "BS-IDE&1&2"]{Enter each of the following illegal expressions in the Interactions Window 
                                                             and look at the error message or behavior that the computer gives you. 
                                 @itemlist[@item{@code{(5 * 6)} [puts the function in the middle, instead of at the front]}
                                           @item{@code{(*5 6)}  [missing a space after the function]}
                                           @item{@code{* 5 6)}  [forgets the open parenthesis]}
                                           @item{@code{(* 5 6}  [forgets the close parenthesis]}
                                          ]}}
                       @teacher{At this point, the goal is simply to have students @italic{see} error messages.  Students are not 
                                expected to be experts at reading error messages this early 
                                (you will drill this later).  NOTE: When a close parenthesis is missing, hitting return will do nothing, 
                                because the computer is waiting for the parenthesis.  When an open parenthesis is missing, WeScheme
                                does nothing and waits for the programmer 
                                to add the parens.  If students hit enter and "nothing happens", they should check their parentheses. 
                                Also note that if you do this sequence of exercises with @code{+} instead of @code{*}, the error 
                                appears differently, because @code{+5} is a perfectly valid number (just like @code{-5}).}
                      }
                ]}


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
        @points[@point{@student{You've done a lot in this first unit!  
                                @itemlist[@item{You took a game apart to see how the parts move}
					  @item{You designed your own game, that you'll make during this course}
                                          @item{You practiced using coordinates to put characters into a screen}
                                          @item{You learned about order of operations, Circles of Evaluation, how to turn Circles of
                                                Evaluation into programs, and how to run those programs to get answers.}]
                        In the next unit, we'll begin writing programs for more interesting things than just arithmetic.}
                        @teacher{@management{Make sure student names are on page 3. Take page 3 itself, or take photos of page 3, to prep game images for a later Unit. }}}
               ]
         }
}

