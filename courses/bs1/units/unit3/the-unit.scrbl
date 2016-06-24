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
     #:title "Definindo Variáveis (Algebra)"
     #:duration "10 minutos"
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
             @point{@student{Em nossa linguagem de programação, variáveis são definidas assim: 
                             @bannerline{@code[#:multi-line #t]{(define x 4)
                                                                (define y (+ 4 9))
                                                                (define z (* x 2))}}
                             
                             Valores podem ser fixos(como no primeiro exemplo), ou o resultado de uma expressão(o segundo), ou ainda ser definidas em termos de 
                             de outras variáveis(o terceiro). Nós podemois fazer as mesmas coisas em álgebra:
                             @bannerline{@math{x = 4}
                                          @math{y = 4+9}
                                          @math{z = x \times 2}}
                             @activity[#:forevidence (list "7.EE.3-4&1&4" "A-SSE.1-2&1&1")]{Convera as próximas três definições de Álgebra para definições no Racket:
                                       @itemlist[@item{@math{dólares = 16.50}}
                                                 @item{@math{pés = 2 \times 3}}
                                                  @item{@math{polegadas = pés \times 12}}]
                                       }}
                     @teacher{Para esta atividade escreva todas as expressões em Racket em um lado do quadro, e todas de álgebra do outro.
                              Tente deixar as definições de uma maneira próxima uma da outra, para reforçar a ligação entre as duas linguagens.}
                     }
            @point{@student{@activity{Vá para @worksheet-link[#:page 35 #:name "Translating-to-Algebra"] página 35 em sua apostila. 
                                      Você verá um monte de valores definidos em código - você tem 2 minutos para converter isso em matemática. VAI!}}
                    @teacher{}
                    }]
         }
     
