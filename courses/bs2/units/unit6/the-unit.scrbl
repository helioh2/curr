#lang curr/lib

@title{Unidade 6: Eventos de Tecla}
@declare-tags[management]

@unit-overview/auto[#:lang-table (list (list "Número" @code{+ - * / sq sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Figura"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]{
                                                                  @unit-descr{Students return to the subject of partial functions, this time defining a key-event handler that modifies their world when certain keys are pressed.}
}
@unit-lessons{
@lesson/studteach[#:title "Introdução"
        #:duration "15 minutos"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{Lápis/canetas aos alunos, e giz/marcadores de quadro branco aos professores}
                            @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                            @item{Ambiente de Edição (WeScheme ou DrRacket com o pacote bootstrap-teachpack instalado)}
                            @item{Apostila dos alunos}
                            @item{Tabela da Linguagem}
                            @item{Signs for kids, entitled "update-world", "draw-world" and "big-bang"}
                            @item{Recortes das figuras do cachorro e do rubi}]
     #:preparation @itemlist[@item{Arranjos de assento: preferencialmente aglomerando as mesas}
                             @item{O arquivo Ninja World 3 [NW3.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @editor-link[#:public-id "2iasby92mn" "WeScheme"] projetado sobre o quadro}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Até agora temos trabalhado com três principais funções para construir nosso jogo e animar nosso mundo: @code{atualiza-mundo}, 
                                @code{desenha-mundo}, e @code{big-bang}. Até o momento, seu jogo pode usar algumas funções a mais que estas, mas 
                                o Mundo Ninja ainda é básico da mesma maneira que você se lembra. 
                                @activity{@itemlist[@item{Abra o aquivo do @editor-link[#:public-id "2iasby92mn" "Ninja World 3"]
                                                         e clique em "Run", para ver o cachoro e o rubi voarem pela tela.}
                                                     @item{Qual é a assinatura para cada função neste jogo? O que elas fazem?}
                                                     @item{Cada vez que @code{atualiza-mundo} é chamada, o que muda no cachorro? Como isso acontece?
                                                                     E sobre o rubi?}
                                                     @item{Em qual lugar da tela a função @code{desenha-mundo} coloca a imagem do cachorro? E do rubi? E as nuvens?}
                                                     @item{Se você chamou @code{atualiza-mundo} no mundo @code{(make-mundo 0 640)}, o que você recebeu de volta? 
                                                                               Qual é o mundo que foi produzido? Onde o cachorro e o rubi estão depois que 
                                                                               o mundo foi atualizado?}]}
                                Nesta versão do Mundo Ninja, ambos o cachorro e o rubi estão se movendo como deveriam. Mas isso nós já sabemos: você já 
                                fez os personagens do seu jogo se moverem por conta própria. Vamos adicionar mais.}
                        
                        @teacher{Esta lição é outra oportunidade para que os alunos atuem como as três funções principais do Mundo Ninja. Desenhe uma caixa no 
                                 quadro com @code{(make-mundo 0 640)} nela, nomeie como "mundo". Solicite um voluntário, e dê a ele um crachá com o
                                 nome @code{atualiza-mundo} para usar. Pergunte pela Assinatura de Decla\ração de Propósito de @code{atualiza-mundo}. Passe por algumas iterações de ter 
                                 @code{atualiza-mundo} calculando o mundo no quadro, em cada vez atualizando ele 
                                 @management{Certifique-se de chamá-los pelo nome, i.e. "@code{(atualiza-mundo (make-mundo 0 640))}"} (No primeiro exemplo, 
                                 o aluno deve apagar o 0 e escrever 10, e apagar o 640 e escrever 635. Se eles ficarem presos, faça referência 
                                 código anterior.) Peça outro voluntário, e dê o crachá @code{big-bang}. Eles vão iniciar toda a 
                                 animação, e terão um contador de tempo. Instrua a classe para gritar "tick!" a cada cinco segundos, e quando eles gritarem, 
                                 o @code{big-bang} passará o mundo atual para @code{atualiza-mundo}, que vai atualizar e substituir ele com um novo 
                                 mundo. Deixem que façam algumas iterações, então o resto da turma pode ver a estrutura mundo sendo modificada enquanto 
                                 eles fazem a contagem. Finalmente, dê para outro voluntário o crachá de @code{desenha-mundo}, junto com os recortes 
                                 do cachorro e do rubi. Como antes, pergunte o nome, o domínio e a imagem da função. 
                                 Quando eles forem chamados, eles receberão uma estrutura @code{mundo} e substituirão a imagem do cachorro e do rubi nos 
                                 pontos apropriados no quadro. Mude o valor do mundo de volta para @code{(make-mundo 0 640)}. Chame @code{desenha-mundo}
                                 algumas vezes com diferentes mundos, então a turma poderá ver o cachorro e o rubi se movendo pela tela. Quando cada 
                                 voluntário tiver praticado, coloque todas as funções juntas: Em cada "tick" qua a turma fizer, o @code{big-bang} irá chamar 
                                 @code{atualiza-mundo} para atualizar o mundo atual, e então @code{desenha-mundo} desenhará o mundo atualizado. De novo, passe por 
                                 algumas iterações, então a turma poderá ver a estrutura mundo mudando e os personagens se movensp como resultado.}}
                 
                 @point{@student{A hora está próxima: precisamos colocar o gato ninja na tela para que o jogo fique interessante. Ela será capaz de se mover para cima e para baixo. 
                                 @activity{@itemlist[@item{Nós precisamos mudar alguma coisa no código para fazer isso funcionar?}
                                        @item{Qual parte do jogo será necessária para manter o controle se o Gato Ninja está se movendo para cima e para baixo? Qual seria um 
                                              bom nome de @vocab{variável} para isso?}]}
                                 Nós precisamos manter o controle da coordenada-y do gato, então vamos adicionar o campo @code{gatoY} no mundo.  
                                 @activity{@itemlist[@item{Onde a estrutura mundo está definida no código?}
                                                      @item{Se o gato estiver no meio da tela, qual deveria ser o valor de @code{gatoY}?}
                                                      @item{Adicione outro número na estrutura mundo, representando a coordenada-y do gato.}]}}
                         @teacher{}}
                 @point{@student{Até agora, mesmo que a coordenada-y do gato tenha sido adicionada na struct mundo, não temos nenhuma função que recebe as teclas pressionadas e
                                 faz o gato se mover. Isso é o que vamos escrever a seguir. Mas antes de descobrir como escrever a função que move o gato,
                                 precisamos realmente adicionar gatoY ao jogo. 
                                 @activity{Quais funções precisamos mudar, agora que a estrutura mundo está diferente?}
                                 Agora que o mundo contém três coisas, você precisará mudar cada @code{make-mundo} no código.
                                 @activity{@itemlist[@item{Começando pela primeira linha, percorra o código e procure por cada lugar onde aparece 
                                                           @code{make-mundo}, e mude-o para refletir a nova estrutura de mundo.}
                                                      @item{Como você acessa o campo @code{gatoY} de fora do mundo?}                                       
                                                      @item{Dissemos que estaremos escrevendo outra função para receber as teclas pressionadas e mover o gato, então é so 
                                                            adicionar @code{gatoY} em @code{atualiza-mundo}. Não se preocupe em mudar valor.}
                                            @item{Dentro do @code{desenha-mundo}, use a função @code{put-image} para colocar a figura do Gato Ninja sobre as 
                                                          outras figuras do jogo. Se ela começar no centro da tela, em qual coordenada-x 
                                                          ela seria colocada? E em qual coordenada-y?}]}}
                         @teacher{Depois que @code{gatoY} foi adicionado à estrutura mundo, mas antes que qualquer função tenha sido modificada, experimente fazer a 
                                  simulação novamente, dando o recorte do gato ninja para o voluntário do @code{desenha-mundo}. O mundo tem agora três coisas nele
                                  (@code{caoX}, @code{rubiX}, e @code{gatoY}), mas as funções de atualizar e desenhar mudam apenas as posicoes do cachorro e 
                                  do rubi. Quando o @code{big-bang} começa a animação, apenas o @code{caoX} e @code{rubiX} serão atualizados. Depois de algumas 
                                  iterações, peça aos voluntários se você tivesse apertado a tecla "para cima". se o @code{desenha-mundo} começar a mover o recorte do gato ninja,
                                  referencie o código escrito. Você não programou nada que muda o @code{gatoY} ainda.}}
                 ]
         }
                                         
@lesson/studteach[#:title "Keypress"
        #:duration "35 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will extend their understanding of events to cover key-events}
            @item{Students will deepen their knowledge of conditionals, by combining them with struct accessor and constructor functions.}]
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
        @points[@point{@student{Now that the world structure is consistant across all the functions in Ninja World, we're ready to make the cat move.
                                @activity{Open your workbook to @worksheet-link[#:page 28 #:name "Keypress"]. Using the Design Recipe, write the
                                                                function @code{keypress} for the Ninja World game.} 
                                @bannerline{Step 1 - Contract and Purpose Statement}
                                The word problem tells us that the function's name will be @code{keypress}. What about the Domain? Think about what
                                the function needs to know in order to handle a keypress: it needs the World, otherwise it wouldn't know what to 
                                update. But it also needs to know what key was pressed (either @code{"up"} or @code{"down"}).
                                @activity{@itemlist[@item{What datatypes are @code{"up"} and @code{"down"}?}
                                                     @item{What is the Domain of @code{keypress}? The Range?}
                                                     @item{What is a good Purpose Statement for this function?}]}   
          @code[#:multi-line #t]{; keypress : World String -> World
                                 ; Given a world and key pressed, updates the world's catY}}
                        @teacher{}}
                 @point{@student{@bannerline{Step 2 - Examples}
                               @activity{Write an example using the @code{START} world, when the user presses @code{"up"}.
                                                                    @itemlist[@item{@code{(EXAMPLE (keypress START "up") ...)}}
                           @item{What should you get back? (HINT: Look at the Range)}
                           @item{What function makes a world? What things are part of this world?}
                           @item{@code[#:multi-line #t]{(EXAMPLE (keypress START "up") 
                                                                 (make-world ...dogX...rubyX...catY))}}
                           @item{Does the @code{dogX} change when the user presses @code{"up"}? How do you get the old @code{dogX} out of the @code{START} world?}
                           @item{@code[#:multi-line #t]{(EXAMPLE (keypress START "up")
                                                                 (make-world (world-dogX START)...rubyX...catY))}}
                           @item{Does the @code{rubyX} change when the user presses @code{"up"}? How do you get the old @code{rubyX} out of the @code{START} world?}
@item{@code[#:multi-line #t]{
(EXAMPLE (keypress START "up") (make-world (world-dogX START)
                                             (world-rubyX START)
                                              ...catY...))}}
                           @item{What about the @code{catY}? How much should it change if the user presses @code{"up"}? Let's say 10 pixels.}
                           @item{Should you add or subtract from the @code{catY} if the @code{"up"} key is pressed? Why?}]}
                
Your first example should look like: 
@code[#:multi-line #t]{
(EXAMPLE (keypress START "up") (make-world (world-dogX START)
                                           (world-rubyX START) 
                                        (+ (world-catY START) 10)))}}
                         @teacher{}}
                 @point{@student{@activity{Write one more example for @code{keypress} using the @code{START} world and the @code{"down"} key. Think about how the @code{catY} will change this time}
@code[#:multi-line #t]{(EXAMPLE (keypress START "down") (make-world (world-dogX START) 
                                         (world-rubyX START) 
                                         (- (world-catY START) 10)))}
@activity{Next, carefully go through your examples and circle @italic{everything} that changes. Does this function behave like the functions you've been working with?}}
                         @teacher{}}
                 @point{@student{@bannerline{Step 3 - Definition}
                @activity{What goes into the function header? What are some good variable names for the world and string (representing the key pressed) in the Domain?}
                 @code[#:multi-line #t]{(define (keypress w key)
	                                              ...)}
                 What now? This is a test of your programming intuition: you have two different examples, where you add 10 to @code{catY} in one case
                 but subtract 10 in another. How can a function behave so differently? It has multiple conditions, with a different response to each.
                 You've already seen this before, back in Bootstrap:1 - @code{cond}.
                 @code{cond} is a special function, which signals to the computer that the function will have multiple conditions: it behaves differently 
                 depending on what input(s) it gets. This is also known as a @vocab{piecewise function}.}
                        @teacher{Be sure to check students’ Contracts and EXAMPLEs during this exercise, especially when it’s time for them to circle and
                                 label what changes between examples. This is the crucial step in the Design Recipe where they should discover the need 
                                 for @code{cond}.}}
                 @point{@student{Each @vocab{piecewise function} has at least one @vocab{clause}. Each clause has a Boolean question and a result. In 
                                      your @code{keypress} function, there is a clause for the @code{"up"} key, and another for the @code{"down"} key.
                                      If the question evaluates to true, the expression gets evaluated and returned. If the question is false, the computer 
                                      will skip to the next @vocab{clause}. To write a function with multiple conditions, start with @code{cond} and use
                                      square brackets to add a branch. We know that every branch has a test and a result, making a @vocab{clause}. 
                                      @code[#:multi-line #t]{(define (keypress w key)
	                                   (cond
		                                 [...test...  ...result...]))}}
                         @teacher{}}
                 @point{@student{Let's start the first branch. It will test if the @code{key} pressed is equal to @code{"up"}. @activity{What function can we use to test if two strings are equal?}
@code[#:multi-line #t]{(define (keypress w key)
	(cond
		[(string=? key "up")  ...result...]))}}
                         @teacher{Square brackets enclose the question (a statement returning a boolean) and answer for each clause. There can only be one
                                  expression in each answer.}}
                 @point{@student{What is the result if the key is @code{"up"}? (HINT: Look back at your EXAMPLES for help.) You can copy in the example 
                                 for @code{"up"}, and change all instances of @code{START} to the @vocab{variable}, @code{w}:
@code[#:multi-line #t]{(define (keypress w key)
	(cond
		[(string=? key "up")  (make-world (world-dogX w) 
                                                  (world-rubyX w) 
                                               (+ (world-catY w) 10))]))}
@activity{What is the second condition that needs to be considered? What expression will test that condition? Write the second branch of the @code{keypress} function.}}
                         @teacher{}}
                 @point{@student{We also need to test whether the user pressed the @code{"down"} key:
                 @code[#:multi-line #t]{(define (keypress w key)
	(cond
                [(string=? key "up")  (make-world (world-dogX w) 
                                                  (world-rubyX w) 
                                               (+ (world-catY w) 10))]
                                                       
		[(string=? key "down")  (make-world (world-dogX w) 
                                                    (world-rubyX w) 
                                                 (- (world-catY w) 10))]))}
                               Now the computer knows what to do when either @code{"up"} or @code{"down"} is pressed, but there are lots of other keys on your keyboard. 
                               @activity{Type the above code into the Ninja Cat game and click "Run". Ninja Cat moves when you press the "up" and "down" 
                                         arrow keys. What happens if you press a different key? You should get an error...can you guess why?}}
                         @teacher{}}
                 @point{@student{Racket doesn't know what to do if any other key is pressed, because we haven't told it what to do. 
                               @activity{@itemlist[@item{Should the world change if the user hits the spacebar, or the @code{"r"} key?}
                                                    @item{Which world should be returned if any other key is pressed?}]}
Instead of enumerating all the values of the original world, we can use the variable, @code{w}: 
@code[#:multi-line #t]{(define (keypress w key)
	(cond
                [(string=? key "up")  (make-world (world-dogX w) 
                                                  (world-rubyX w) 
                                               (+ (world-catY w) 10))]
                                                      
		[(string=? key "down")  (make-world (world-dogX w) 
                                                    (world-rubyX w) 
                                                 (- (world-catY w) 10))]
                [else w]))}
                 
The last clause in a conditional can be an @code{else} clause, which gets evaluated if all the previous clauses were @code{false}.}
                         @teacher{@code{else} clauses are best used as a catch-all for cases that you can’t otherwise enumerate. If you can state a precise 
                                   question for a clause, write the precise question instead of else. For example, if you have a function that does
                                   different things depending on whether some variable @code{x} is larger than @code{5}, it is better for beginners to
                                   write the two questions @code{(> x 5)} and @code{(<= x 5)} rather than have the second question be @code{else}. 
                                   Explicit questions make it easier to read and maintain programs. When you use @code{else}, someone has to read
                                   all the previous questions to know what condition else corresponds to: they can’t just skim all the questions 
                                   to find the one that matches their situation. This makes code more readable and understandable.}}
                 ]
         }     
