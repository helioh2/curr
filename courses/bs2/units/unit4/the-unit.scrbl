#lang curr/lib

@title{Unidade 4: Bem vindo ao Mundo}
@declare-tags[management]

@unit-overview/auto[#:lang-table (list (list "Numero" @code{+ - * / sq sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Figura"  @code{rectangle circle triangle ellipse star text scale rotate put-image})
                                       (list "Carro" @code{make-carro carro-modelo carro-potencia carro-rodas carro-cor carro-valor})
                                       (list "Festa" @code{make-festa festa-tema festa-local festa-convidados}))]{
@unit-descr{Alunos retornam ao jogo Mundo Ninja, e caminham através das funções 'atualiza-mundo' e 'desenha-mundo'. fazendo pequenas mudanças nessas funções, elas são 
            capazes de modificar a velocidade do cão, adicionar nuvens paradas, etc. Elas então modificam o mundo para incluir a coordenada-x do rubi, e sistematicamente atualizar cada função no
            código fonte para acomodar este novo mundo. Se o tempo permitir, iterações adicionais são possíveis adicionando mais conjuntos de coordenadas no Mundo(World).
Alunos trabalham em seus jogos, e derivam a estrutura mundo de seus jogos.}
}
@unit-lessons{
@lesson/studteach[#:title "Revisão"
        #:duration "5 minutos"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{Lápis/canetas aos alunos, e giz/marcadores de quadro branco aos professores}
                            @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                            @item{Ambiente de Edição (WeScheme ou DrRacket com o pacote bootstrap-teachpack instalado)}
                            @item{Tabela da Linguagem(veja abaixo)}]
     #:preparation @itemlist[@item{Arranjos de assento: preferencialmente aglomerando as mesas}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Você teve muita prática sobre structs nas últimas lições, então agora é hora de um desafio. 
                                @activity{Vá para @worksheet-link[#:page 19 #:name "Intro-unit4"] em sua apostila. Preencha os espaços em branco com a  
                                                  informação que você sabe sobre as estruturas @code{carro}, @code{festa}, e @code{mundo}.}}
                        @teacher{Refresque a memória dos alunos sobre Structs que eles já viram, como preparação para definirem suas próprias.}}
                 ]
         }
