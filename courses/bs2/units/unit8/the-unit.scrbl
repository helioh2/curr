#lang curr/lib

@title{Unidade 8: Detecção de Colisões}
@declare-tags[management]

@unit-overview/auto[#:lang-table (list (list "Número" @code{+ - * / sq sqrt expt}) 
                                       (list "String" @code{string-append string-length})                          
                                       (list "Figura" @code{rectangle circle triangle ellipse radial-star scale rotate put-image})
                                       (list "Booleano" @code{= > < string=? and or}))]{   
@unit-descr{Alunos retornam aos Teorema de Pitágoras e a fórmula da distância que usaram no Bootstrap 1, mas agora com estruturas de dados e com toda a função atualiza-mundo.}
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
                            @item{Recortes de Teorema de Pitágoras com os materiais [@(resource-link #:path "images/pythag1.png" #:label "1"), @(resource-link #:path "images/pythag2.png" #:label "2")] - 1 por grupo}
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

@lesson/studteach[#:title "A Fórmula da Distância"
        #:duration "20 minutos"
        #:overview ""
        #:learning-objectives @itemlist[@item{Reforçam sua compreensão sobre a fórmula da distância}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[ @item{os alunos escreverão a função da distância}]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{infelizmente você não tem nenhum código para calcular a distância em duas dimensões.
                                Tudo o que você tem atá agora é alguma coisa que te diz o comprimento epenas na dimensao x ou na y.                   
                                @bitmap{images/ABCgraph.png}
                                @activity{@itemlist[@item{Como você poderia encontrar a distância entre dois pontos mostrados
                                                          nessa figura?}
                                                     @item{Como você poderia encontrar o comprimento da linha pontilhada, que também 
                                                           é chamada de @vocab{Hipotenusa}?}]}
                                Vamos começar com o que sabemos: a linha pontilhada emio que forma um triângulo, e podemos
                                encontrar o tamanho dos outros dois lados, nomeados "A", "B" e "C". 
                                @activity{Qual é o tamanho-linha de A?}
                                Para tornar sua vida mais fácil, você pode usar a função que você já escreveu: @code{tamanho-linha}.
                                Nesse exemplo, (tamanho-linha A), é 4 e (tamanho-linha B) é 3, mas ainda não sabemos C.}
                        @teacher{@management{Desenhe essa imagem no quadro, com as linhas nomeadas "A", "B" e "C".}}}
                 @point{@student{Antigas civilizações tiveram o mesmo problema: eles também se esforçaram para encontrar a distância
                                 entre pontos em duas dimensões. Vamos trabalhar em uma maneira de pensar sobre esse problema:
                                 qual expressão calcula o tamanho da hipotenusa de um triângulo-retângulo?}
                       @teacher{@management{Esse exercício é melhor realizado em pequenos grupos de alunos (2-3 por grupo).} 
                                 Distribua materiais do Teorema de Pitágoras [@(resource-link #:path "images/pythag1.png" #:label "1"), 
                                 @(resource-link #:path "images/pythag2.png" #:label "2")] para cada grupo, e peça que eles
                                 revisem todos os materiais:@itemlist[@item{Um grande quadrado branco, com um quadrado menos desenhado dentro}
                                                                          @item{Quatro triângulos cinzas, todos do mesmo tamanho}]
                                 Todos terão um pacote com os mesmos materiais, mas os triângulos de cada grupo são
                                 um pouco diferentes. A atividade funciona com triângulos de todos os tamanhos, de modo que cada par vai 
                                 começar a testá-los em seus próprios triângulos. @management{desenhe o diagrama na quadro.}}
                        }
                @point{@student{@bitmap{images/csquared.png}Para qualquer triângulo retângulo, é possível desenhar uma figura 
                                 onde a hipotenusa é usada em todos os lados de um quadrado. No diagrama mostrado 
                                 aqui, o quadrado branco é rodeado por quatro triângulos cinzas, triângulo-retângulos idênticos, todos 
                                 com lados A e B. O quadrado tem quatro lados idênticos ao tamanho de C, que 
                                 são as hipotenusas dos triângulos. Se a area do quadrado é expressa por 
                                 @math{lado * lado}, então a area do espaço em branco é @math{C^{2}}.}
                        @teacher{Peça que os alunos coloquem seus triângulos cinzas sobre o papel, para combinar com o diagrama.}
                       }
                @point{@student{@animated-gif{images/Pythag_anim.gif} Movendo os triângulos cinza, é possível 
                                 criar dois retângulos que cabem dentro do quadrado original. Enquanto que o espaço 
                                 ocupado pelos triângulos foi deslocado, mas não ficou maior ou menor.
                                 Da mesma forma, o espaço em branco foi quebrado em duas partes menores, mas no total
                                 ele permanece do mesmo tamanho. Usando os comprimentos de A e B, pode-se calcular
                                 a area dos dois quadrados.
                                 @activity[#:forevidence (list "8.G.6-8&1&1" "8.G.6-8&1&1" "8.G.6-8&1&3")]{
                                      Qual é a área do quadrado menor? E do quadrado maior?}}
                       @teacher{Você pode ter que apontar explicitamente que o tamanho dos lados-dos-triângulos podem ser
                                usados como lados-do-quadrado.}
                       }
                @point{@student{@bitmap{images/absquare.png}O quadrado menor tem uma area de @math{A^{2}}, e o
                                 quadrado maior tem uma area de @math{B^{2}}. Como esses quadrados são apenas o quadrado
                                 original dividido em duas partes, sabemos que a soma dessas áreas deve ser igual 
                                 à área do quadrado original:
                                 @bannerline{@math{A^{2} + B^{2} = C^{2}}}
                                 @activity[#:forevidence (list "8.G.6-8&1&1" "8.G.6-8&1&2" "8.G.6-8&1&3")]{
                                     A mesma equação funciona para qualquer valor de A e de B?}}
                       @teacher{}
                       }
                @point{@student{Para conseguirmos isolar o C, precisamos da raíz-quadrada da soma das áreas:
                                @bannerline{@math{\sqrt{A^{2} + B^{2}} = C}}
                                Pitágoras provou que você pode conseguir o quadrado da hipotenusa somando os quadrados 
                                dos outros dois lados. No seu jogo, você vai usar as distâncias horizontal e vertical
                                entre dois personagens assim como os dois lados do seu trângulo, e usar o 
                                Teorema de Pitágoras para encontrar o comprimento desse terceiro lado.}
                       @teacher{Lembre os alunos que A e B são os comprimentos horizontal e vertical, que podem
                                ser calculados pela @code{tamanho-linha}.}
                       }
                @point{@student{@activity{@itemlist[@item{Vá para a @worksheet-link[#:page 37 #:name "Distance-Formula-With-Numbers"] 
                                                          de sua apostila - você verá a fórmula escrita.} 
                                                     @item{Desenhe o círculo de avaliação, começando com a 
                                                           expressão mais simples que você ver primeiro.}
                                                     @item{Quando tiver o círculo de avaliação completo, transforme ele 
                                                           em código racket na parte de baixo da página, começando 
                                                           com @code{(EXAMPLE (distancia 4 2 0 5) ...)}}]}
                                 Agora você tem o código que lhe diz a distância entre os pontos (4, 2) e (0, 5).
                                 Mas não queremos que ele funcione para @italic{quaisquer} pontos. Seria ótimo se tivéssemos uma 
                                 função que recebe apenas os X e Y como entrada, e faz os cálculos para nós.}
                        @teacher{}}
                @point{@student{@activity{@itemlist[@item{Vá para a @worksheet-link[#:page 38 #:name "Distance"], 
                                                           e leia a descrição do problemas e o cabeçalho da função 
                                                           ccom atenção.}
                                                      @item{Use a Receita de Projeto para escrever sua função de distância. 
                                                            Sinta-se livre para usar o trabalho das páginas anteriores como seu  
                                                            primeiro exemplo, e depois faça um por conta própria.}
                                                      @item{Quando tiver terminado, digite suas funções @code{tamanho-linha} e 
                                                            @code{distancia} no seu jogo, e veja o que acontece.}
                                                      @item{Alguma coisa acontece quando uma função aparece dentro da outra?}]}
                                 Você ainda precisa de uma função que verifique se duas coisas estão colidindo ou não.}
                        @teacher{Preste muita atenção na ordem das coordenadas que são passadas para a função 
                                 @code{distancia}. A coordenada-x do jogador (@code{px}) deve vir primeiro,
                                 seguida da coordenada-y do jogador (@code{py}), x do outro elemento (@code{cx}), e y do 
                                 elemento(@code{cy}). Dentro do corpo da função, @code{tamanho-linha} pode calcular apenas 
                                 distâncias no mesmo eixo (@code{(tamanho-linha px cx)} e @code{(tamanho-linha py cy)}).
                                 Assim como fazer estruturas de daods, a ordem importa, e a função da distância não 
                                 funcionará de outra maneira. Também lembre-se de verificar se os alunos estão usando @code{sq} e 
                                 @code{sqrt} nos lugares certos. }
                        }
                ]
         }
       
@lesson/studteach[#:title "Colidiu?"
        #:duration "10 minutos"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Os alunos escreverão a função colidiu?}]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Então o que queremos fazer com essa distância? 
                                @activity{Qual o máximo que seu perigo e seu jogador podem chegar, antes de 
                                          baterem um no outro?}
                                No início da @worksheet-link[#:page 39 #:name "collide"] você encontrará a 
                                Descrição do Problema para @code{colidiu?}. 
                                @activity{@itemlist[@item{Preencha a Assinatura, dois Exemplos, e depois escreva o
                                                          código. Lembre-se: você PRECISARÁ fazer uso da 
                                                          função @code{distancia} que você acabou de escrever!}
                                                     @item{Quando você terminar, digite ele em seu jogo, em
                                                           @code{colidiu?}.}]}}
                        @teacher{Usando exemplos visuais, pergunte aos alunos que adivinhem a distancia entre um perigo
                                 e um jogador em diferentes posições. O quão longe eles precisam estar antes de
                                 um atingir o outro? 
                                 @management{Certifique-se que os alunos entendam o que está acontecendo quando faz essas perfuntas:
                                             Se a distância da colisão é pequena, isso significa que o jogo está difícil 
                                             ou fácil? O que faria ele mais fácil?}}
                        }
                 ]
         }
            
@lesson/studteach[#:title "atualiza-mundo"
        #:duration "40 minutos"
        #:overview ""
        #:learning-objectives @itemlist[@item{Identificar colisão como um outro sub-domínio que precisa de um comportamento diferente sa função atualiza-mundo}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Os alunos irão usar diferentes ramos Cond para identificar colisões nos seus jogos}]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Agora que você tem uma função que verifica se algo está colidindo, 
                                você pode voltar a modificar o Mundo Ninja.
                                @activity{Das quatro funções maiores do jogo (@code{atualiza-mundo}, 
                                          @code{desenha-mundo}, @code{keypress}, e @code{big-bang}), qual 
                                          você acha que você precisará editar para lidar com colisões?}
                                nós precisaremos fazer mais alguns ramos de @code{cond} na @code{atualiza-mundo}. 
                                O que deveria acontecer quando o gato colide com o cachorro? Queremos colocar o cachorro 
                                fora da tela, para que ele posso voltar a atacar novamente.}
                        @teacher{}}
                 @point{@student{@activity{@itemlist[@item{Comece com o teste: como você verifia se o
                                                          gato e o cachorro estão colidindo? Você ja escreveu uma função 
                                                          uqe verifica isso?}
                                                     @item{Quais são as entradas que ela precisa?}
                                                     @item{Como você consegue saber o @code{gatoY} do mundo?}
                                                     @item{E a coordenada-x do Gato? Ele está sempre no
                                                           centro da tela, então qual é sempre 
                                                           sua coordenada x?}
                                                     @item{Como você consegue saber o @code{caoX} do mundo?} 
                                                     @item{Temos um @code{caoY} no mundo? Onde no jogo 
                                                           você pode olhar esse número? (Dica: em qual
                                                           função você @italic{desenha} as imagens na 
                                                           tela?)}]}
@code[#:multi-line #t]{[(colidiu? 360 (mundo-gatoY m) (mundo-caoX m) 400) ...resultado...]}
Lembre-se que @code{atualiza-mundo} devolve um mundo, então qual função deveria vir primeiro no seu resultado?
@code[#:multi-line #t]{[(colidiu? 360 (mundo-gatoY m) (mundo-caoX m) 400) (make-mundo ...caoX...
                                                                                     ...rubiX...
			                                                             ...gatoY...)]}
                                @activity{E o que deve acontecer quando o gato e o cachorro colidirem? Você pode pensar em um 
                                          número que coloca o cachorro para fora da tela do lado esquerdo?}
             @code[#:multi-line #t]{[(colidiu? 360 (mundo-gatoY m) (mundo-caoX m) 400) (make-mundo -100
					                                                          ...rubiX...
					                                                          ...gatoY...)]}
                                @activity{O @code{rubiX} muda quando o cachorro e o gato colidem? E o 
                                          @code{gatoY}? Como você obtém cada uma dessas coisas fora do mundo?}
             @code[#:multi-line #t]{[(colidiu? 360 (mundo-gatoY m) (mundo-caoX m) 400) (make-mundo -100
					                                                          (mundo-rubiX m)
					                                                          (mundo-gatoY m))]}}
                        @teacher{Detecção de Colisão deve ser parte da função @code{atualiza-mundo} porque o
                                 jogo deve verificar por alguma colisão @italic{toda vez} que o mundo é atualizado. Os alunos podem
                                 assumir que @code{desenha-mundo} deveria tratar a detecção de colisão, mas repare que a
                                 Imagem de @code{desenha-mundo} é uma Figura, e suas funções devem retornar um novo mundo a fim de
                                 definir as localizações dos personagens depois de uma colisão.}}
                 
                 @point{@student{Agora é hora de tratar as colisões do seu jogo...
                                 @activity{Vá para a @worksheet-link[#:page 40 #:name "Collide-Examples"] e escreva 
                                           mais alguns testes e resultados. Quais personagens do seu jogo podem colidir 
                                           com algum outro? O que deve acontecer como resultado? Quando você tiver escrito 
                                           cada teste e resultado abaixo, digite-o em seu jogo.}}
                         @teacher{Trabalhe em pequenos grupos para completar os ramos da colisão.}}
                ]
         }

@lesson/studteach[#:title "Encerramento"
        #:duration "5 minutos"
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
        @points[@point{@student{Parabéns! Você concluiu essa lição, e agora está pronto para fazer seu 
                                jogo cada vez melhor. Reserve algum tempo para pensar sobre seu jogo...o que mais você quer que seu jogo 
                                faça? Na pŕoxima unidade você pode adicionar ainda mais coisas, para que seus jogos fiquem ainda mais maneiros.}
                        @teacher{@management{Peça aos alunos que mostrem uns aos outros seus jogos terminados, e comece a pensar sobre quais 
                                 funcionalidades eles querem adicionar a seguir!}}}
                 ]
         }
       }

       
   