@lesson/studteach[
     #:title "Imagens do Jogo"
     #:duration "30 minutos"
     #:overview "Os alunos definem valores em seu jogo"
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Alunos dão nome aos seus projetos de Jogo}
                                  @item{Alunos modificarão as definições para @code{TITULO, TITULO-COR, CENARIO, JOGADOR, ALVO} e @code{PERIGO}}]
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
        @points[@point{@student{@activity{Abra os arquivos do jogo(Game.rkt de @resource-link[#:path "source-files.zip" #:label "source-files.zip"]
                                          ou @editor-link[#:public-id "Q1X9Y8ZayX" "o modelo online"] de modo que você pode ver o código,
                                          e clique "Run". (Talvez vocẽ precise esperar alguns segundo para carregar as imagens!) A janela que 
                                          surgiu está executando o jogo, mas você provavelmente ja percebeu que nada se move - mesmo se você 
                                          apertar as setas "para cima" ou "para baixo". Por enquanto, clique no botão "fechar" e volte para o código.}
                                 Este arquivo contém uma lista de definição, onde você você vai começar a definir como seus personagens se parece, movem, e interagem. Descendo o código, você verá um monte de
                                 definições falsas que foram preeenchidas. E é aqui que @italic{você} colocará as definições do seu próprio jogo!
                                 @activity{Role para a parte inferior da tela, lendo cada uma das coisas que vocẽ terá que definir. Pare quando chegar ao fim, onde você vê 
                                           @code{(make_game...)} usado como parte de uma definição. O que você percebe sobre os valores passados para @code{make_game}?}
                                 @code{make_game} é uma função que foi dada a você, ela recebe todas as suas definições e às monta na execução do jogo. Por trás de tudo isso, @code{make_game} 
                                 insere suas definições dentro de uma função gigante que é chamada a cada décimo de segundo, e usa suas definições para decidir o que está acontecendo naquele momento.}
                        @teacher{Você pode lembrar eles que Bootstrap:2 irá mostrar-lhes como escrever esta função, e personalizá-la para criar jogos mais avançados (multiplayer, labirinto, etc).}
                        }
                 @point{@student{Na janela de Definições, vocẽ verá que este programa define vários valores: @code{TITULO}, por exemplo, está definido para ser a String @code{"Meu Jogo"}.
                                @activity[#:forevidence (list "BS-PL.3&1&1")]{@itemlist[@item{Se você digitar @code{TITULO} na janela de Iterações, o que você acha que o computador respondera?}
                                           @item{Quais outras definições você pode ver?}
                                           @item{Quais são seus valores?}
                                           @item{Quais são seus tipos?}
                                           @item{Tente calcular cada um desses valores na janela de Iterações, começando com @code{CENARIO}}]}
                                }
                        @teacher{@management{Até agora, você deve ter gráficos criados e 
                                             @(hyperlink "../../resources/teachers/teachers-guide/teachers-guide.html#addingimages" "adicionados ao arquivo)").}
                                  O objetivos desta atividade é aumentar a confiança dos alunos na @italic{leitura} e na @italic{fala} sobre código. 
                                  Certifique-se dos alunos terem bastante prática em falar alto(sobre código), entre si e com o intrutor.}
                        }
                 @point{@student{Se você não gostou das definições fornecidas aqui, você pode mudá-las! Você pode modificar o @code{TITULO} e @code{TITULO-COR} 
                                    para alterar o que é mostrado no topo da tela, e você pode mudar as definições para as imagens do seu jogo também: 
                                    @(video-link (hyperlink "http://www.teachertube.com/viewVideo.php?video_id=288261" "Video: Um passo a passo desta parte - para ver como mudar imagens de seu jogo")).}
                         @teacher{Imagens devem ser no formato PNG ou GIF. A imagem de fundo deve ser 640x480, e imagens de personagens geralmente 
                                   não muito mais que 200x200px. Certifique-se que as imagens dos personagens tenham o fundo transparente! 
                                   DICA:use GIFs animados para os personagens - não só a animação faz o jogo parecer bonito, mas essas 
                                   imagens geralmente possuem fundos transparentes para começar. Para mais instruções sobre como configurar os arquivos do jogo e 
                                   imagens, leia o @(hyperlink "../../resources/teachers/teachers-guide/teachers-guide.html#addingimages" "Guia do Professor") 
                                   para este curso.}
                         }
                 @point{@student{Se você quer mudar suas definições para que a imagem fique maior ou menos, você pode usar a função @code{scale}:
                                  @code[#:multi-line #t]{; scale : Numero Figura -> Figura}
                                  Esta função redimensiona a @code{Figura} com base no @code{Numero}. Por exemplo, @code{(scale 10 (triangle 5 "solid" "green"))} fará esse pequeno triângulo dez vezes maior, enquanto @code{(scale 0.5 (rectangle 200 100 "outline" "purple"))} vai diminuir o retângulo pela metade.
                                  @activity{Pratiquee usando @code{scale} paa aumentar e diminuir diferentes figuras. Se você quizer experimentar com mais funções, tente usando as assinaturas abaixo:
                                                           @code[#:multi-line #t]{; flip-vertical : Figura -> Figura
                                                                                  ; flip-horizontal : Figura -> Figura
                                                                                  ; rotate : Numero Figura -> Figura}
                                                              @editor-link[#:interactions-text "(scale 3 (star 50 \"solid\" \"red\"))"
                                                                           "Tente praticar com este exemplo"]
                                                           }
                                  }
                         @teacher{Se algum aluno encontrar dificuldade, retorne aos Círculos de Avaliação e Assianturas. Por exemplo, peça aos alunos primeiro desenha um Círculo de avaliação para @code{rotate}, e deixe eles usarem a Assinatura para demonstrar o que são as entradas. Quando ele chegar á segunda entrada(a @code{figura}), peça a eles que tipo de forma eles querem girar. Qualquer que tenha sido a resposta, deixe eles olharem na página de Assinaturas, e desenhe o Círculo de Avaliação @italic{dentro} do círculo do @code{rotate}. Depois que o círculo estiver correto, peça para converterem em código. Quando estiverem confiantes, você pode desafiá-los a aplicar outra operação para toda a expressão, talvez invertendo verticalmente a forma girada anterior.}
                         }
                 @point{@student{Outra definição do programa é o @code{CENARIO}. Esta expressão usa a função @code{put-image} para posicionar uma imagem sobre a outra, usando coordenadas para decidir o lugar de cada imagem. 
                         @activity{Propagandas de jogos geralmente têm imagens estáticas(chamadas @italic{screeenshots}) do jogo em ação, para as pessoas poderem ver como é jogar ele. Altere as coordenadas usadas na definição de @code{CENARIO} para que você tenha uma imagem do seu jogo. (Lembre-se:a tela é 640 pixels-largura, por 480 pixels de altura!)}}
                         @teacher{Esta pode ser uma boa oportunidade para rever coordenadas, especialmente para alunos que precisarem de prática.}
                        }
                 @point{@student{Ser capaz de deinir valores em uma linguagem de programação é uma ferramenta poderosa, que permite ao programador simplificar seu código e deixá-lo mais legível e fácil de fazer manutenção. }
                         @teacher{}
                         }
             ]
         }
       
@lesson/studteach[
     #:title "Definindo Funções"
     #:duration "20 minutos"
     #:overview "Os alunos vão sentir um gostinho da Receita de Projeto, mas principalmente são introduzidos a sintaxe de definição de funções."
     #:learning-objectives @itemlist[@item{Alunos serão capazes de definir funções muito simples, para solucionar questões.}]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Alunos vão definir ao menos duas funções, usando a Receita de Projeto}]

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
                   @points[@point{@student{A definição de um @vocab{valor} é muito útil quando o programa tem muitas expressões idênticas. Porém, as vezes, um programa tem expressões que não são idênticas, mas são apenas @italic{muito parecidas}. Um programas que tem 50 triângulos verdes sólidos pode ser simplificado pela definição de um valor simples, @italic{desde sejam do mesmo tamanho}. Mas e se um programas tem 50 triângulos verdes sólidos de tamanhos diferentes?}
                                   @teacher{}
                                   }
                            @point{@student{Pense sobre funções com Figuras que você já usou, 
				           como @code{star} ou @code{circle}. Eles recebem entradas e produzem 
					   figuras. Da mesma maneira, podemos querer uma função triangulo-verde que 
					   recebe o Tamanho do triângulo como entrada, e produz um triângulo verde. 
					   A linguagem de programação não fornece esta função, 
					   mas nos permite definir nossas próprias funções. Nós queremos definir 
					   nossa própria função (vamos chamá-la de @code{tv}, iniciais de triangulo verde) que 
					   recebe como entrada um Número e produz um triângulo verde sólido do tamanho que nós queremos.
                                           @itemlist[@item{@code{(tv 10)} será um atalho para @code{(triangle 10 "solid" "green")}}
                                                     @item{@code{(tv 20)} será um atalho para @code{(triangle 20 "solid" "green")}}
                                                     @item{@code{(tv 1980)} será um atalho para @code{(triangle 1980 "solid" "green")}}
                                                     @item{@code{(tv 98)} será um atalho para @code{(triangle 98 "solid" "green")}}
                                                     @item{e assim por diante...}]
                                            Problemas que exigem uma definição podem ser formulados a partir de problemas como este abaixo:
                                            @bannerline{Defina uma função @code{tv}, que recebe um Número e produz um triângulo verde sólido do tamanho dado como entrada.}
                                            Felizmente, podemos seguir um passo a passo específico para definir funções de problemas escritos. Vamos trabalhar com etapas para 
                                            definir @code{tv}.
                                            }
                                    @teacher{Para fazer isto mais concreto, peça a um aluno para "agir" como tv. Para chamar a função, outro aluno diz "tv dez!" 
                                             (chamando o nome da função e a entrada). O "aluno-função" respode "triangulo dez solido verde", 
                                             para representar o trabalho que a função faz quando recebe uma entrada.}
                                    }
                            @point{@student{@bannerline{Passo 1: Escreva a Assinatura}
                                             O primeiro passo na definição de Funções é escrever sua @vocab{Assinatura}. Assinaturas resumem três partes 
                                             essenciais de informação sobre a função:
                                              @itemlist[@item{O @vocab{Nome} da função: neste caso, o nome dado é @code{tv}}
                                                         @item{O @vocab{Domínio} de uma função, é o tipo de dados que a função espera receber: neste caso, apena um Número.}
                                                         @item{A @vocab{Imagem} de uma função, é o tipo de dados que a função produz: neste caso uma Figura, pois é produzido triângulo verde sólido}]
                                              Aqui a Assinatura de @code{tv} escrita em código. A linha começa com ponto-e-vírgula(;), seguida do nome, dois-pontos(:), o Domínio, uma seta(->), e a Imagem:
                                              @code[#:multi-line ""]{; gt : Numero -> Figura}
                                              Problemas dão várias pistas sobre o nome, Domínio, e Imagem de uma Função. Leia o problema com atenção! Alguns problemas descrevem funções que recebem mais de uma entrada em seu Domínio, ou entradas de tipos diferentes.
                                              @activity[#:forevidence (list "BS-DR.1&1&1")]{
                                                              Abra sua apostila em @worksheet-link[#:name "Fast-Functions"], onde diz 
                                                              "funções rápidas", e escreva a Assinatura para a função @code{tv}.}}
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