@lesson/studteach[#:title "Caminhando pelo código"
        #:duration "20 minutos"
        #:overview ""
        #:learning-objectives @itemlist[@item{Aprofundar sua compreensão sobre estruturas, construtores e acessadores introduzindo uma terceira estrutura de dados.}
                                        @item{Descubra a implementação do Racket para eventos baseados em pequenos mundos, que usam eventos para modificarem o mundo.}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{O arquivo do Mundo Ninja World 2 [NW2.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @editor-link[#:public-id "Rd1zUYP70f" "WeScheme"] pré-carregado nas máquinas dos alunos}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity{Abra o @editor-link[#:public-id "Rd1zUYP70f" "Mundo Ninja 2"] e clique em "Run". 
                                          O que acontece? Será que ele faz a mesma coisa como na simulação da unidade passada?}
                                
                                 Vamos caminhar pelo código e descobrir o que está errado. No início da tela, você vê a seção @code{;; DADOS}. 
                                 Aqui é onde definimos tudo o que precisamos acompanhar durante a animação. Como você pode ver, 
                                 @code{define-struct} é usada para definir a estrutura Mundo aqui.
                                 @activity{@itemlist[@item{O que está na estrutura mundo?}
                                                      @item{Dê uma olhada na seção nomeada como @code{;; INICIANDO MUNDO}. Qual é o nome da 
                                                            primeira variável definida aqui?}
                                                      @item{Que tipo de coisa ela é?}
                                                      @item{Como você conseguiria @code{caoX} do @code{INICIO}?}
                                                      @item{Como no último Mundo Ninja, se o Cachorro está se movendo dez pixels para a direita de cada vez, 
                                                            o que o mundo deveria ser no próximo momento?}
                                                      @item{Abaixo do mundo @code{INICIO}, defina outro mundo chamado @code{PROXIMO}. Qual seria
                                                            o valor de @code{caoX} nesse @code{PROXIMO} mundo?}]}
                                 
                                 Há também alguns valores para as figuras, definidas logo abaixo, que serão usadas no jogo. Elas são  
                                 imagens do que? 
                                 @activity{Digite seus nomes na janela de Interações e descubra.}}
                        @teacher{Estruturas mundo serão usadas para definir todo valor que @italic{muda} dentro do mundo do jogo. No momento, o 
                                 jogo contém apenas uma coisa se modificando, a posição x do cachorro.}}
                 
                 @point{@student{Agora que temos uma estrutura mundo, precisamos saber como desenhá-la.
                                 @activity{Desça até você ver @code{;; FUNCOES GRAFICAS}. Qual é o nome da função? Qual seu 
                                          Domínio? E sua Imagem?}
                                 Como na última lição a função @code{desenha-mundo} está usando a função @code{put-image} para colocar o @code{CACHORRO}(perigo) sobre o
                                 @code{CENARIO} em algumas coordenadas. @activity{Algo está usando a coordenada-x do cachorro? E a 
                                                                                  coordenada-y do cachorro?}}
                         @teacher{}}
                 @point{@student{Pense um momento sobre como o "jogo" Mundo Ninja funcionava na lição anterior. Em cada "tick"
                                 @code{desenha-mundo} pegava o mundo atual e extraía a @code{caoX} antes de usá-la para desenhar o cachorro.
                                 Mas essa função @code{desenha-mundo} nunca olha para o mundo atual! Se a função não está 
                                 olhando para o que o mundo tem dentro dele, então não tem como mudar a posição do cachorro.
                                 @activity{@itemlist[@item{Como você conseguiria pegar o valor de @code{caoX} do mundo?}
                                                      @item{Qual mundo está sendo usado? (Qual mundo @code{atualiza-mundo} está recebendo?)}
                                                      @item{@code{(mundo-caoX m)}}
                                                      @item{Agora onde você precisa colocar este @code{(mundo-caoX m)}? Qual número representa aqui a
                                                            coordenada-x do @code{PERIGO} sobre o @code{CENARIO}?}]}}
                         @teacher{Essa função @code{desenha-mundo} está sempre desenhando o cachorro em (0, 400) na tela. Mesmo o mundo sendo 
                                  atualizado e repassado para @code{desenha-mundo}, os alunos devem entender que a menos que a figura do cachorro seja 
                                  desenhada na coordenada-x ATUALIZADA de (@code{caoX}), o jogo não ficará animado.}}
                 
                 @point{@student{Supondo que queremos adicionar a imagem de uma @code{NUVEM} no jogo na posição (500, 400). Como você poderia usar
                                 @code{put-image} para colocá-la no @code{CENARIO}?
@code[#:multi-line #t]{;; desenha-mundo: mundo -> Figura
;; coloque o PERIGO sobre o CENARIO nas seguintes coordenadas
(define (desenha-mundo m)
  (put-image NUVEM 
               500 400
               (put-image PERIGO
                            (mundo-caoX m) 200
                             CENARIO)))}
@bitmap{images/NWorld2.png}
}                                                   
                         @teacher{Esta é a primeira vez que eles estão usando @code{put-image}, escreva o código com as crianças. Eles terão 
                                  tempo para praticar por conta própria mais tarde. Evidencia o padrão "escadas" que desenvolvemos quando você coloca figuras
                                  sobre outra. Uma vez que eles colocarem a figura sobre a cenário, pqça que cliquem em "Run" e 
                                  dê uma olhada na nuvem!}}
                 
                 @point{@student{Agora desça até você ver @code{;; FUNÇÕES ATUALIZADORAS}. Esse código é responsável pelas mudanças no Mundo.
                                  @activity{@itemlist[@item{O que @code{atualiza-mundo} Faz com o mundo?}
                                                       @item{@code{atualiza-mundo} fará um novo mundo e adicionará 10 ao @code{caoX} daquele mundo.
                                                              Como isso fará com que o cão se mova? Ele vai para a direita, para a esquerda, para cima, para baixo?}
                                                       @item{Se o cachorro está na posição 100, onde ele estará na próxima posição? E depois?}
                                                       @item{Como você poderia fazer o cachorro de mover mais rápido? Mais devagar? Andar para trás?}
                                                       @item{Escreva dois @vocab{exemplos} para @code{atualiza-mundo}, usando a mundo @code{INICIO} e o 
                                                                       mundo @code{PROXIMO} que você já definiu.}]}}
                         @teacher{Cada uma dessas três funções trabalham juntas para criar o jogo que os alunos vêem. @code{define-struct mundo} diz ao  
                                  computador o que mundo contém, @code{desenha-mundo} desenha as imagens sobre a tela, e @code{atualiza-mundo} muda o 
                                  mundo, de acordo com as regras do jogo. Mostre aos alunos que sem todas essas funções, o jogo não seria 
                                  jogável.}
                         }
                 ]
         }
