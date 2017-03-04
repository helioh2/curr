#lang curr/lib
@title{Unidade 8: Detecção de Colisão}

@declare-tags[management]

@unit-overview/auto[#:lang-table (list (list "Numero" @code{+ - * / sq sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Figura"  @code{rectangle circle triangle ellipse star text scale rotate put-image})
                                       (list "Booleano" @code{= > < string=? and or}))]{
@unit-descr{Os alunos estudam, discutem e comprovam o Teorema de Pitágoras, em seguida, usam o teorema---em conjunto com Booleanos---para detectar colisões em seus jogos.}
}

@unit-lessons{
@lesson/studteach[
     #:title "Distância em 1D" 
     #:duration "20 min"
     #:overview "Os alunos representam uma colisão em seu game, e raciocinam sobre o comportamento matemático de uma detecção de colisão"
     #:learning-objectives @itemlist[@item{Os alunos aprendem como calcular a distância entre objetos em uma dimensão}]
     #:evidence-statements @itemlist[@item{Os alunos serão capazes de explicar como a Linha Numérica é utilizada para calcular a distância em uma dimensão}
                                     @item{Os alunos serão capazes de explicar porque a função @code{tamanho-da-linha} usa um condicional}]
     #:product-outcomes @itemlist[]
     #:standards (list "BS-PL.3" "BS-PL.4" "6.NS.5-8")
     #:materials @itemlist[@item{Computadores com DrRacket ou WeScheme}
                           @item{@(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "Apostila") do aluno}
                           @item{Lápis/canetas aos alunos, e giz/marcadores de quadro branco aos professores}
                           @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                           @item{Tabela da Linguagem(veja abaixo)}
                          ]
     #:preparation @itemlist[]
     #:prerequisites (list "Luigi's Pizza" "Coordinate Planes")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @points[@point{@student{Supondo que dois objetos estão se movendo pelo cenário, cada um com suas próprias coordenadas (x, y). Quando é que suas bordas começam a se sobrepor? Elas certamente irão se sobrepor quando suas coordenadas forem idênticas (x1=x2, y1=y2), mas e se suas coordenadas estiverem separas por uma pequena distância? O quão pequena essa distância precisa ser para que suas bordas se toquem?}
                       @teacher{Auxílios visuais são fundamentais aqui: certifique-se de desenhar isto no quadro!}
                       }
                @point{@student{@bitmap{images/numberline.png}Em uma dimensão, é fácil calcular quando dois objetos se sobrepõem. Neste exemplo, o círculo vermelho possui 1cm de Raio, e o círculo azul tem 1.5cm. Os círculos irão se sobrepôr se a distância @italic{entre seus centros} for @italic{menor que a soma de seus Raios} (1+1.5 = 2.5). Como a distância entre os centros é calculada? Neste exemplo, seus centros estão 3cm separados, porque 4-1=3. @activity{Será que a distância entre eles mudaria se os círculos trocassem de lugar um com o outro? Porque sim ou porque não?}}
                       @teacher{Trabalhe com uma série de exemplos, usando uma linha numérica no quadro e peça aos alunos como eles calculam a distância entre os pontos. Tendo alunos encenando isto pode funcionar muito bem: desenhe uma linha numérica, tendo dois alunos em diferentes pontos da linha, usando seus braços para mostrar seu alcançe(bordas do círculo). Mova os alunos ao longo da linha até se tocarem, então calcule a distância na linha numérica). Os primeiros segundos @(hyperlink "http://www.youtube.com/watch?v=leP3tQ_GZL8&feature=player_embedded" "deste vídeo") mostra o exemplo em ação.}
                       }
                @point{@student{Seu arquivo de jogo fornece uma função chamada @code{tamanho-da-linha} que calcula a diferença entre dois pontos em uma linha numérica. Especificamente, @code{tamanho-da-linha} recebe dois números como entrada e determina a distância entre eles.
                       @activity[#:forevidence (list "BS-PL.3&1&3" "BS-PL.4&1&1" "6.NS.5-8&1&6")]{Que respostas você espera da cada um dos seguintes usos da função @code{tamanho-da-linha}:
                                 @itemlist[@item{@code{(tamanho-da-linha 2 5)}}
			                   @item{@code{(tamanho-da-linha 5 2)}}
                                          ]
                                 Você espera a mesma resposta mesmo se a entrada maior ou a menor vier por primeiro?}}
                       @teacher{Se você tem tempo e quer reforçar como condicionais funcionam através de exemplos, peça aos alunos para preencher os espaços em branco em Exemplos como em @code{(EXAMPLE (tamanho-da-linha 2 5) ____)}, circule o que é diferente, e note que o que foi circulado pode estar em ordem diferente dependendo se a primeira ou a segunda entrada for a Maior. Esta lição sugere que o código para @code{tamanho-da-linha} use um condicional. Neste caso, para alunos mais experientes, pode optar por usar a função @code{abs}, de valor absoluto ao invés do condicional;Usando @code{cond}, entretanto, enfatize como a estrutura de código resulta dos exemplos.}}

               @point{@student{Vá até as funções @code{tamanho-da-linha} e @code{colisao?} em seu código. Note que @code{tamanho-da-linha} usa uma condição de um modo que subtrai o número menor do maior.
                       @activity[#:forevidence (list "BS-M&1&1" "8.F.5&1&1")]{Você pode explicar porque @code{tamanho-da-linha} precisa usar @code{cond}? Quais são as duas condições?}}
                       @teacher{As duas condições são: @itemlist[@item{A é @italic{menor que} B} @item{B é @italic{menor ou igual} á A}]}}
                       
                @point{@student{@bitmap{images/3004graph.png}Infelizmente, @code{tamanho-da-linha} pode calcular apenas a distância entre pontos numa única reta (x ou y). Como podemos calcular a distância entre objetos que se movem em 2 dimensões (como os elementos do seu jogo)? @code{tamanho-da-linha} pode calcular as linhas horizontal e vertical mostradas na figura, usando a distância entre as coodenadas-x e a distância entre as coordenadas-y. Infelizmente, isto não nos diz a distância entre os dois centros dos círculos.}
                       @teacher{}
                       }
                @point{@student{@bitmap{images/3004ABCgraph.png}Desenhando uma linha do centro de um objeto até o outro centro criamos um triângulo-retângulo, com lados A, B e C. A e B são as distâncias horizontal e vertical, com C sendo a distância entre as coordenadas. @code{tamanho-da-linha} pode ser usado para calcular A e B, mas como podemos encontrar C?}
                       @teacher{Nos arquivos de jogo dos Alunos, tem um valor chamado @code{*distancia-colorida*}, que está definida como string vazia @code{""}. Mudando isto para uma cor como "yellow" ou "red", o jogo desenha triângulos-retângulos entre os personagens do jogo, e coloca os comprimentos de cada lado. Vocẽ pode querer demonstrar isto usando seu próprio arquivo de jogo, e os alunos acompanhando. Dica: para tornar isto o mais simples possível de ver esses triângulos, coloque um plano de fundo simples, retângulo preto e desligue as funções de animação.}
                       }
                @point{@student{Em um triângulo-retângulo, o lado oposto ao ângulo de 90 graus é chamado de @vocab{hipotenusa}. Pensando de volta na nossa detecção de colisão, nós sabemos que os objetos vão colidir quando a hipotenusa for @italic{menor que a soma de seus raios}. Sabendo disso, o comprimento da hipotenusa será essencial para saber quando acontece uma colisão.}
                       @teacher{}
                       }
                ]}
                                                           