@lesson/studteach[#:title "Keypresses in Your Game"
        #:duration "35 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Using conditionals, students will write a function to handle different keypresses in their game.}]
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
        @points[@point{@student{In Ninja World, the player can only press two keys: @code{"up"} or @code{"down"}. 
                                @activity{@itemlist[@item{What field in the World changes when the player presses @code{"up"}? 
                                                         How does it change?}
                                                     @item{Think about the person playing your game. How will they control the game? What
                                                           key will make YOUR player move up? Down? What else can they do? Move side-to-side? 
                                                           Jump? Teleport? Shoot a projectile?}
                                                     @item{Turn to @worksheet-link[#:page 27 #:name "Lesson 6"] in your workbooks.
                                                                   Write down the various keys that the user can hit to control the game. 
                                                                   For each one, write down the field in your world struct that changes, 
                                                                   and how it changes.}]}}
                        @teacher{Review students' workbook pages, and check for understanding: could they change multiple things in their game
                                 with one keypress?}}
                 @point{@student{@activity{Turn to @worksheet-link[#:page 30 #:name "Keypress-in-Game"] in your workbooks. Choose 3 
                                           keys that control the game, and go through the design recipe: Write EXAMPLES for what should 
                                           happen to your START world depending on which key was pressed. Then define your function. Once
                                           you've completed the Design Recipe, type your @code{keypress} function into your games.}

                                  Of course, keypresses can do a lot more in a videogame than just move a character up and down. By using what
                                  your learned about Boolean functions, you can add more advanced movement. Here are some ideas:
@itemlist[
          @item{@bold{Warping:} instead of having the player’s y-coordinate change by adding or subtracting, replace it with a Number to 
                 have the player suddenly appear at that location. (For example, hitting the @code{"c"} key causes your player to warp back
                 to the center of the screen, at y=240.)}
          @item{@bold{Boundary-detection:} Change the condition for moving up so that the player only moves up if @code{key} = @code{"up"} 
                 AND the player's y-coordinate is less than @code{480}. Likewise, change the condition for @code{"down"} to also check 
                 that the player's y-coordinate is greater than 0.}
          @item{@bold{Wrapping:} Add a condition (before any of the keys) that checks to see if the player’s y-coordinate is above 
                 the screen @code{(> y 480)}. If it is, have the player warp to the bottom. Add another condition so that the player 
                 warps back up to the top of the screen if it moves below the bottom.}
          @item{@bold{Challenge:} Have a character hide when the @code{"h"} key is pressed, only to re-appear when it is pressed again.}]
}
                         @teacher{Hint for the challenge: multiply by -1!}}
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
        @points[@point{@student{With @vocab{conditionals} and @vocab{piecewise functions}, you can make a lot of things happen in your 
                                     game with just a few lines of code, like controlling the movement of characters. Speaking of 
                                     controlling characters, what happens in Ninja World when the dog and ruby go off the screen? 
                                     They keep going, but don't come back - the same problem we had in Bootstrap:1, and if you 
                                     need a refresher on how to fix it, that's what we'll be covering in the next unit.}
                       @teacher{Have students show each other their (controllable games).}}
                 ]
         }
       }

       