@lesson/studteach[#:title "Estendendo o Mundo"
        #:duration "15 minutos"
        #:overview ""
        #:learning-objectives @itemlist[@item{Os alunos modificarão desenha-mundo para adicionar nuvens e um rubi}
                                         @item{Os alunos vão repetidamente expandir a estrutura Mundo, e rastrear essas mundanças ao longo de seu programa}]
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
        @points[@point{@student{Vamos fazer esse jogo mais interessante: 
                                @activity{Se você quiser desenhar o @code{ALVO} no mundo, nas coordenadas (500, 300), o que você 
                                                                    precisaria modificar?}
                                Se a @code{ALVO} não está se movendo, então nada de novo estará mudando no jogo, então não precisamos 
                                mudar a estrutura do mundo. A função @code{desenha-mundo} precisará mudar, se você quiser que 
                                o @code{ALVO} apareça no jogo.
                                @activity{Usando @code{put-image}, coloque a figura do @code{ALVO} sobre tudo o que você tem, 
                                          para que ela apareça quando você clicar em "Run".}
@code[#:multi-line #t]{;; desenha-mundo: mundo -> Figura
;; coloca o PERIGO sobre o CENARIO nas coordenadas abaixo
(define (desenha-mundo m)
  (put-image ALVO
             500 300
             (put-image NUVEM 
                        500 400
                       (put-image PERIGO
                                 (mundo-caoX m) 200
                                   CENARIO)))}}
                        @teacher{Essa seção exige que você percorra e modele cada uma das alterações no código, com os alunos
                                 acompanhando em seus próprios computadores. Você pode escrever o código no quadro ou use um projetor para mostrar o
                                 código, e use recortes do cão e do rubi para esboçar seus comportamentos.}}
                 
                 @point{@student{Agora, supondo que o @code{ALVO} está voando pela tela, movendo-se lentamente em 5 pixels por quadro. 
                                 A posição do rubi vai mudar, então desta vez o mundo precisa SER modificado.
                                 @activity{@itemlist[@item{O que especificamente está mudando sobre o rubi?}
                                                      @item{Como a estrutura mundo precisa ser modificada?}
                                                      @item{Qual seria um bom nome de variável para representar a coordenada-x do rubi? O que você acha de 
                                                            @code{rubiX}?}
                                                      @item{Como a assinatura para @code{make-mundo} mudou? Atualize-a na sua 
                                                                                     folha de assinaturas}
                                                      @item{Agora que a estrutura mundo inclui @code{rubiX}, qual nova função 
                                                            você tem acesso agora? Escreva em sua página de assinaturas.}]}
                                 @code{; mundo-rubiX :  mundo -> Numero}}
                         @teacher{}}
                 
                 @point{@student{Como a estrutura mundo está diferente agora, precisamos percorrer o código, linha-por-linha, e mudar todo
                                 @code{mundo} que encontrarmos. Olhe para a variável @code{INICIO} - ela usa @code{make-mundo}, que agora exige 
                                 duas entradas em seu Domínio. 
                                 @activity{@itemlist[@item{Qual deve ser a coordenada-x do rubi quando a simulação começar? Inclua 
                                                           esse número no mundo @code{INICIO}.}
                                                      @item{Agora mude a definição de @code{PROXIMO}. Não se esqueça de pensar sobre como 
                                                           a coordenada-x do rubi será modificada do mundo @code{INICIO} para o @code{PROXIMO} mundo}
                                                      @item{As definições de Figuras precisam mudar? Por que não?}
                                                      @item{E quanto a @code{desenha-mundo}? Sua assinatura muda? A assinatura diz que 
                                                            ela recebe um Mundo em seu Domínio, e ainda faz isso. A única coisa que mudou 
                                                            é @italic{o que o mundo contém}. @code{desenha-mundo} ainda produz uma Figura?}
                                                      @item{O que precisa mudar sobre o corpo da @code{desenha-mundo}? Até agora o rubi foi 
                                                            desenhado nas coordenadas (500, 300) o tempo todo, mas nós queremos a posição (ou seja, sua 
                                                            coordenada-x) mude. Como você consegue obter o @code{rubiX} para fora do mundo? Coloque a
                                                            figura do ALVO naquela coordenada-x.}]}
@code[#:multi-line #t]{(define (desenha-mundo m)
                               (put-image ALVO
                                          (mundo-rubiX m) 300
                                          (put-image NUVEM ....)))}}
                         @teacher{}}
                 
                 @point{@student{E quanto a @code{atualiza-mundo}? Sua assinatura muda agora que a estrutura mundo está diferente? Por quê ou por que 
                                 não? @activity{Livre-se completamente do corpo da função @code{atualiza-mundo}, por que muita coisa precisa mudar 
                                                aqui. Não apague a Assinatura - não vamos modificar o Domínio ou a Imagem da função!}
                                 Novamente, a assinatura lhe diz MUITO sobre como escrever a função. Aqui vai uma dica: se a imagem é 
                                 um Mundo, você sabe que terá que fazer um mundo em algum momento. @activity{Como você faz um mundo?}}
                         @teacher{}}
                 @point{@student{No momento que você for escrever @code{make-mundo}, seus instintos devem apontar para algo: Todo mundo contém um @code{caoX}
                                 e um @code{rubiX}, então você pode escrevê-los automaticamente.
                                 Agora você pode se pergunar: O que acontece com @code{caoX}? No jogo, o cão ainda estará se movendo para a direita em 
                                 10 pixels. 
                                 @activity{@itemlist[@item{Como você atualizaria a posição-x do cao? Como você obtém um @code{caoX} de algum mundo?}
                                                      @item{Como você adicionaria dez a ele?}
                                                      @item{Nós dissemos que queremos que o rubi se mova para a esquerda em 5 pixels de velocidade. Como você obtém @code{rubiX} 
                                                            de algum mundo?}
                                                      @item{Se ele está se movendo para a esquerda, você adiciona ou subtrai de sua posição?}
                                                      @item{De qual mundo você está obtendo @code{caoX} e @code{rubiX}?}
                                                      @item{Os exemplos de @code{atualiza-mundo} precisam mudar?}
                                                      @item{Olhe para o primeiro exemplo: Quantas coisas estão sendo passadas para @code{make-mundo}? Quantas 
                                                            deveriam estar ali? Dica: olhe no domínio.}
                                                      @item{A coordenada-x do rubi precisa ser adicionada. Onde o rubi começa no mundo @code{INICIO}? 
                                                            Se ele for 5 pixels para a esquerda, onde ele deveria estar no final do primeiro exemplo?}
                                                      @item{Ajuste o segundo exemplo do mesmo modo, adicionando a coordenada-x do rubi.}]}
                                 }          
                         @teacher{Toda vez que o mundo (ou @italic{qualquer} struct) mudar, cada instância de @code{make-mundo} (ou @code{make-carro},
                                  @code{make-festa}, etc.) precisará mudar para refletir isso. Peça aos alunos para encontrarem uma instância de @code{make-mundo} e 
                                  incorporem o @code{rubiX} dentro do novo mundo. Toda vez que adicionar algo novo em seu jogo, eles precisam fazer 
                                  a mesma coisa, então certifique-se de que eles compreendam que cada mudança na estrutura mundo requer uma leitura atenciosa 
                                  e editar suas funções mundo.}}
                         ]
         }