@lesson/studteach[
     #:title "Distância em 2D" 
     #:duration "35 min"
     #:overview "Os alunos exploram o Teorema de Pitágoras usando formas no papel, e então pensam sobre o comportamento matemático da detecção de colisão"
     #:learning-objectives @itemlist[@item{Os alunos aprendem que a distância em duas dimensões corresponde à hipotenusa de um triângulo retângulo}
                                     @item{Alunos aprendem como calcular a distância entre objetos em duas dimensões}]
     #:evidence-statements @itemlist[@item{Alunos compreendem que a distância em duas dimensões necessita de cálculos diferentes que a distância em uma dimensão}
                                     @item{Alunos podem retirar um triângulo retângulo do cálculo de distância entre duas coordenadas}
                                     @item{Alunos entemdem que manipular geometria é uma ferramenta muito útil para descobrir certos cálculos}
                                     @item{Alguns alunos podem usar manipulação de geometria para obter o Teorema de Pitágoras}
                                     @item{Alunos podem demonstrar o Teorema de Pitágoras}
                                     @item{Alunos podem transformar o Teorema de Pitágoras em código escrevendo a função @code{distancia}}
                                    ]
     #:product-outcomes @itemlist[@item{Os alunos escrevem a função Distância em seus arquivos do jogo.}]
     #:standards (list "8.G.6-8" "BS-PL.4" "BS-DR.3")
     #:materials @itemlist[@item{Computadores com DrRacket ou WeScheme}
                           @item{@(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "Apostila") do aluno}
                           @item{Todos os computadores dos alunos devem ter o modelo de seu jogo pré-carregado, com seus arquivos e figuras}
                           @item{Recorte os pacotes do Teorema de Pitágoras [@(resource-link #:path "images/pythag1.png" #:label "1"), @(resource-link #:path "images/pythag2.png" #:label "2")] - 1 para cada grupo de alunos que trabalhem juntos}
                           @item{Lápis/canetas aos alunos, e giz/marcadores de quadro branco aos professores}
                           @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                           @item{Tabela da Linguagem(veja abaixo)}
                          ]
     #:preparation @itemlist[ @item{NECESSÁRIO: Distribua esta @(hyperlink "https://docs.google.com/document/d/1k8UiHsMukSH5CKPS9Zal8g-VnradcQo3Zcik-rf9Wlo/edit?usp=sharing" "Atividade de Preparação").}]
     #:prerequisites (list "1D Distance")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @points[@point{@student{Antigas civilizações tiveram o mesmo problema: eles também trabalharam para encontrar a distância entre pontos em duas dimensões! Vamos trabalhar com uma maneira de pensar sobre este problema: Qual expressão calcula o comprimento da hipotenusa em um triângulo-retângulo?}
                       @teacher{Este exercício é melhor feito em pequenos grupos (2-3 pessoas). Passe os materiais do Teorema de Pitágoras [@(resource-link #:path "images/pythag1.png" #:label "1"), @(resource-link #:path "images/pythag2.png" #:label "2")] para cada grupo, e peça para que separem do material:@itemlist[@item{Um grande quadrado branco, com um quadrado menor desenhado dentro}@item{Quatro triângulos cinza, todos do mesmo tamanho}]}
                       }
                @point{@student{@bitmap{images/csquared.png}Para qualquer triângulo-retângulo, é possível desenhar uma figura onde a hipotenusa é usada por todos os quatro lados de um quadrado. No diagrama mostrado ao lado, o quadrado branco está rodeado por quatro cinzas, triângulos-retângulos idênticos, com lados A e B. O quadrado por sua vez tem quatro lados idênticos chamados de C, que são as hipotenusas para os triângulos. Se a area do quadrado é encontrada usando @math{lado * lado}, então a area do espaço em branco é @math{C^{2}}.}
                       @teacher{Peça aos alunos para colocar os triângulos cinza sobre o papel branco, para combinar com o diagrama.}
                       }
                @point{@student{@animated-gif{images\Pythag_anim.gif} Movendo os triângulos cinza, é possível criar dois retângulos que cabem dentro do quadrado original. O espaço ocupado foi deslocado, mas não aumentou e nem diminuiu de tamanho. Da mesma maneira, o espaço em branco foi dividido em dois quadrados menores, permanecendo do mesmo tamanho. Usando os comprimentos dos lados A e B, pode-se calcular a area dos dois quadrados.
                                 @activity[#:forevidence (list "8.G.6-8&1&1" "8.G.6-8&1&1" "8.G.6-8&1&3")]{Qual é a area do quadrado menor? E a area do maior?}}
                       @teacher{Pode ser necessário destacar que os comprimentos laterais dos triângulos podem ser usados como comprimento das laterais dos quadrados.}
                       }
                @point{@student{@bitmap{images/absquare.png}O quadrado menor tem area de @math{A^{2}}, e o quadrado maior tem area de @math{B^{2}}. Uma vez que estes quadrados são apenas o quadrado original(branco) dividido em duas partes, sabemos que a soma destas areas deve ser igual à area do quadrado original:
                                 @bannerline{@math{A^{2} + B^{2} = C^{2}}}
                                 @activity[#:forevidence (list "8.G.6-8&1&1" "8.G.6-8&1&2" "8.G.6-8&1&3")]{A equação funciona da mesma igual para qualquer valor de A e B?}}
                       @teacher{}
                       }
                @point{@student{Para conseguir isolar C, precisamos da raiz quadrada da soma das areas:
                                @bannerline{@math{\sqrt{A^{2} + B^{2}} = C}}
                        @activity[#:forevidence (list "BS-CE&1&4")]{
                               Vá para a @worksheet-link[#:page 27 #:name "Distance-Formula-With-Numbers"] em sua apostila - você verá a mesma fórmula 
                               escrita, desta vez usando @code{tamanho-da-linha} para calcular a distância ao longo do eixo-x e eixo-y. O Círculo de Avaliação 
                               já está parcialmente feito, mas você terá que terminá-lo por si mesmo. Assim que estiver pronto, converta o círculo 
                               em código na parte de baixo da página.}}
                        @teacher{Relembre os alunos que A e B são as distâncias horizontal e vertical, que são calculadas usando @code{tamanho-da-linha}.}
                 }
                @point{@student{O código na página 27 irá calcular com precisão a distância entre dois objetos cujos centros estão nos pontos  em (0,0) e (4,3). Mas e os outros pontos? Seria bom ter uma função que calcula a distância para @italic{qualquer} conjunto de pontos.
                                @activity[#:forevidence (list "BS-DR.3&1&1" "BS-PL.4&1&1" "8.G.6-8&1&3" "8.F.1-3&1&1" "8.F.1-3&1&3")]{
                                   Vá para @worksheet-link[#:page 28 #:name "distance"] em sua apostila, e use a Receita de Projeto para escrever sua função @code{distancia}. 
                                   Sinta-se livre para usar o material da página anterior como seu primeiro exemplo, e então chegar a uma nova, feita por você mesmo.}}
                        @teacher{AVISO: verifique se os alunos estão passando as coordenadas corretas para @code{tamanho-da-linha}! Muitos alunos por engano passam o par @code{px} e @code{py} 
                                 juntos, ao invés de emparelhar as coodenadas-x. Verifique o trabalho dos alunos com cuidado!}
                        }
                ]}

@lesson/studteach[
     #:title "colisao?" 
     #:duration "25 min"
     #:overview "Alunos raciocinam sobre o comportamento matemático da detecção de colisão"
     #:learning-objectives @itemlist[@item{Alunos aprendem como usar a fórmula da distância para detectar colisões nos jogos}]
     #:evidence-statements @itemlist[@item{Alunos compreendem que colisões ocorrem quando a distância entre objetos é menor que algum limite definido anteriormente}
                                     @item{Alunos compreendem como determinar a colisão mínima entre dois objetos}
                                     @item{Alunos escrever uma função @code{colisao?} que determina se os elementos jogador e perigo de seu jogo colidiram}]
     #:product-outcomes @itemlist[@item{Os alunos adicionam a função @code{colisao?} em seus jogos para detectar quando o personagem do jogador se encontra com o perigo}]
     #:standards (list "F-IF.1-3" "F-IF.4-6" "8.F.1-3" "A-SSE.1-2" "8.G.6-8")
     #:materials @itemlist[@item{Computadores com DrRacket ou WeScheme}
                           @item{@(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "Apostila") do aluno}
                           @item{Todos os computadores dos alunos devem ter o modelo de seu jogo pré-carregado, com seus arquivos e figuras}
                           @item{Lápis/canetas aos alunos, e giz/marcadores de quadro branco aos professores}
                           @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                           @item{Tabela da Linguagem(veja abaixo)}
                          ]
     #:prerequisites (list "2D Distance" "and/or")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @points[@point{@student{Até agora você definiu uma função chamada @code{distancia}: que recebe quatro números como entrada (representando jogadorX, jogadorY, perigoX, perigoY) e produz um número representando a distância entre essas coordenadas. Se o jogador está parado em (320, 240) e o perigo está em (400, 159), a distância pode ser calculada usando @code{(distance 320 240 400 159)}.
                              @activity[#:forevidence (list "F-IF.1-3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&4")]{Para cada uma das seguintes coordenadas de jogador e perigo, escreva uma expressão que usa a função @code{distancia} para calcular a distância entre os pontos. Você pode escrever em Código ou na forma de Círculo de Avaliação:
                                        @itemlist[@item{O jogador está em (100, 225) e o perigo está em (174, 300)}
                                                  @item{O jogador está em (48, 20) e o perigo está em (210, 160)}
                                                  @item{O jogador está em (300, 60) e o perigo está em (130, 240)}
                                                 ]}
                              }
                       @teacher{}
                       }
                @point{@student{Agora que você já sabe como calcular a distância entre dois objetos, você precisa decidir quando os dois objetos colidem. Nós discutimos isso mais cedo usando círculos: dois círculos colidem quando a distância entre eles for menor que a soma de seus raios. Se seus objetos têm contornos mais interessantes que círculos, esse cálculo pode ser difícil de fazer com precisão. Felizmente, a maioria dos jogos não tem que ser precisos (eles se movem rápido demais para ver o exato momento do impacto). Nós apenas precisamos saber quando os itens estão pertos o suficiente, e usar isto para detectar a colisão.}
                       @teacher{Você pode passar um tempo a mais neste ponto para ter alunos a pensar sobre distancia de colisão com objetos de diferentes formas. O resto do Bootstrap não exige isso, mas isso pode ser um bom ponto para integrar geometria adicional se você está a ensinar matemática.}}
                @point{@student{A menos que as imagens que você escolheu são muito pequenas, 50 é geralmente distância suficiente para detectar uma colisão entre seu personagem e o perigo. Se você está usando imagens muito pequenas, você pode querer detectar uma colisão quando a distância entre os dois personagens for abaixo que 20.
                              @activity[#:forevidence (list "8.G.6-8&1&3")]{Como você iria checar se a distância entre (320, 240) e (400, 159), é @italic{menor que 50?} Como você verifica se essa distância entre os pontos é menor que 20?}}
                       @teacher{Nós estamos sendo intencionalmente vagos sobre unidades de medida aqui. As unidade estão em pixels, que é uma noção de distância em uma tela de computador. Se você quer explicar pixels para seus alunos, pode começar a falar em termos como "50 pixels". Caso contrário, pode volta à usar a linha numérica se você quer explicar unidades de distância. @(new-paragraph) Se você quer que seus alunos calculem a distância de maneira limiar(graficamente), você pode usar as funções @code{image-height} e @code{image-width}, que recebe uma imagem e retorna um número. O número retornado é o comprimento máximo da imagem correspondente(diâmetro de um círculo, largura ou altura de um retângulo ou uma imagem bitmap/url). Você pode ter alunos a desenvolver código e experimentar com expressões como @math{(widthA + widthB)/2} para calcular a distância horizontal entre os centros de dois objetos(onde @math{widthA} representa a largura do primeiro objeto, etc). Este é um significante exercício computacional em si, que poderia servir de base para exercícios extra-classe ou lição da casa extendida.}
                       }
                @point{@student{@activity[#:forevidence (list "8.F.1-3&1&1" "8.F.1-3&1&3")]{Vá para @worksheet-link[#:page 29 #:name "collide?"] em sua apostila,e use a Receita de Projeto para escrever uma função que produz @code{true} se a distância entre duas coordenadas for menor que 50. DICA: Você deve usar sua função @code{distancia}!}
                                @activity{Coloque a definição de sua função @code{colisao?} no seu arquivo do jogo. Jogue, e faça seu personagem colidir com o perigo. Seu jogo agora faz algo diferente que ele não fazia antes de você escrever @code{colisao?}?}
                      }
                        @teacher{}}
                ]}
      
@lesson/studteach[
     #:title "Encerramento"
     #:duration "5 min"
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
        @points[@point{@student{Parabéns - seu jogo está completo! Tome um minuto para percorrer o código que você escreveu, e pense
                                o quanto você aprendeu: Círculos de Avaliação, tipos de dados como @code{Numero}, @code{String}, @code{Figura} 
                                e @code{Booleano}, a importância das Assinaturas e Declaração de Propósito, e de funções grandes serem divididas em funções
                                pequenas. Você aprendeu uma nova linguagem de programação inteira, e o mais importante, você aprendeu a Receita de Projeto, que te ajuda a resolver problemas
                                e desafios de programação, concentrando-se em apenas um passo de cada vez, certificando-se que cada passo é verificado
                                em relação aos passos que vieram antes dele.
                                @activity{Uma vez que programadores colocam algo para funcionar, eles sempre olham de volta em seu código e certificam-se
                                          de que está legível, limpo e fácil de ser entendido por outras pessoas. Um carro que funciona bem pode ser bom,
                                          mas não vale a pena se é impossível para o mecânico consertá-lo! Tenha certeza que seu código é bonito, por dentro e por fora.
                                          @itemlist[@item{Será que todas a funções tiveram sua assinatura escritas corretamente?}
                                                     @item{Será que cada função tem uma declaração de propósito que descreve com precisão o que ela faz?}
                                                     @item{Será que cada função tem pelo menos dois exemplos?}
                                                     @item{Quando você clicar em "Run", todos os seus Exemplos irão passar no teste?}
                                                     ]}
                                }
                        @teacher{@management{@itemlist[@item{Peça aos alunos o que eles aprenderam nesta lição}
                                                       @item{Comportamentos que você valoriza: trabalho em equipe, fazendo anotações, engajamento, etc}
                                                       @item{Dê os recados de saída, despense-os e coloque o local em ordem.}]}}
                        }
                        ]}
 }