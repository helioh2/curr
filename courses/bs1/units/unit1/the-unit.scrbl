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
                              @itemlist[@item{Do que uma linguagem(idioma) é feita? Alguns alunos já falam mais de um idioma?}
                                         @item{Programação é muito parecido com idioma, possui sua própria sintaxe, semântica, etc}
                                         @item{Pergunte aos alunos sobre seus jogos de videogame favoritos. Abra a escola para um jogo de última geração: eles custão milhões de dólares e são construídos por grandes equipes de programadores e artistas, e são desenvolvidos ao longo de anos.}
                                         @item{Defina expectativas sobre o que pode ser feito em uma única aula de Introdução à programação.}]}
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
     #:materials @itemlist[@item{Ambiente de Edição (WeScheme ou DrRacket com o pacote bootstrap-teachpack instalado)}]
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
                 @teacher{[@(hyperlink "https://www.youtube.com/watch?v=KSt_3ovWfjk" "Video")] Mostre o Gato Ninja para as crianças, pode deixar elas jogarem ou demonstre para toda a turma ver. Você pode mover o gato para cima, baixo, direita e esquerda usando as setas direcionais do teclado. 
                          Jogue até os alunos verem todos os personagens (as nuvens, o rubi, o cão e o gato) e esteja 
                          certo de que observaram o título e a pontuação também.}
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
     #:materials @itemlist[@item{Recortes impressos das figuras ou apenas na tela do @resource-link[#:path "images/ninjacat.png" #:label "NinjaCat"],  @resource-link[#:path "images/dog.png" #:label "Cão"]
                                 and the  @resource-link[#:path "images/ruby.png" #:label "Rubi"]}
                            @item{Apostila dos alunos, ou algo para fazer anotações}]
     #:preparation @itemlist[@item{Apostila dos alunos, ou algo para fazer anotações}]
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
      @point{@student{@bitmap{images/number-line.png}Computadores usam numeros para representar a posição do personagem na tela, usando uma régua para medir 
                       a distância, colocando o zero no canto esquerdo inferior da tela. Para nosso jogo, temos uma "régua imaginária" da tela que vai do 0 
                       (na esquerda) até 640 (na direita). Podemos pegar a imagem do Cão, e por em qualquer lugar dessa linha, e medir a distância até a 
                       margem do lado esquerdo. Qualquer outra pessoa que sabe sobre nossa linha será capaz de duplicar a posição exata do Cão, sabendo apenas 
                       o número. Qual seria a coordenada do Cão para ele estar do lado direito da tela? E no Centro? Qual coordenada iria colocar o Cão para frente 
                       da margem esquerda da tela?}
              @teacher{Os pontos-chave para os alunos são @italic{precisão} e @italic{objetividade}. Existem muitas possíveis respostas corretas, mas eles 
                       devem entender porque uma solução deve ser precisa e clara. Isso exige deles, propor soluções que compartilham um "zero" comum 
                       (o ponto de partida de sua linha numérica) e a direção (literalmente, a direção em que a posição do personagem é medida, neste caso na horizontal).
                       @management{Deixe os alunos conversarem sobre isso. Se o tempo permitir, peça para um alunos deixar a sala e deixe os outros escreverem 
                                   onde o Caõ está no quadro. Então remova o Cão, e chame o aluno que saiu para voltar, e deixe a turma direcionar ele usando 
                                   apenas o que eles anotaram anteriormente. Tente posicionar os personagem em diferentes lugares da linha, os alunos lhe dizem quais 
                                   são as coordenadas. Experimente dar descrições verbais (Ex. "No centro da tela", "Além do lado direito da 
                                   tela", etc.) e peça a ele traduzir isso em coordenadas.}}
              }

      @point{@student{@bitmap{images/cat-coordinates.png}Adicionando uma segunda linha imaginária, podemos localizar um personagem em qualquer lugar da tela 
                       em qualquer dimensão. A primeira linha é chamada eixo-x, que corre da esquerda para a direita. A segunda linha, vai de cima para baixo, é 
     chamada de eixo-y. Uma @italic{coordenada} bidimensional é feita de uma localização nos eixos X e Y. Supondo que queremos 
                       localizar a posição do NinjaCat na tela. Podemos encontrar a coordenada-x colocando uma linha abaixo do Gato e pegamos 
                       a posição na linha numérica(régua). A coordenada-y é encontrada colocando uma linha no eixo-y.}
              @teacher{Uma coordenada representa um único ponto, e uma imagem (por definição) possui vários pontos. Alguns estudante perguntaram se a 
                       coordenada de um personagem se refere ao centro da imagem, ou um de seus cantos. Neste programa em particular, o centro 
                       servo como coordenada - mas outros programas podem usar outro local. O ponto importante na discussão com os alunos 
                       é que há muita flexibilidade aqui, @italic{contando que a convenção seja usada de forma consistente}. @management{Se o tempo permitir, 
                       convide alguns voluntários ao quadro para colocar o GatoNinja e o Rubi em locais diferentes. Peça aos alunos identificarem 
                       as coordenadas nas bordas da tela. Para prática adicional, peça aos alunos que traçem as linhas pela tela 
                       nomeiem os pontos de encontro.}}
              }
      @point{@student{Quando escrevemos coordenadas, sempre colocamos o x antes do y (igual no alfabeto!). Na maior parte do tempo, 
                      você verá coordenadas escritas assim: (200, 50) significando que a coordenada-x é 200 e a coordenada-y é 50.}
              @teacher{}
              }

      @point{@student{Dependendo de como o personagem se move, sua posição pode mudar apenas no eixo-x, apenas no eixo-y, ou nos dois. Olhe 
                      novamente na tebela que você completou em sua apostila (@worksheet-link[#:name "NinjaCat-Dissection"]). 
                      O GatoNinja pode se mover para cima e para baixo no jogo? Ele pode se mover para a direita e esquerda? Então o que está mudando: Sua coordenada-x, sua coordenada-y, 
                      ou as duas? E quanto as nuvens? Elas se movem para cima e para baixo? Direita e Esquerda? Todos os movimentos?}
              @teacher{}
              }
      
      @point{@student{@activity[#:forevidence (list "N-Q&1&4" "5.G.1-2&1&1" "5.G.1-2&1&2")]{
                          @bitmap{images/game-table3.png}Preencha o restante de sua tabela, identificando o que muda em cada um dos seus personagens.}
                       }
              @teacher{}
              }
      
      @point{@student{@activity[#:forevidence (list "6.NS.5-8&1&2")]{Vá para a @worksheet-link[#:name "NinjaCat-Coordinates"] a planilha de planejamento do jogo, e olhe 
                                        para a folha de projeto que tem uma imagem do jogo NinjaCat. Quais são as coordenadas do canto inferior-esquerdo 
                                        da tela? Do superior-direto? Centro? Para praticar, rotule as coordenadas nos pontos corretos de @italic{cada lado} 
                                        da tela, e encontre as coordenadas de cada personagem.}}
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
        @point{@student{Na @worksheet-link[#:name "Game-Design"], você encontrará um modelo de planejamento para fazer seu próprio jogo. 
                           Nós fizemos apenas uma lista de tudo o que tinha o NinjaCat, agora vamos começar a listar o que terá no seu jogo.}
                @teacher{@management{Coloquem seus nomes no inicio desta página.}}
                }
         
        @point{@student{Para começar, seu jogo deverá ter quatro coisas: 
                        @itemlist[
                                  @item{Um Cenário, como uma floresta, uma cidade, o espaço, etc}
                                   @item{Um Personagem Principal, que se move usando as setas.}
                                   @item{Um Alvo, que voa da direita para a esquerda, e dá pontos ao jogador quando pegá-lo.}
                                   @item{Um Perigo, que vem da direita para a esquerda, que o jogador deve evitar.}]}
                @teacher{Peça aos alunos olharem alguns exemplos de temas, tenha certeza de que entenderam o formato do jogo. Por exemplo: um jogo de futebol americano 
                         deve ter um quarterback(jogador que corre com a bola), um jogador rival como perigo, e a bola como alvo. Em um jogo na selva, 
                         pode ter um macaco como jogador principal, uma cobra como perigo, e bananas como alvo.}
                }
        
        @point{@student{@activity{Agora é hora de ser criativo! Preencha a @worksheet-link[#:name "Game-Design"] em sua apostila 
                                  para o @italic{seu} jogo, usando seu próprio jogador, alvo e perigo.}}
                @teacher{@management{Certifique-se de consultar cada equipe. Muitos alunos terão diufculdade em encaixar suas ideias neste 
                                     formato, ou podem se atrapalhar com as orientações. Para ser claro sobre o que pode e não pode ser feito! (e.g. - sem 
                                     jogos 3d, joysticks, jogos multiplayer, etc. ***Hint: students who have a well-worded description of their
                                     images will be happier with any images you could find them. Tente pesquisar por "Person" versus "Jogger", ou
                                     Jogador versus Computador, por exemplo.}}
                }
        ]}

@lesson/studteach[
     #:title "Ordem de Operações"
     #:duration "20 minutos"
     #:overview "Alunos identificam a ordem das opeações para uma expressão matemática complexa através de diagramas (círculos) e 
                 calculam o resultado. Essa lição indroduz aos alunos o Círculo de Avaliação, que é uma ferramenta de 
                 diagramas para expressões aritméticas. Essa é uma maneira poderosa de entender a Ordem das Operações, pois direciona 
                 o aluno a dar foco na estrutura das expressões do que no resultado em si."
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
     #:materials @itemlist[@item{Ambiente de Edição (WeScheme ou DrRacket com o pacote bootstrap-teachpack instalado)}]
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
                @point{@student{Matemática é um idioma, como Inglês, Espanhol, ou qualquer outro. Usamos substantivos, como "pão", "tomate", 
                                "mostarda" e "queijo" para descrever objetos físicos. A matemática possui @vocab{valores}, como números @math{1}, 
                                @math{2} ou @math{3}, para descrever quantidades. Humanos também usam verbos como "fatiar",  "repartir", "espalhar" e "derreter" 
                                para descrever ações sobre esses substantivos. A matemática tem @vocab{funções} como adição e subtração, que 
                                são operações feitas em números. Assim como você pode "fatiar um pão", uma possoa também pode "somar 4 e 5".}

                        @teacher{Alunos devem começar a olhar a matemática como uma @italic{linguagem}. Para ajudar eles, você pode discutir sintaxe e 
                                 gramática da matemática, e sua potencial ambiguidade na ausência de uma ordem fixa de operadores. Ajude 
                                 os alunos a ver que a matemática é uma forma de comunicar cálculos entre as pessoas.}
                        }
                 @point{@student{Uma @vocab{expressão matemática} é como uma frase: é uma instrução para fazer algo. A 
                                 expressão @math{4+5} nos diz para somar 4 e 5. Para @vocab{calcular} uma expressão, nós seguimos as instruções 
                                 da expressão. A expressão @math{4+5} ***@vocab{resulta em} @vocab{evaluates to} @math{9}.                         
                        @activity{O que resulta a operação @math{8*4}? E @math{20-16}? Qual o resultado de @math{16-20}?}}
                       @teacher{}}
                 @point{@student{As vezes, precisamos de várias expressões para completar uma tarefa. Se voce escreveu instruções para fazer 
                                 um sanduíche, a ordem do que vem primeiro importa muito: derreter o queijo, fatiar o pão, espalhar a 
                                 mostarda, etc. A ordem das funções importam na matemática também, e muito. Se alguém diz "quatro mais dois menos um", 
                                 pode ter significados diferentes:
                                @itemlist[@item{Some quatro e dois, então diminua um: @math{(4+2) - 1}}
                                          @item{Some quatro com o resultado da subtração de dois e um: @math{4 + (2-1)}}]
                        @activity{Escreva uma expressão própria que pode significar várias coisas.}}
                        @teacher{}
                        }
                 
                 @point{@student{Dependendo da maneira como você lê a expressão, você pode ter resultados muito diferentes! Esse é um problema, 
                                 porque com frequência usamos a matemática para compartilhar cálculos entre pessoas. Por exemplo, você e sua operadora de celular 
                                 devem concordar antecipadamente o quanto você deverá pagar por enviar mensagens e fazer chamadas. Diferentes resultados 
                                 podem seignificar que sua conta parece errada. Nós evitamos problemas concordando com a ordem que usamos os 
                                 diferentes operadores em uma expressão. Existem duas maneira de fazer isso: 
                               @itemlist[#:style 'ordered
                                         @item{Todos podemos concordar em usar ordem}
                                         @item{Podemos adicionar detalhes nas expressões, que indicam a ordem}]
                          @activity{Anote uma razão de porque é importante ter regras sobre a ordem das operações.}}
                         @teacher{}}
                  @point{@student{@bitmap{images/PEMDASTriangle.png} Matematicos nem sempre concordaram com a ordem das operações, mas agora 
                                   temos um conjunto comum de regras de como calcular expressões. A pirâmide à direita resume essa 
                                   ordem. Quando avaliamos uma expressão, começamos aplicando as operações escritas no topo da pirâmide 
                                   (multiplicação e divisão). Somente depois de ter completado todas essas operações podemos 
                                   descer para o próximo nível. Se ambas as operações estiverrem presentes (como em @math{4+2-1}), nós lemos a expressão 
                                   da esquerda para a direita, @vocab{aplicando} as operações na ordem que aparecem.
                          @activity[#:forevidence (list "A-SSE.1-2&1&3" "5.OA.1-2&1&2")]{Qual deve ser a ordem para resolver o exemplo a seguir? 
                                    @math{19 \div 2 * 11 - 7 + 8}
                                    @itemlist[#:style 'ordered
                                              @item{@math{+ \div * - }}
                                              @item{@math{\div * - +}}
                                              @item{@math{\div * + -}}
                                              @item{@math{* \div + -}}]
}}
                         @teacher{Essa atividade cobre PEMDAS(ordem das operações em expressões ambíguas). Você pode pular esse item se você 
                                  não precisa trabalhar PEMDAS(P. parênteses, E. expoente ou raíz, M. multiplicação, D. divisão, A. adição e S. subtração).}
                         }

                @point{@student{@bitmap{images/FixedCircle.png} uma maneira de indicar a ordem das operações em uma expressão é primeiro 
                                 desenhar a expressão com um diagrama. Esse diagrama é chamado de @vocab{Círculo de Avaliação}. Aqui você pode 
                                 ver um exemplo de um Cículo de Avaliação, para a expressão @math{4-5}. Círculos de Avaliação 
                                 mostram a estrutura que vai dentro da expressão. Todos os Círculos de Avaliação possuem duas regras: 
                       @bannerline{Regra 1: Cada círculo deve ter uma única função, que vai no topo do círculo.}
                       @bannerline{Regra 2: Os números são escritos abaixo, em ordem da esqueda para a direita.}
                       @activity[#:forevidence "BS-CE&1&1"]{@bitmap{images/CircleBug.png}Qual das regras esse Círculo de Avaliação quebra?}
                       }
                @teacher{[@(hyperlink "https://www.youtube.com/watch?v=AMFaPKHp3Mg" "Video")] Essa seção é beneficiada com a ajuda visual de diagramas, etc. Tenha bastante espaço no quadro 
                         para desenhar exemplos!}
                }
                @point{@student{@activity[#:forevidence (list "BS-CE&1&1" "5.OA.1-2&1&1")]{Tente desenhar o Cículo de Avaliação para cada uma das 
                                                                     expressões a seguir:
                                          @itemlist[#:style 'ordered
                                                    @item{@math{6*4}}
                                                    @item{@math{7-10}}
                                                    @item{@math{5 + 8}}
                                                    @item{@math{\frac{351}{-1} }}]
                                          }
                                 @bitmap{images/FixedCircle.png} Todo Círculo de Avaliação calcula o resultado de sua 
                                 expressão correspondente. Por exemplo, o círculo á direita resulta em @math{-1}, porque 
                                 o círculo diz para usar uma subtração(operação no topo) nos números em ordem (@math{4-5}).}
                        @teacher{É importante que os alunos vejam que os Círculos de Avaliação são "apenas outra maneira de escrever cálculos". 
                                 Peça aos alunos discutirem entre si se a Associatividade e Comutatividade ainda estão presentes.
     (Comutatividade tem a ver com a ordem dos elementos na operação,Ex (+ 2 7), ou (+ 2 500) são comutativas pois mesmo trocando a ordem dos elementos, o resultado é o mesmo.
     (Associatividade, operações com mesmo operador podem ser "unidas", ex (+ 20 (+ 5 2)).}
                        }
                @point{@student{@bitmap{images/Nesting.png}Usando multiplas funções na mesma expressão, podemos combinar Círculos 
                                 de Avaliação. Olhe para o Círculo que você escreveu para @math{351 / -1}. Nós já 
                                 sabemos que o Círculo para @math{4 - 5} resultará em @math{-1}, então podemos @italic{substituir a
                                 expressão pelo numero.} Isso muda o resultado da expressão? 
                                @activity[#:forevidence (list "BS-CE&1&2" "5.OA.1-2&1&1")]{
                                      @bitmap{images/fill-in-circle.png}Termine de escrever o Círculo de Avaliação 
                                       mostrado abaixo para representar @math{(23 + 7) * (13 - 5)}}
                      }
                        @teacher{A partir desse momento, os Círculos de Avaliação são sua ferramente de avaliação de Ordem de Operações. 
                                 Questionando os alunos pedindo-lhes para avaliar uma expressão cheia de falsos negativos, 
                                 muitos alunos podem obter a ordem certa, mas podem ter problemas com cálculos básicos. Este 
                                 método também é vulnerável á Comutabilidade, uma vez que o aluno irá avaliar corretamente @math{1*2+2} 
                                 mesmo se receber a ordem das operações errada! O Cículos de Avaliação não possui essas falhas, 
                                 já que ele coloca ênfase: exercitando a habilidade do aluno ver a estrututa 
                                 dentro da aritmética.}
                        }
                @point{@student{@bitmap{images/NestedCircle.png}Qual o resultado desde Círculo de Avaliação? Vamos revisar como 
                                 avaliamos um Círculo:
                                 @itemlist[@item{Sabemos que é uma multiplicação porque é a função que está no topo do Círculo.} 
                                           @item{O número @math{6} é o primeiro número da multiplicação, porque está do 
                                                 do lado esquerdo.}
                                           @item{O segundo número da multiplicação está ao lado direito. Neste lado temos 
                                                 um círculo separado, então precisamos @vocab{calcular} primeiro 
                                                 este círculo. O segundo número da multiplicação é, portanto, @italic{o resultado da soma de 4 e 5}.}
                                           @item{@math{4 + 5} (o círculo interno) resulta em @math{9}, e @math{6 * 9} (o círculo  
                                                  externo) resulta em @math{54}. O círculo todo resulta em @math{54}.}]
                        @activity[#:forevidence (list "BS-CE&1&3" "A-SSE.1-2&1&3" "5.OA.1-2&1&1")]{
                               @bitmap{images/NestedCircle2.png}Transforme esse Círculo de Avaliação em uma expressão matemática.}
                        }
                        @teacher{Trabalhe com vários exemplos com os alunos, dê a eles expressões matemáticas 
                                 e as converta em Círculos, ou trabalhe pedindo que traduzam Círculos 
                                 em expressões aritméticas. Quando falar sobre Círculos, use constantemente 
                                 o termo @italic{função} para o que está no topo, em vez de termos parecidos como "operação", "símbolo", 
                                 "procedimento", "nome", etc. Os Círculos de Avaliação ajudará os alunos a ver a semelhança entre 
                                 funções aritmáticas (como @math{+}) e funções algébricas (como @math{f}) se você usar 
                                 o vocabulário com cuidado.}
                        }
                @point{@student{@activity[#:forevidence (list "BS-CE&1&3" "A-SSE.1-2&1&3" "5.OA.1-2&1&1")]{
                              Combine os Círculos de Avaliação com as expressões a seguir:
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
     #:title "Entrando na Programação"
     #:duration "15 minutos"
     #:overview "Alunos são introduzidos ao ambiente de programação"
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
     #:materials @itemlist[@item{Ambiente de Edição (WeScheme ou DrRacket com o pacote bootstrap-teachpack instalado)}]
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
                @point{@student{Abra a ferramenta de programação de sua escolha: Se você tem instalado o DrRacket, abra a 
                                aplicação. Se vai usar uma ferramenta online, @login-link["clique aqui para entrar"] 
                                colocando seu nome de usuário e senha e entre, então clique em "Start a new Program".}
                        @teacher{@management{Peça aos alunos para que olhem o editor em seus computadores. Caso precise, 
                                             faça uso de um projetor.}}
                        }
                 
                @point{@student{@bitmap{images/wireframeIDE.png}******Essa tela é chamada de @vocab{editor}, e se parece com
                                 o diagrama que você vê ao lado. Existem poucos botões no topo, mas a maior parte da tela é 
                                 dividida em duas grandes caixas: a @vocab{Janela de Definições} em cima e a 
                                 @vocab{Janela de Interações} abaixo.***************}
                        @teacher{Na Janela de Definições é onde os programadores definem os valores e funções de seu programa, 
                                 enquanto a janela de Interações permite que eles experimentem esses valores e funções. 
                                 Isto faz referência a escrever uma série de definições de funções no quadro da sala de aula, e 
                                 ter alunos resolvendo expressões usando essas funções no papel. Como os alunos ainda não 
                                 estão definindo seus próprios valores, não é importante que os alunos entendam essa distinção 
                                 agora. Por enquanto, vamos trabalhar apenas na Janela de Interações.}
                        }
                
                @point{@student{Um programa é uma @vocab{expressão válida} que, quando calculada porduz um valor. Você tem 
                                               escrito programas usando expressões matemáticas desde que você aprendeu a 
                                               somar! Com no Português, existem regras que determinam se uma frase 
                                               faz sentido. Programas também têm regras! Um programa pode ser muito complicado, mas 
                                               ele não precisa ser: os programas mais simples de todos são apenas Números.}
                        @teacher{@management{Draw students' attention to the Language Table (see Lesson Overview for Unit 1),
                                             which currently sits empty. Add "Numbers" to the Types section of the language 
                                             table.}}
                        }
                @point{@student{@bannerline{Code Rule 1**: Todos os valores são expressões válidas.}
                                 @activity[#:forevidence "BS-IDE&1&1"]{O que você pensa que se digitarmos @code{4}, resultará em que?
                                                                       @editor-link[#:interactions-text "4"
                                                                                    "Clique aqui para testar."]}
                                              @itemlist[@item{Digite 4 na Janela de Interações e aperte "Enter". Você verá 
                                                              o valor @code{4} aparecer na próxima linha da 
                                                              Janela de Interações.}
                                                        @item{Digite 10 na Janela da Interações e aperte "Enter". Agora 
                                                              o valor @code{10} aparece na Janela de Interações.}
                                                         @item{Tente colocar outros números, como @code{10345017}, ou números 
                                                               negativos, como @code{-2}. Existe um limite para o tamanho do número? 
                                                               O que acontece se você escrever um número decimal? O que acontece se você clicar sobre 
                                                               um número decimal, como @code{1.5}? Você recebe um novo tipo de número, uma 
                                                               fração, como @code{3/2}.}]
                                }
                        @teacher{O ambiente do editor calcula todas as frações e retorna o número em decimal por padrão. Isso pode ser 
                                 surpreendende para os alunos de início, então você pode tomar um momento para explicar o que está acontecendo, e 
                                 mostrar a eles que esse números decimais podem ser convertidos de volta clicando sobre eles. O 
                                 ambiente usa anotações padrão para retetição, expressões decimais não-finitas e 
                                 manuseia corretamente expressões como @math{(\sqrt -1)}. Se você quizer trabalhar com esses tipos de 
                                 números em sua classe, insira-os para familiarizar-se como eles aparecem na Janela de interações.}
                        }
           
                
                @point{@student{@activity[#:forevidence "BS-IDE&1&2"]{O computador conhece amplamente sobre Números, mas o que acontece 
                                                                      se você digitar algo que ele @italic{não conhece}? 
                                                                      Ele irá reclamar? Falhar? Vai adivinhar? 
                                                                      @editor-link[#:interactions-text "cachorro" "Peça para o computador"] 
                                                                      para calcular @code{cachorro} na Janela de Interações.}
                                 Essas mensagens de erro são muito úteis aos programadores. Ao invés de dizer "esse programa não 
                                funciona", o computador faz o que pode para te dizer o que está errado, e te dá o máximo 
                                de informações possível para lhe ajudar a corrigir o problema. Certifique-se de sempre ler essas mensagens com atenção!
                                 }
                        @teacher{A mensagem de erro usa o termo "variável. Não se preocupe se seus alunos conhecem ainda essa 
                                 palavra; nós ensinaremos a eles rapidamente. Por enquanto, os alunos só precisam se acostumar às mensagens de erro 
                                 e tipos de problemas que eles recebem de seus programas.}
                        }
                
                @point{@student{Círculos de Avaliação são fáceis de converter para programas de computador. Para traduzir um Círculo de 
                                Avaliação em programa, começe abrindo parênteses @code{(}, em seguida a função que está escrita no 
                                topo do círculo. Coloque as entradas da esquerda para a direita, na mesma ordem como no círculo, adicionado um
                                parenteses de fechamento @code{)} quando terminar. Esse procedimento nos dá a segunda regra para @vocab{expressões}:  
                                @bannerline{Code Rule 2***: Cada parêntese aberto é seguido de uma função, em seguida de uma ou mais 
                                            expressões válidas, e finalmente do parêntese de fechamento.}
                                 @bitmap{images/FixedCircle.png}Aqui está o código para esse Círculo de Avaliação: @code{(- 4 5)}
                                 @activity[#:forevidence "BS-PL.1&1&2"]{ @editor-link[#:interactions-text "(- 4 5)" "Veja o que acontece"]
                                                                         quando esse código é colocado na Janela de Interações.
                                                                         Pressione Enter para ver o resultado. Você deve ver 
                                                                         ver @math{-1} com resposta.
                                                                        }
                        }
                        
                        @teacher{Diga aos alunos para praticar convertendo simples Círculos de Avaliação em código. Se você que ajudar os alunos 
                                 á entender quando usar parênteses, aqui vai duas explicações que achamos úteis. Primeiro, o parênteses 
                                 se parecem com o Círculo, o Círculo inclui o nome da função e suas entradas. Segundo, usamos 
                                 mais uma descrição visual de uma formiga que vai ***an ant eating its way through the expression.(percorrendo seu caminho através da expressão.) A formiga come dentro do círculo 
                                 (um parêntese aberto), e vai para a função no topo, depois para os argumentos da esquerda para a direita, 
                                 e finalmente chega ao final do círculo(um parêntese de fechamento). Se a formiga encontrar outro círculo enquanto estiver escrevendo 
                                 os argumentos, ela precisa abrir outro parênteses, etc.}
                        }   
                @point{@student{@bitmap{images/NestedCircle.png}Quando um Círculo de Avaliação tem outro círculo dentro dele, a 
                                 tradução ainda segue as mesmas regras: cada Círculo requer um novo conjunto de parênteses:
                                 @code{(* 6 (+ 4 5))}
                                 @activity[#:forevidence "BS-PL.1&1&2"]{@itemlist[@item{Experimente digitar esse código na Janela de Interações. 
                                                                                        O que o programa deve retornar quando 
                                                                                        você apertar Enter?}
                                                     @item{Pratique convertendo outros Círculos de Avaliação que você já desenhou para código.}]}}
                        @teacher{@management{Scaffolding for Pair Programming: Talk to students about the roles of @italic{Driver} 
                                             and @italic{Navigator}. The Driver is the student with their hands on the keyboard - they're 
                                             in charge of typing, using the mouse, etc. The Navigator should be telling the Driver what to
                                             type, and pointing out mistakes or suggesting things. It's important to clarify what these 
                                             roles are (perhaps reinforcing them with a visual), to ensure that both partners are active 
                                             and talking to one another about the task at hand.}}
                        }
               
                @point{@student{@bannerline{Todas as expressões que são seguidas do nome da função são chamadas de @vocab{argumentos} da 
                                            função. O diagrama a seguir resume a maneira como uma expressão que usa uma função. 
                                            @bitmap{images/ExpressionDiagram.png}}
                                @activity[#:forevidence (list "BS-CE&1&2" "BS-CE&1&4")]{
                                        Para praticar, vá para a @worksheet-link[#:name "Circle-of-Evaluation-Practice"] 
                                        de sua apostila. Para cada expressão matemática, desenhe um Círculo de Avaliação, e depois converta 
                                        o Círculo para Código em Racket.}}
                        @teacher{}
                        }
                @point{@student{Quando uma expressão não segue as regras do código, o computador lhe diz que encontrou um problema. O 
                                computador também lhe dá informação para te ajudar a corrigir o problema. Essa informação é chamada de 
                                @vocab{mensagem de erro}. Nós falaremos mais sobre mensagens de erro depois. por enquanto, queremos que você veja 
                                um par de mensagens de erro para que você saiba o que eles são quando encontrar algum enquanto estiver programando. 
                       @activity[#:forevidence "BS-IDE&1&2"]{Digite cada uma das expressões inválidas a seguir na Jnaela de Interações 
                                                             e olhe para as mensagens de erro ou avisos que o computador te retorna. 
                                 @itemlist[@item{@code{(5 * 6)} [colocou a função no meio, ao invés de colocar no início]}
                                           @item{@code{(*5 6)}  [faltando um espaço depois da função]}
                                           @item{@code{* 5 6)}  [esqueceu de abrir parênteses]}
                                           @item{@code{(* 5 6}  [esqueceu de fechar o parênteses]}
                                          ]}}
                       @teacher{Neste momento, o objetivo é simplesmente que os alunos @italic{vejam} mensagens de erro. Não espere que 
                                eles sejam experts em ler mensagens de erro tão cedo 
                                (você trabalhará isso mais tarde). NOTA: Quando um parêntese de fechamento está faltando, apertar Enter não faz nada, 
                                porque o computador está esperando pelo parêntese. Quando um parêntese de abertura está faltando, o WeScheme 
                                não faz nada e espera o programador 
                                adicionar o parêntese. Se os alunos apertam Enter e "nada acontece", eles devem checar seus parênteses. 
                                Observe também que se você fizer essa sequênciade exercícios com @code{+} ao invés de @code{*}, o erro 
                                aparecerá de forma diferente, porque @code{+5} é perfeitamente um número válido (assim como @code{-5}).}
                      }
                ]}


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
        @points[@point{@student{Você fez muito nessa primeira aula! 
                                @itemlist[@item{Você analisou um jogo para ver como seus personagens se movem}
					  @item{Você projetou seu próprio jogo, que você construirá durante esse curso}
                                          @item{Você praticou usando coordenadas para colocar personagens na tela}
                                          @item{Você aprendeu sobre a ordem das operações, Círculos de Avaliação, como transformar Círculos de 
                                                Analisou o programa, e como executar esses programas para conseguir as respostas.}]
                        Na próxima lição, nós vamos começar a escrever programas para coisas mais interessantes do que apenas aritmética.}
                        @teacher{@management{Certifique-se que o nome dos alunos estão na página 3. Destaque a página 3, ou tire fotos da página 3, para preparar as imagens do jogo para a próxima Unidade. }}}
               ]
         }
}