@lesson/studteach[#:title "Game Brainstorming"
        #:duration "15 minutos"
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
        @points[@point{@student{Você esteve trabalhando com estruturas nas últimas lições, e você tornou-se realmente bom em definir, construir e 
                                accessá-las. Agora, você irá definir a estrutura Mundo para o SEU JOGO! 
                                @activity{Supondo que fosse um jogo de corrida, onde meu personagem está na parte de baixo da tela, dentro de seu carro. Na frente 
                                          dele, vejo duas estradas, com carros indo e vindo. Para percorrer o caminho, eu preciso 
                                          mudar da faixa da esquerda para a direita da estrada. 
                                          @itemlist[@item{Quais são todas a coisas que eu preciso manter controle nesse jogo?}
                                                     @item{@code{JogadorX} - um número}
                                                     @item{@code{CarroY} - um número}
                                                     @item{@code{Carro2Y} (Se eu quiser outro carro) - um numero}
                                                     @item{@code{Pontos} - um numero}
                                                     @item{Como eu definiria esse mundo?}
                                                     @item{Como eu consigo o jogadorX do meu mundo? Meu CarroY? Meu Carro2Y? Os Pontos?}
                                                     @item{E se eu quisesse que o carro do jogador mudasse de cor á medida que os pontos sobem? Como minha estrutura mundo 
                                                           precisa mudar?}
                                                     @item{Agora pense sobre o SEU jogo - o que estaria @italic{mudando} em seu mundo?}]}} 
                                                                                                                                        
                  @teacher{Certifique-se que eles estão colaborando com seu parceiro(s) para chegarem a um jogo que ambos fiquem felizes. Certifique-se de 
                           forcá-los a pensar em suas estruturas mundo, e começar simples: Limite sua estrutura mundo para não mais do que cinco
                           coisas nela, inicialmente. Passe algum palel de rascunho. Eles precisarão de um para mostrar suas ideias}}
                   ]
         }
                  
