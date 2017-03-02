#lang curr/lib
@declare-tags[management]

@title{Unidade 3: Iniciando com Definições}

@unit-overview/auto[#:lang-table (list (list "Número" @code{+ - * / sqr sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Figura"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]{
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
     #:materials @itemlist[@item{Lápis/canetas aos alunos, e giz/marcadores de quadro branco aos professores}
                            @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                            @item{Tabela da Linguagem(veja abaixo)}]
     #:preparation @itemlist[@item{OPCIONAL: Distribua a folha de @(hyperlink "https://docs.google.com/document/d/1tfT5qRjJsYoqUWiHOAUq-Qf3VGnhAmAiDY5zyiMRQ8I/edit?usp=sharing" "Atividade de Aquecimento").}]
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
     #:materials @itemlist[@item{Lápis/canetas aos alunos, e giz/marcadores de quadro branco aos professores}
                            @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                            @item{Ambiente de Edição (WeScheme ou DrRacket com o pacote bootstrap-teachpack instalado)}
                            @item{Tabela da Linguagem(veja abaixo)}]
     #:preparation @itemlist[]
     #:prerequisites (list "Intro to Programming" "Contracts")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
  @points[@point{@student{Supondo que queremos fazer uma imagem que tem 50 triângulos, sólidos e idênticos. Você teria que escrever 
                                @code{(triangle 50 "solid" "red")} cinquenta vezes! Para piorar a situação, qualquer alteração a esses triângulos 
                                teria que ser repetida a todos as cinquenta expressões! Bons programadores sabem que seu esforço é melhor gasto em 
                                outro lugar, então eles fizeram com que as linguagens de programação evitassem toda essa repetição. 
                                Eles escrevem algo uma vez, e definem um atalho na linguagem, e então usam esse atalho onde quiserem.}
                       @teacher{}}
                @point{@student{Nós nomeamos valores em nossa linguagem usando a declaração @vocab{define}. Vamos ver 
                               @editor-link[#:definitions-text "(define forma1 (triangle 50 \"solid\" \"red\"))\n"
                                                               #:interactions-text ""
                                                               "um exemplo de uma definição"]
                               , que define @code{forma1} para ser um triângulo sólido vermelho. Quando você clicar em "Run", você pode digitar @code{forma1} 
                               na Janela de Interações e o computador mostrará a você um triângulo vermelho. O que você pensa que aconteceria se você 
                               digitasse @code{forma1} @italic{sem clicar} em "Run"?
                               }
                        @teacher{Certifique-se que os alunos vejam o que acontece quando @code{forma1} é executada sem clicar primeiro em "Run", para que 
                                 eles possam ler e entender o erro. Da mesma forma, peça para modificarem a definição e calcular @code{forma1} 
                                 novamente - ainda sem clicar em "Run". É importante para eles entenderem que executar um programa 
                                 faz com que o computador @italic{leia as definições}, e que qualquer mudança exige que o computador leia novamente o códigp.
                                 }
                        }
                @point{@student{Definições vão na parte esquerda da tela(ao lado da Janela 
                               de Interações); que é chamada de @vocab{Janela de Definições}.        
                               @activity[#:forevidence (list "BS-PL.3&1&1")]{
                                     @itemlist[@item{Digite a definição de @code{forma1} na @vocab{Janela de Definições}.}
                                                @item{Clique "Run" para que o computador leia a definição.}
                                                @item{O que você pensa que vai acontecer quando você digita @code{forma1} na Janela de Interações?}
                                                @item{Adicione uma nova linha na janela de definições, logo abaixo da definição de @code{forma1}. Adicione uma nova 
                                                      definição chamada @code{forma2}, e defina para ser um círculo sólido azul, de tamanho de raio 20.}
                                                @item{Clique "Run", e tente calcular @code{forma2}.}
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
                                    @itemlist[@item{Vá para a Janela de Interações e tente calcular @code{cor-dos-olhos}. Você deve receber uma mensagem de
                                                    erro que o computador não sabe sobre @code{cor-dos-olhos}, porque você não clicou em "Run" 
                                                    depois de adicionar a definição.}
                                              @item{Clique em "Run".}
                                              @item{Digite @code{cor-dos-olhos} novamente na janela de Interações. Desta vez você não deve receber uma mensagem de erro.}]}
                                 Definiçẽs são úteis porque podemos reutilizá-las em outras expressões. Por exemplo, podemos usar @code{cor-dos-olhos} 
                                 dentro de outra expressão, como em @code{(circle 10 "solid" cor-dos-olhos)}. Vamos praticar usando as definições dentro de outras expressões.
                                 }
                        @teacher{}
                        }
                @point{@student{@activity[#:forevidence (list "BS-PL.3&1&1" "BS-IDE&1&1")]{
                                    Crie as definições a seguir na Janela de Definições, e verifique-as na Janela de Interações: 
                                    @itemlist[@item{Defina um valor chamado @code{premio} para ser uma estrela sólida amarela (você pode escolher o tamanho).}
                                              @item{Defina uma valor chamado @code{grande} que usa @code{scale} para fazer seu @code{premio} três vezes maior.}
                                              @item{Defina uma valor chamado @code{girar} que usa @code{rotate} para girar sua grande estrela amarela por @code{45} graus.}
                                              @item{Digite @code{girar} na Janela de Interações, e certifique-se de obter uma grande e inclinada estrela amarela.}
                                              @item{Acontece que as estrelas verdes são mais populares em prêmios que as amarelas. Altere a definição de seu @code{premio} para fazer a estrela verde ao invés da amarela. Clique "Run" para que o computador leia sua nova definição.}
                                              @item{Agora digite @code{girar} na janela de Interações novamente. De que cor a estrela apareceu? Se você definiu as expressões @code{grande} e @code{girar} para usar suas definições, você deve conseguir uma estrela verde inclinada! Se você não conseguiu uma estrela verde, tente consertar suas definições para fazer isso acontecer.}
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
     #:title "Definindo Variáveis (Álgebra)"
     #:duration "10 minutos"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "7.EE.3-4" "A-SSE.1-2")
     #:materials @itemlist[@item{"Transformando Álgebra" [@resource-link[#:path "source-files/Algebra.rkt" #:label "DrRacket"] | @(hyperlink "http://www.wescheme.org/openEditor?publicId=BtkXTYFjmg" "WeScheme")] pré-carregadas nas máquinas dos alunos, com os monitores desligados.}]
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
                                       @itemlist[@item{@math{dolares = 16.50}}
                                                 @item{@math{pes = 2 \times 3}}
                                                  @item{@math{polegadas = pes \times 12}}]
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
     #:materials @itemlist[@item{@resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "Apostila"] do aluno com seu nome na capa.}]
     #:preparation @itemlist[@item{Crie os arquivos de jogo dos alunos. [Veja o (apenas professores)@resource-link[#:path "teachers/teachers-guide/teachers-guide.html" #:label "Teachers Guide"]]}
                              @item{Nas máquinas dos alunos: Arquivos de Jogo dos Alunos (gerados do modelo "Jogo" [Game.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/openEditor?publicId=BvAQt3naEh" "WeScheme")])}]
     #:prerequisites (list "Defining Values" "Strings and Images" "Brainstorming")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity{Abra os arquivos do jogo(Game.rkt de @resource-link[#:path "source-files.zip" #:label "source-files.zip"]
                                          ou @editor-link[#:public-id "BvAQt3naEh" "o modelo online"] de modo que você pode ver o código,
                                          e clique "Run". (Talvez você precise esperar alguns segundos para carregar as imagens!) A janela que 
                                          surgiu está executando o jogo, mas você provavelmente já percebeu que nada se move - mesmo se você 
                                          apertar as setas "para cima" ou "para baixo". Por enquanto, clique no botão "fechar" e volte para o código.}
                                 Este arquivo contém uma lista de definição, onde você você vai começar a definir como seus personagens se parecem, movem, e interagem. Descendo o código, você verá um monte de
                                 definições falsas que foram preenchidas. E é aqui que @italic{você} colocará as definições do seu próprio jogo!
                                 @activity{Role para a parte inferior da tela, lendo cada uma das coisas que você terá que definir. Pare quando chegar ao fim, onde você vê 
                                           @code{(make_game...)} usado como parte de uma definição. O que você percebe sobre os valores passados para @code{make_game}?}
                                 @code{make_game} é uma função que foi dada a você, ela recebe todas as suas definições e ás monta na execução do jogo. Por trás de tudo isso, @code{make_game} 
                                 insere suas definições dentro de uma função gigante que é chamada a cada décimo de segundo, e usa suas definições para decidir o que está acontecendo naquele momento.}
                        @teacher{Você pode lembrar eles que Bootstrap:2 irá mostrar-lhes como escrever esta função, e personalizá-la para criar jogos mais avançados (multiplayer, labirinto, etc).}
                        }
                 @point{@student{Na janela de Definições, você verá que este programa define vários valores: @code{TITULO}, por exemplo, está definido para ser a String @code{"Meu Jogo"}.
                                @activity[#:forevidence (list "BS-PL.3&1&1")]{@itemlist[@item{Se você digitar @code{TITULO} na janela de Interações, o que você acha que o computador responderá?}
                                           @item{Quais outras definições você pode ver?}
                                           @item{Quais são seus valores?}
                                           @item{Quais são seus tipos?}
                                           @item{Tente calcular cada um desses valores na janela de Interações, começando com @code{CENARIO}}]}
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
                 @point{@student{Se você quer mudar suas definições para que a imagem fique maior ou menor, você pode usar a função @code{scale}:
                                  @code[#:multi-line #t]{; scale : Numero Figura -> Figura}
                                  Esta função redimensiona a @code{Figura} com base no @code{Numero}. Por exemplo, @code{(scale 10 (triangle 5 "solid" "green"))} fará esse pequeno triângulo dez vezes maior, enquanto @code{(scale 0.5 (rectangle 200 100 "outline" "purple"))} vai diminuir o retângulo pela metade.
                                  @activity{Pratique usando @code{scale} para aumentar e diminuir diferentes figuras. Se você quiser experimentar com mais funções, tente usando as assinaturas abaixo:
                                                           @code[#:multi-line #t]{; flip-vertical : Figura -> Figura
                                                                                  ; flip-horizontal : Figura -> Figura
                                                                                  ; rotate : Numero Figura -> Figura}
                                                              @editor-link[#:interactions-text "(scale 3 (star 50 \"solid\" \"red\"))"
                                                                           "Tente praticar com este exemplo"]
                                                           }
                                  }
                         @teacher{Se algum aluno encontrar dificuldade, retorne aos Círculos de Avaliação e Assinaturas. Por exemplo, peça aos alunos primeiro desenharem um Círculo de avaliação para @code{rotate}, e deixe eles usarem a Assinatura para demonstrar o que são as entradas. Quando chegarem á segunda entrada(a @code{figura}), peça a eles que tipo de forma eles querem girar. Qualquer que tenha sido a resposta, deixe eles olharem na página de Assinaturas, e desenhe o Círculo de Avaliação @italic{dentro} do círculo do @code{rotate}. Depois que o círculo estiver correto, peça para converterem em código. Quando estiverem confiantes, você pode desafiá-los a aplicar outra operação para toda a expressão, talvez invertendo verticalmente a forma girada anterior.}
                         }
                 @point{@student{Outra definição do programa é o @code{CENARIO}. Esta expressão usa a função @code{put-image} para posicionar uma imagem sobre a outra, usando coordenadas para decidir o lugar de cada imagem. 
                         @activity{Propagandas de jogos geralmente têm imagens estáticas(chamadas @italic{screeenshots}) do jogo em ação, para as pessoas poderem ver como é jogar ele. Altere as coordenadas usadas na definição de @code{CENARIO} para que você tenha uma imagem do seu jogo. (Lembre-se: a tela tem 640 pixels-largura, por 480 pixels de altura!)}}
                         @teacher{Esta pode ser uma boa oportunidade para rever coordenadas, especialmente para alunos que precisarem de prática.}
                        }
                 @point{@student{Ser capaz de definir valores em uma linguagem de programação é uma ferramenta poderosa, que permite ao programador simplificar seu código e deixá-lo mais legível e fácil de fazer manutenção. }
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
     #:materials @itemlist[@item{@resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "Apostila"] do aluno com seu nome na capa.}]
     #:preparation @itemlist[]
     #:prerequisites (list "Contracts" "Stings and Images" )
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
                 ]{
                   @points[@point{@student{A definição de um @vocab{valor} é muito útil quando o programa tem muitas expressões idênticas. Porém, as vezes, um programa tem expressões que não são idênticas, mas são apenas @italic{muito parecidas}. Um programa que tem 50 triângulos verdes sólidos pode ser simplificado pela definição de um valor simples, @italic{desde sejam do mesmo tamanho}. Mas e se um programa tiver 50 triângulos verdes sólidos de tamanhos diferentes?}
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
                                             (chamando o nome da função e a entrada). O "aluno-função" respode "triangulo dez sólido verde", 
                                             para representar o trabalho que a função faz quando recebe uma entrada.}
                                    }
                            @point{@student{@bannerline{Passo 1: Escreva a Assinatura}
                                             O primeiro passo na definição de Funções é escrever sua @vocab{Assinatura}. Assinaturas resumem três partes 
                                             essenciais de informação sobre a função:
                                              @itemlist[@item{O @vocab{Nome} da função: neste caso, o nome dado é @code{tv}}
                                                         @item{O @vocab{Domínio} de uma função, é o tipo de dados que a função espera receber: neste caso, apena um Número.}
                                                         @item{A @vocab{Imagem} de uma função, é o tipo de dados que a função produz: neste caso uma Figura, pois é produzido triângulo verde sólido}]
                                              Aqui a Assinatura de @code{tv} escrita em código. A linha começa com ponto-e-vírgula(;), seguida do nome, dois-pontos(:), o Domínio, uma seta(->), e a Imagem:
                                              @code[#:multi-line ""]{; tv : Numero -> Figura}
                                              A descrição dos problemas dão várias pistas sobre o nome, Domínio, e Imagem de uma função. Leia o problema com atenção! Alguns problemas descrevem funções que recebem mais de uma entrada em seu Domínio, ou entradas de tipos diferentes.
                                              @activity[#:forevidence (list "BS-DR.1&1&1")]{
                                                              Abra sua apostila em @worksheet-link[#:name "Fast-Functions"], onde diz 
                                                              "funções rápidas", e escreva a Assinatura para a função @code{tv}.}}
                                    @teacher{Muitas vezes é uma boa ideia dar aos alunos diferentes prblemas escritos, e pedir-lhes que façam a 
                                             assinatura para cada um. @(new-paragraph) Assinaturas são escritas como @italic{comentários} no Racket: onde o Racket 
                                             ver um ponto-e-vírgula, ele ignora o resto da linha depois do ponto-e-vírgula. Isso significa que você nunca receberá uma 
                                             mensagem de erro do Racket por um comentário mal escrito. Isso também significa que você terá que checar as 
                                             assinaturas de seus alunos mais de perto, porque o computador não olhará nada sobre eles (formato ou conteúdo).}
                                    }
                            @point{@student{@bannerline{Passo 2: Dê Exemplos}
                                             É sempre uma boa ideia pensar em alguns exemplos antes de definir uma função. Exemplos mostram 
                                             o atalho que a função está tentando fornecer. Essa linguagem de programação fornece uma construção 
                                             especial, chamada @code{EXAMPLE}, que ajuda você a escrever como a função é usada, e o que ela 
                                             deve fazer. Você pode ver dois exemplos aqui, escritos abaixo da assinatura:
                                             @code[#:multi-line ""]{; tv : Numero -> Figura
                                                                    (EXAMPLE (tv   50) (triangle   50 "solid" "green"))
                                                                    (EXAMPLE (tv  100) (triangle  100 "solid" "green"))}
                                             Esses exemplos dizem ao computador que escrever @code{(tv 50)} deve produzir o mesmo resultado de
                                             @code{(triangle 50 "solid" "green")}, e que @code{(tv 100)} é equivalente a 
                                             @code{(triangle 100 "solid" "green")}. O problema descrito especifica que os exemplos @italic{devem} 
                                             usar o nome 'tv', e todos devem produzir triangulos verdes sólidos.
                                             @activity[#:forevidence (list "BS-PL.3&1&2" "BS-DR.2&1&1" "F-BF.1-2&1&1" "F-IF.1-3&1&2" "F-IF.1-3&1&4")]{
                                                       Em sua apostila, escreva dois exemplos por conta própria para esta função.}}
                                    @teacher{@bold{Certifique-se de exaltar que EXAMPLE é maiúsculo, e que todos os exemplos são escritos na janela de definições.} Muitos alunos seguirão aqui sem realmente entender, simplismente por correspondência de padrões. Certifique-se de fazer várias perguntas, para que justifiquem cada passo:
                                             @itemlist[@item{Por que o exemplo deve começar com tv? (Porque é o Nome da função, especificada na assinatura)}
                                                        @item{Como sabemos que @code{tv} precisa apenas de um número? (Porque está no Domínio da função, especificado na assinatura)}
                                                        @item{Como sabemos que temos que usar @code{triangle}? (Porque o problema nos diz qual forma deve ser produzida)}
                                                        @item{Como sabemos que o triângulo deve ser sólido e verde? (Porque a descrição do problema nos diz que forma deve ser produzida)}
                                                        @item{Como sabemos a ordem correta das entradas para @code{triangle}? (A assinatura de @code{triangle} nos conta isso)}] 
                                                                                                                                                                          Uma das grandes ideias aqui é que cada passo informa a etapa seguinte. Certifique-se de conectá-los explicitamente para os alunos, apontando que a Assinatura nos dá fortes dicas sobre como escrever cada parte dos exemplos. }
                                    }
                            @point{@student{Programadores muitas vezes escrevem vários exemplos para cada função. Exemplos são uma maneira do 
                                            programador de pensar através de seu trabalho. Exemplos também tornam fácil olhar para as partes da 
                                            expressão que podem mudar, ou @italic{variar}, dependendo das entradas.
                                    @activity[#:forevidence (list "BS-DR.2&1&3" "F-IF.1-3&1&2" "F-IF.1-3&1&4" "F-IF.4-6&1&1")]{
                                                  Escreva os seguintes exemplos no papel e cicule as partes dos exemplos que são diferentes entre si:
                                             @code[#:multi-line ""]{(EXAMPLE (tv   50) (triangle   50 "solid" "green"))
                                                                    (EXAMPLE (tv  100) (triangle  100 "solid" "green"))}}

                                    Uma vez que você sabe quais partes da expressão mudam, rotule e nomeie os círculos com um nome que descrevem seu conteúdo.
                                    Por exemplo, em nossos dois exemplos de @code{tv}, circulamos o @italic{tamanho} do triângulo. Suas expressões circuladas e 
                                    nomeadas devem se parecer com o seguinte diagrama: 
                                    @bannerline{@bitmap{images/circled-examples.png}}}
                            @teacher{Preste muita atenção nos círculos dos alunos: eles devem circundar algo em cada parte do Exemplo 
                                     (no uso da função à esquerda e na expressão à direita); eles devem usar também o mesmo nome para 
                                     o mesmo conceito através das expressões. Seus círculos vão corresponder com as variáveis em suas funções, 
                                     então as variáveis devem aparecer em ambos os lados, direito e esquerdo do Exemplo.}
                                    }
                            @point{@student{@bannerline{Passo 3: Defina a função}
                                             Depois de escrever a Assinatura, dois Exemplos, e nomear os círculos, definir a própria função é 
                                             relativamente simples.
                                             @itemlist[@item{Copie tudo que permanecer igual (tudo o que não foi circulado) em algum dos seus
                                                             Exemplos (no papel ou em seu editor)}
                                                       @item{No lugar de cada círculo, escreva o nome que você deu para este círculo}
                                                       @item{Troque @code{EXAMPLE} para @code{define}}]
                                             @code[#:multi-line ""]{; tv : Numero -> Figura
(EXAMPLE (tv   50) (triangle   50 "solid" "green"))
(EXAMPLE (tv  100) (triangle  100 "solid" "green"))
(define  (tv tamanho) (triangle tamanho "solid" "green"))}}
                                    @teacher{Essa pode ser uma boa oportunidade para apontar que as partes dos exemplos que eram mutáveis 
                                             (ou @italic{variáveis}) são o que determinam quando precisamos usar uma @italic{variável}.}
                                    }
                            @point{@student{@activity[#:forevidence (list "BS-PL.3&1&3" "BS-DR.3&1&1" "F-IF.1-3&1&2")]{
                                               @itemlist[@item{Em sua folha, defina a função @code{tv}, e então digite a @vocab{Assinatura}, @vocab{Exemplos} 
                                                               e a @code{Definição} na Janela de Definições.}
                                                         @item{Clique em "Run", para que o computador leia essa definição.}
                                                         @item{Use a função que você definiu, digitando @code{(tv 100)} na janela de Interações.}
                                                         @item{Experimente usar a função com diferentes Números}]}
                                    @editor-link[#:definitions-text "; tv : Numero -> Figura
(EXAMPLE (tv 50) (triangle 50 \"solid\" \"green\"))
(EXAMPLE (tv 95) (triangle 95 \"solid\" \"green\"))
(define (tv tamanoh) (triangle tamanho \"solid\" \"green\"))"
                                                 "Sua resposta deve ser algo parecido com isto."]
                                    }
                                    @teacher{}
                                    }
                            @point{@student{Esses passos são conhecidos como @vocab{Receita de Projeto}, que é uma poderosa ferramente para definir funções baseadas na descrição de problemas.
                                            @bannerline{Prática: Escreva uma função @code{ca}, que recebe um número e produz um círculo azul sólido, do tamanho dado.}
                                            @activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1" "F-IF.1-3&1&2" "F-IF.1-3&1&4" "F-IF.4-6&1&1")]{
                                                      Em sua apostila (ainda na @worksheet-link[#:name "Fast-Functions"]), preencha a @vocab{Assinatura} 
                                                      para essa função.
                                                      @itemlist[@item{Qual é o Nome dessa função?}
                                                                 @item{Qual é o Domínio dessa função?}
                                                                 @item{Qual é a Imagem dessa função?}]
                                                      Usando a Assinatura que você escreveu, escreva dois @vocab{Exemplos} para a função.
                                                      @itemlist[@item{Qual parte da Assinatura o ajuda a preencher o lado esquerdo de um Exemplo?}
                                                                 @item{Qual parte da Assinatura lhe diz o que a função precisa receber como entrada?}
                                                                 @item{Como a Imagem da função te ajuda a escrever um Exemplo?}]
                                                      Olhando para esses exemplos, circule as partes que são @italic{mutáveis}, e então rotule com um bom @vocab{nome de variável}.
                                                      @itemlist[@item{O nome de variável que você escolheu é o mesmo que você colocaou em @code{tv}? Por que ou por que não?}
                                                                 @item{Por que é útil escolher um nome de variável antes de definir a função?}]
                                                      Agora escreva a @vocab{definição da função}, usando os Exemplos que você já escreveu.}
                                            }
                                    @teacher{Você vai querer conectar explicitamente cada passo da Receita com o próximo passo. Peça aos alunos que justifiquem 
                                             cada aprte de sua @bold{Assinatura} referindo-se à Descrição do Problema, para justificada cada parte de seus 
                                             @bold{Exemplos} olhando para a Descrição do Problema @italic{e para} a Assinatura, e finalmente justificar cada parte 
                                             da @bold{definição} referenciando os Exemplos. O mesmo nome de variável pode ser usado em várias
                                             funções, assim como na matemática (onde muitas funções usam o @code{x} como nome de variável, por exemplo)}
                                    }
                            @point{@student{Pensando na Descrição do Problema passo-a-passo, chegamos em:
                                             @code[#:multi-line ""]{; ca : Numero -> Figura
(EXAMPLE (ca     16) (circle     16 "solid" "blue"))
(EXAMPLE (ca    421) (circle    421 "solid" "blue"))
(define  (ca raio) (circle raio "solid" "blue"))}
                                            }
                                    @teacher{}
                                    }
                             @point{@student{@bannerline{Prática: Escreva a função chamada @code{mancha}, que recebe uma Cor e produz um círculo sólido da cor recebida, com o raio de tamanho 20.}
                                            @activity[#:forevidence (list  "BS-DR.1&1&1" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1" "F-IF.1-3&1&2" "F-IF.1-3&1&4" "F-IF.4-6&1&1")]{
                                                    Em sua apostila (ainda na @worksheet-link[#:name "Fast-Functions"]), preencha a @vocab{Assinatura} para essa função.
                                                      @itemlist[@item{Qual é o Nome dessa função?}
                                                                 @item{Qual é o Domínio da função?}
                                                                 @item{Qual é a Imagem da função?}]
                                                      Usando a Assinatura que você escreveu, escreva dois @vocab{Exemplos} para a função, e então circule e nomeie as variáveis.
                                                      @itemlist[@item{Qual parte da Assinatura te ajuda a preencher o lado esquerdo de um Exemplo?}
                                                                 @item{Qual a parte da Assinatura que lhe diz o que a função precisa receber de entrada?}
                                                                 @item{Como a Imagem de uma função lhe ajuda a escrever o Exemplo?}
                                                                 @item{Qual seria um bom nome de variável para o que muda entre esses Exemplos?}]
                                                      Agora escreva a @vocab{definição da função}, usando os Exemplos que você já escreveu.}
                                            Pensando na Descrição do Problema passo-a-passo, chegamos em:
                                             @code[#:multi-line ""]{; mancha : String -> Figura
(EXAMPLE (mancha  "red") (circle 15 "solid"  "red"))
(EXAMPLE (mancha "blue") (circle 15 "solid" "blue"))
(define  (mancha  cor) (circle 15 "solid"  cor))}
                                            }
                                    @teacher{}
                                    }]
                    }


@lesson/studteach[
     #:title "Definindo Funções (Álgebra)"
     #:duration "20 minutos"
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
      ]{@points[@point{@student{Você tem visto muitas funções definidas no Racket, por exemplo: 
                                @code{(define (f x) (+ x 1))}
                        @activity[#:forevidence (list  "F-IF.1-3&1&2" "F-IF.1-3&1&4" "F-IF.4-6&1&1")]{@itemlist[@item{Qual é o nome desta função?}
                                             @item{Quantas variáveis ela recebe?}
                                             @item{Qual é o nome da(s) variável(is)?}
                                             @item{O que a função faz com a variável @code{x}?}
                                             @item{Defina a função @code{g}, que recebe uma variável @code{q} e multiplica ela por 20.}]}}
                        @teacher{Certifique-se que os alunos entenderam que a função é nomeada @italic{f}, e não "fx" ou "f de x". Peça que os alunos pratiquem outras definições de funções, para sentirem-se confortáveis transformando uma descrição verbal para a sintaxe do Racket.}
                        }
                 @point{@student{Para traduzir essas funções para álgebra, fazemos algo semelhante ao que fizemos com os valores. Aqui está a mesma função @code{f}, escrita na forma de álgebra: @math{f(x) = x + 1}                                                                                                      @activity{Traduza a função @code{g} para álgebra, usando a tradução de @code{f} como modelo. Quando estiver completa, experimente definir a função @math{h}, que recebe uma variável @code{x} e a divide por 2.}}
                         @teacher{Peça que os alunos pratiquem traduzindo algumas outras funções, traduzindo novamente de uma descrição verbal (em vez da sintaxe do Racket).}}
                 @point{@student{@activity{Traduza o restante das funções, listadas na @worksheet-link[#:page 35 #:name "Translating-to-Algebra"].}}
                         @teacher{}
                         }]
         }
                 
                 
@lesson/studteach[
     #:title "Encerramento"
     #:duration "5 minutos"
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
        @points[@point{@student{Nesta unidade você aprendeu como definir nomear valores e definir funções. Você usará esses valores nomeados para fornecer imagens para seus elementos do jogo. Você usará funções para fazer os elementos do jogo se moverem. Como você verá em breve, as funções são partes críticas para fazer jogos. Você vai fazer um pouco mais de prática com elas na próxima semana, incluindo escrever sua primeira função que faz algo se mover pela tela.}
                        @teacher{@management{@itemlist[@item{Peça aos alunos o que eles aprenderam nesta lição}
                                                        @item{Comportamentos que você valoriza: trabalho em equipe, fazendo anotações, engajamento, etc}
                                                        @item{Dê os recados de saída, despense-os e coloque em ordem.}]}}
                        }
                        ]}
}