@lesson/studteach[#:title "Game Design!"
        #:duration "10 minutos"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{O Aluno definirá suas próprias estruturas Mundo}]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{É hora de começar a trabalhar no seu jogo!
           @activity{Vá para a @worksheet-link[#:page 20 #:name "Game Design 1"] em suas apostilas. Primeiramente, você vai desenhar um esboço a grosso modo de como seu
                             jogo deve se parecer quando o usuario clicar em "Run".
           @itemlist[@item{Mantenha sua estrutura @code{mundo} limitada a cinco coisas ou menos para iniciar - você pode adicionar mais coisas para fazê-lo mais complexo mais tarde.}
                     @item{Faça uma lista de todas as imagens que você precisará em seu jogo.}
                     @item{Faça uma lista de tudo o que muda em seu jogo - se algo se move, você precisará acompanhar sua
                           coordenada-x? Sua coordenada-y? As duas?}]}}
                        @teacher{Muitos alunos vão querer criar jogos ambiciosos no início, com muitos valores em sua estrutura mundo. Certifique-se de que comecem
                                 simples no iníco: Quando tiverem um jogo simples funcionando, eles podem adicionar mais elementos e recursos para torná-lo mais avançado.
                                 Cheque o trabalho deles: A estrutura mundo das duplas correspondem ao que está mudando em seu jogo?}}
                 ]
         }

@lesson/studteach[#:title "Definindo o Mundo"
        #:duration "20 minutos"
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
        @points[@point{@student{Agora que você tem uma lista de tudo o que muda, é o momento de transformá-la em um estrutura Mundo.
            @activity{Vá para a @worksheet-link[#:page 21 #:name "Game Design 2"] em sua apostila, e defina sua estrutura mundo. Quando tiver acabado, 
                              escreva todas as assinaturas que você precisa para trabalhar com suas estruturas. 
                              @itemlist[@item{Defina um mundo exemplo chamado INICIO, que é como o mundo deve se parecer em uma fração de segundo
                                              quando ele é iniciado. Escreva-o na parte de baixo da @worksheet-link[#:page 21 #:name "Game Design 2"].}]}}
                        @teacher{Revise a estrutura de cada equipe e certifique-se de que ele modele com precisão seu mundo. Não se esqueça de olhar suas 
                                 assinaturas, que devem incluir @code{make-mundo}, e funções de acesso para cada parte de sua estrutura mundo.}}
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
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Agora você tem os blocos básicos de construção de seu jogo e uma compreensão de como @code{desenha-mundo}, 
                               @code{atualiza-mundo}, e o @code{big-bang} trabalham juntos para criar uma animação no Racket. Na próxima lição você vai
                               usar sua estrutura mundo para escrever as funções @code{desenha-mundo} e @code{atualiza-mundo} do seu próprio jogo.}
                       @teacher{Peça à turma que revezem as duplas falando sobre seu jogo a todos: Quem é o jogador, qual será o perigo, o alvo, etc. 
                                Mais importante ainda, peça o que eles têm dentro da sua sua estrutura Mundo.
@itemlist[@item{Certifique-se que os nomes dos alunos estão na página 20}
                   @item{Pegue a página 20, ou tire fotos dela, para preparar as imagens do jogo para a próxima unidade.}
                   @item{Imagens devem ser em PNG ou GIF. As imagens de fundo devem ser 640x480, e as imagens do personagem devem geralmente ser 
                         menores que 200px em ambas as dimensões. Certifique-se que as imagens possuem fundo transparente!}
                   @item{DICA: use gifs animadas para os personagens - não é apenas a animação que faz o jogo parecer melhor, mas essas 
                         imagens geralmente têm fundos transparentes para começar a brincar.}]}
                       }
                 ]
         }
       }