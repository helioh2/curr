#lang curr/lib
@declare-tags[management]

@title{Unidade 3: Estruturas e Mundos}

@unit-overview/auto[#:lang-table (list (list "Número" @code{+ - * / sq sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Figura"  @code{rectangle circle triangle ellipse star text scale rotate put-image})
                                       (list "Carro" @code{make-carro carro-modelo carro-potencia carro-rodas carro-cor carro-valor}))]{

@unit-descr{Alunos, tendo pré-construído estruturas de dados na aula passada (carros), vão extender seu entendimento sobre definir várias estruturas de dados próprias e acessarão seus campos. São introduzidos à uma implementação de um mini-mundo puramente-funcional do Racket. Isto exige um conhecimento sobre funções, estruturas de dados, e uma introdução à programação baseada em eventos. Para alcançar isso, os alunos trabalham primeiro com um mundo simples (um número, representando a coordenada-x do cão). Esse mundo é consumido e produzido pela função atualiza-mundo, e desenhado pela desenha-mundo. Para entender eventos, eles encenam um modelo de Mundo, tornando-se controladores de eventos e do tempo, para simular a execução do programa.}
}
@unit-lessons{
@lesson/studteach[#:title "Revisão: A Tunning Shop"
        #:duration "20 minutos"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{Lápis/canetas aos alunos, e giz/marcadores de quadro branco aos professores}
                            @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                            @item{Ambiente de Edição (WeScheme ou DrRacket com o pacote de ensino-bootstrap instalado)}
                            @item{Tabela da Linguagem}]
     #:preparation @itemlist[@item{Arranjos de assento: preferencialmente aglomerando as mesas}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Na lição passada você aprendeu soubre um novo tipo de estrutura de dados, chamado de carro. 
                                @activity{@itemlist[@item{O que é um carro? Quais itens são descritos em sua estrutura?}
                                                    @item{Como vocẽ constrói um carro?}
                                                    @item{Como você obtém o modelo de um carro? O valor? A cor?}]}
     Na última vez todas essas perguntas foram usadas em sua loja de turbinar carros, onde você tinha funções que aumentavam a @code{potencia} de um carro, ou pintava ele com uma nova @code{cor}. O próximo problema 
     será ainda mais difícil, então lembre-se de voltar às duas últimas funções que você escreveuem sua apostila, caso precise de algumas dicas.}
                        @teacher{Tome alguns minutos para revisar structs e carros junto a seus alunos.}}
            @point{@student{Você pode ter ouvido falar do programa "Pimp My Ride(Lata Velha- Caldeirão do Hulk)", onde algumas pessoas pegam um velho carro, o modificam e o deixam LEGAL. Vamos implementar algo parecido no Racket...
            @activity{Vá para @worksheet-link[#:page 12 #:name "pimp"] em sua apostila. Escreva uma função chamada @code{tunar}, que recebe um Carro e retorna um novo Carro que tenha 
                              100 cavalos de poência a mais, rodas de tamanho 30 polegadas, pintado de vermelho, e seu valor aumentado em R$10.000 .
                              @itemlist[@item{Qual é a @vocab{assinatura} desta função?}
                                         @item{Para o primeiro Exemplo, vamos reformar o @code{carro3}. Como você iniciaria o exemplo?}
                                         @item{@code{(EXAMPLE (tunar carro3) ...)}}
                                         @item{De acordo com a assinatura, sabemos que a Imagem da função @code{tunar} é um Carro. Como você contrói um carro?}
                                         @item{Qual é a primeira parte de um carro? O @code{modelo}. Seguindo a @vocab{declaração de propósito} da função, o modelo do carro muda? 
                                               Como você consegue saber o @code{modelo} de @code{carro3}?}
                                         @item{Como você consegue saber a @code{potencia} do @code{carro3}?}
                                         @item{A potência do carro muda quando você "tuna" o carro? Vocẽ terá que pegar a @code{potencia} do @code{carro3}, @italic{e adicionar 100.}}
                                         @item{De acordo com a @vocab{declaração de propósito}, todo carro que é tunado deve ter rodas de 30 polegadas de tamanho. Será que o tamanho original das rodas importa aqui?}
                                         @item{Da mesma forma, cada carro será pintado de vermelho. Nós precisamos fazer referência a cor original?}
                                         @item{Finalmente, como você consegue obter o @code{calor} do @code{carro3}? O valor será aumentado ou diminuído depois do carro ser tunado?}
                                       ]}}
                    @teacher{Essa é uma oportunidade para praticar expressões aninhadas. Eles não irão usar paenas as funções de acesso para conseguir o campos originais do carro, 
                             eles terão que modificá-los de acordo com a descrição do programa. Se eles ficarm presos, peça que desenhem o círculo de avaliação para adicionar 100 aos cavalos 
                             de força, 10000 ao valor, etc.}}
            @point{@student{Colocando tudo isso junto, o primeiro exemplo deve ser parecido com:

@code[#:multi-line #t]{(EXAMPLE (tunar carro3) (make-carro (carro-modelo carro3)
                                                    (+ (carro-potencia carro3) 100)
                                                        30
                                                        red
                                                    (+ (carro-valor carro3) 10000)))}
@activity{Escreva mais um exemplo, circule o que varia, e então defina a função @code{tunar}. Se você ficar preso, dê uma olhada na assinatura e no seu primeiro exemplo.}}                             
                    @teacher{}}
            ]
         }
                                                                 
@lesson/studteach[#:title "define-struct"
        #:duration "5 minutos"
        #:overview ""
        #:learning-objectives @itemlist[@item{Os alunos estenderão seu entendimento sobre funções construtoras e funções de acesso}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{O arquivo Carros [Autos.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @editor-link[#:public-id "sc7Ag2gKUm" "WeScheme"] pré-carregados nos computadores}]
        #:preparation @itemlist[]
        #:prerequisites (list)
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{@points[@point{@student{@activity{Abra o arquivo @editor-link[#:public-id "sc7Ag2gKUm" "Tunning Shop"], e olhe para as duas primeiras linhas. 
                                                   Elas começam com @code{; um carro é...} e @code{define-sctruct}.}
                                @code[#:multi-line #t]{; um carro é (make-carro String Numero Numero String Numero)
(define-struct carro (modelo potencia rodas cor valor))}
Na última unidade, ignoramos parte do código que define a estrutura carro, ou o que diz ao computador o que é um caro e o que temos dentro dele. Tal como esperávamos de ter trabalhado com
carros, a linha @code{define-struct} diz que um carro possui cinco coisas... um modelo, potencia, rodas, cor, e valor. Mas como sabemos onde cada informação vai? Lembre-se que a ordem
é importante! Olhe a ordem dos campos na linha do @code{define-struct}. A primeira string é o modelo, o primeiro número é sua potência, o segundo número é o tamanho das rodas, e assim continua.}
                        @teacher{Você pode usar os Carros dados no arquivo, ou os carros dos próprios alunos da lição passada. Reforçe a importância de ser capaz de definir seus próprios tipos de dados
                                 aos alunos: eles estão longe de fazerem ligações entre simples valores de números, strings, ou boolenaos! O Racket permite que você crie novas estruturas, contendo 
                                 qualquer combinação de valores. Mas essas estruturas não serão usadas sem a linha @code{(define-struct ...) !}}}
                 
            @point{@student{Uma estrutura é definida usando a função @code{define-struct}, que conta ao computador os itens que fazer parte dela, a ordem que estão e o tipo de cada 
                                                          um. Em troca, conseguimos novas funções para usar. Se não escrevemos a linha @code{define-struct}, nós não temos um 
                                                          @code{make-carro} (para construir um carro), @code{carro-modelo} (para saber o modelo do carro), @code{carro-potencia}, ou qualquer outras 
                                                          funções de acesso, porque o Racket não sabe o que um Carro é- @italic{nós não o definimos}.
            @activity{Para verificar isso, digite um ponto-e-vírgula no início da linha que começa com @code{define-struct}. Isso comenta a linha toda, e o computador ignora isso. Clicque em "Run", e veja 
                                                                                         o que acontece. Depois vá para @worksheet-link[#:page 13 #:name "define-struct"] em sua apostila, e copie 
                                                                                         a linha define-struct.}}
                    @teacher{Quando a linha do @code{define-struct} está comentada, o Racket retorna um erro, dizendo que você está usando um identificador antes da sua definição. Isso significa que 
                                      ele não sabe o que @code{make-carro} é ou faz, porque nós nunca definimos uma struct carro. Certifique-se que os alunos entendam que o @code{define-struct} 
                                      é necessário para criar e trabalhar com qualquer estrutura.}}
            ]
         }
           
@lesson/studteach[#:title "A Struct Festa"
        #:duration "30 minutos"
        #:overview ""
        #:learning-objectives @itemlist[@item{Escrever funções complexas que consomem, modificam e produzem estruturas}
            @item{Aprofundam seu entendimento sobre estruturas, construtores e funções de acesso introduzindo duas novas estruturas de dados.}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Alunos definem duas novas estruturas de dados complexas: festa e mundo}
          @item{Alunos escreverão funções que acessam campos de um carro, festa ou mundo, e produzem novos carros, festas, e mundos.}]
        #:standards (list)
        #:materials @itemlist[@item{O arquivo Organizador de Festas [Party.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @editor-link[#:public-id "tsBEwjbSbH" "WeScheme"] pré-carregados nos computadores}]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{agora que você já sabe como definir suas próprias estruturas, vamos definir mais uma. Invés de trabalhar numa loja de tunning, agora você 
                                será um organizador de festas. Estruturas de dados serão muito úteis para representar cada festa que você planejar, tenha o controle do local, o tema da festa, 
                                e o número de convidados.
                                @activity{@itemlist[@item{Qual tipo de dados poder ser usado para representar o local de uma festa?}
                                                     @item{E quanto ao tema da festa? (Poderia ser algo como @code{"Anos 50"}, ou @code{"uma festa do pijama"})}
                                                     @item{E quanto ao número de convidados?}]
                                           Preencha a segunda definição de estrutura na @worksheet-link[#:page 13 #:name "Party Planner"] em sua apostila.}
@code[#:multi-line #t]{; uma festa é uma (make-festa String String Numero)
                       (define-struct festa (local tema convidados))}}
                        @teacher{}}
                 
                 @point{@student{@activity{Abra o arquivo @editor-link[#:public-id "tsBEwjbSbH" "Organizador de Festas"]. Dê uma olhada nas primeiras duas 
                                                    linhas na janela de definições. Elas combinam com o que você escreveu antes?} 
                                 Agora que a strcut festa está definida, você tem quato novas funções: Uma para construir uma festa, e três @vocab{funções de acesso}
                                 para saber o local, tema, e o número de convidados de uma festa. 
@activity{Vá para sua página de assinaturas. @itemlist[@item{Qual é o @code{Nome} da função que @italic{constrói uma festa?}}
                                                  @item{Qual é o @vocab{Domínio} da função? Quais tipos das coisas que são parte de uma festa?)}
                                                  @item{Qual é a @vocab{Imagem} dessa função?}
                                                  @item{Como você consegue saber o local de uma festa? (Pense sobre como você conseguia o modelo ou a cor de um carro.)}
                                                  @item{Escreva as assinaturas para @code{festa-local}, @code{festa-tema}, e @code{festa-convidados}.}]}}
                         @teacher{}}
                 
                 @point{@student{@activity{Agora defina duas estruturas festa que vocẽ queira. Não importa qual tipo de festa vocẽ está planejando, certifique-se que ela tenha os tipos 
                                           corretos de itens e na ordem certa.}}
                         @teacher{Assim como na struct carro, a repetição é a chave: peça aos alunos que identifiquem cada campo em suas festas, e faça muitas 
                                  perguntas: Como você conseguiria obter o @code{tema} de um @code{Halloween}? Como você consegue o número de convidados de uma festa @code{4 de Julho(Dia da Independência)}?}}
                 
                 @point{@student{Agora é hora de escrever algumas funções usando a estrutura festa. Lembre-se que, como um organizador de festas você precisa ser capaz de mudar 
                                 a informação para cada festa. 
      @activity{Vá para @worksheet-link[#:page 14 #:name "RSVP"]. Escreva uma função chamada @code{CP}(Confirmação de Presença de convidados), que recebe uma festa e aumenta 1 no número 
                        de convidados.
                        @itemlist[@item{Qual é o nome da função? Domínio? Imagem?}
                                   @item{Escreva a @vocab{assinatura} e a @vocab{declaração de propósito} em sua folha.}
                                   @item{Escreva seu primeiro Exemplo para a festa @code{Halloween}. Como você começa?}
                                   @item{@code[#:multi-line #t]{(EXAMPLE (CP Halloween)....)}}
                                   @item{O que está função produz? (Se você estiver travado, dê uma olhada em sua assinatura.)}
                                   @item{Qual função nós usamos para construir uma festa?}
                                   @item{De acordo com a função @code{CP}, o local da festa muda? Claro que não. Então como você consegue o @code{local}
                                         de uma festa?}
                                   @item{@code[#:multi-line #t]{(EXAMPLE (CP Halloween) (make-festa (festa-local Halloween)
		                               .....))}}
                               @item{E quanto ao tema? Se alguma nova confirmação aparecer, de repente temos que tornar a festa em Festa de Natal? Qual função você usa para descobrir o @code{tema} 
                                     de uma festa?}
                               @item{@code[#:multi-line #t]{(EXAMPLE (CP Halloween (make-festa (festa-local Halloween)
        (festa-tema Halloween)
		.....))}}
                               @item{Por último, o que acontece com o número de convidados, quando recebe uma nova confirmação de presença apra a festa?}]}
      O primeiro exemplo de @code{CP} deve ser escrito como: 
@code[#:multi-line #t]{(EXAMPLE (CP Halloween) (make-festa (festa-local Halloween)
                                                             (festa-tema Halloween)
                                                          (+ (festa-convidados Halloween) 1)))}}
                         @teacher{Cada estrutura terá suas próprias funções de acesso para cada campo. Peça aos alunos que pratiquem o acessoa cada parte da Estrutura Festa e às alterando (ou não!) com base no problema descrito.}}
                 @point{@student{@activity{Na @worksheet-link[#:page 15 #:name "relocate"], escreva uma função chamada @code{trocarLugar}que recebe uma festa E um local que a
                                              festa está mudando, e construa uma nova festa nesse lugar. Vá passo a passo pela receita de projeto: assinatura, exemplos, e definição.}}
                         @teacher{}}
                 ]
         }

       
@lesson/studteach[#:title "Atuando no Mundo Ninja"
        #:duration "30 minutos"
        #:overview ""
        #:learning-objectives @itemlist[@item{Discover the event-based microworld implementation of Racket, which uses events to modify the world.}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{The Ninja World 1 file [NW1.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @editor-link[#:public-id "fW705a0idU" "WeScheme"] preloaded on students' machines}
                                @item{crachás de atualiza-mundo, big-bang, e desenha-mundo}
                                @item{um recorte da imagem do cachorro do NinjaCat}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Você se lembra do jogo NinjaCat do Bootstrap 1? Neese curso você vai desconstruir o jogo completamente, e recriá-lo usando 
                                uma estrutura mundo para fazê-lo mais complexo. Essa versão do Ninja Cat pode ser um pouco diferente da que você se lembra: 
                                @activity{Abra o arquivo @editor-link[#:public-id "fW705a0idU" "Ninja World 1"] e clique em "Run". 
                                                   @itemlist[@item{O que você vê nesse jogo?}
                                                              @item{Vá até o código e olhe a linha onde a estrutura @code{mundo} é definida.}
                                                              @item{Qual função define uma estrutura(struct)?}
                                                              @item{Qual é o nome da estrutura definida nesse arquivo?}
                                                              @item{O @code{mundo} é feito de apenas uma coisa: @code{dogX}. O que @code{dogX} representa no jogo?
                                                                    De que tipo de dado ele é?}
                                                              @item{Dê uma olhada na seção nomeada @code{;; INICIANDO MUNDO}. Existe uma variável definida ali, chamada 
                                                                    @code{INICIO}. Que tipo de dado o @code{INICIO} é? Um número? String? Figura? BOoleano?}
                                                              @item{Qual função constrói um @code{mundo}?}
                                                              @item{Pule um pouco mais para baixo onde diz @code{;; ATUALIZANDO FUNÇÕES}. Qual é o nome da função 
                                                                    definida ali? Qual o seu domínio e imagem?}
                                                              @item{pense sobre o que a função @code{atualiza-mundo} está fazendo. Como ela consegue obter o @code{dogX} do
                                                                    mundo? O que ela está fazendo com a coordenada-x do cão?}]}
                                Cada vez que @code{atualiza-mundo} é chamada, ela constrói um novo mundo, adicionando 10 ao @code{dogX} do mundo que ela recebeu.}
                                
                        @teacher{Essas atividades estimulam os alunos a ler ocódigo dos outros e a pensar como eles funcionam, analisando as assinaturas e definições e 
                                 reunindo o que eles já sabem. Faça VÁRIAS perguntas ao passar pelo arquivo: Como sabemos que precisamos construir um novo mundo 
                                 na @code{atualiza-mundo}? (Porque a imagem é um mundo). Por que @code{dogX} é um bom nome de variável para nosso mundo? Peça-lhes para
                                 tentar adivinhar o que as expressões como @activity{(on-tick atualiza-mundo)} vai fazer no jogo.}}
                 
                 @point{@student{@activity{Agora desça até a última função definida em nosso código: @code{big-bang}. Essa é uma função especial que começará uma animação, 
                                          mas precisa da ajuda de outras funções para atualizar e desenhar o mundo. 
                                          @itemlist[@item{Qual mundo @code{big-bang} está recebendo?}
                                                     @item{No código, @code{big-bang} está chamando algumas funções diferentes. Quais novas funções você pode ver que estão sendo usadas dentro do 
                                                                        @code{big-bang}?}]}
                                  A função @code{on-tick} funciona como um relógio, e em cada "tick", ele atualiza o mundo. Até agora e estrutura mundo é 
                                  apenas um número, representando a coordenada-x do cachorro. @code{(on-tick atualiza-mundo)} conta ao computador para atualizar 
                                  o mundo em cada tick.
                                 @activity{@itemlist[@item{Como ele faz isso? Pense sobre o que @code{atualiza-mundo} faz com o @code{dogX} do mundo.}
                                                      @item{Experimente colocar o código: @code{(big bang INICIO (on-tick atualiza-mundo))} na janela de interações e veja o que acontece.}]}
                                 A estrutura mundo está atualizando, mas isso não é muito um jogo sem figuras! Nós precisamos saber como @italic{desenhar} o mundo.}
                         @teacher{}}
                 @point{@student{@activity{Role para cima até onde você ver @code{;; FUNÇÕES GRÁFICAS}. 
                                                                      @itemlist[@item{Qual é o nome da função definida ali?}
                                                                                 @item{Qual é o Domínio dessa função? E a Imagem?}
                                                                                 @item{De acordo com a declaração de propósito, oq ue essa função faz?}]}
                                 Agora olhe para o corpo da função @code{desenha-mundo}. Ela está usando uma função que você pode se lembrar do Bootstrap 1, chamada @code{put-image}, que recebe
                                 uma imagem, e a coloca em cima de outra imagem, usando as coordenadas x e y para determinar onde será colocada. Neste exemplo, ela 
                                 está colocando a @code{CACHORRO} sobre o @code{IMAGEMFUNDO}. @activity{Para que a coordenada-x do cachorro é usada? E a coordenada y?}}
                         @teacher{Uma vez que os alunos entendem o propósito das trẽs funções, eles precisam entender como elas funcionam juntas. Peça que alguns voluntários representem 
                                  a @code{atualiza-mundo} e o @code{big-bang}, dando a eles "crachás" com o nome das funções e peça que venham até o quadro.
                                  Peça que expliquem para a turma quais são suas assinaturas e o que eles fazem. Escreva: "Mundo" no quadro, e escreva o número @code{0} abaixo. 
                                  Quando você gritar "@code{(big-bang 0)}", peça que a turmaconte o tempo, gritando "tick!" a cada cinco segundo. A cada tick, o @code{big-bang} 
                                  deve chamar a @code{atualiza-mundo} para atualizar o novo mundo escrevendo no quadro. Isso resulta no número mudando o tempo todo, começando com 0.
                                  
                                  Peque outro voluntário para ser @code{desenha-mundo}, dê a ele o "crachá" e um recorte do cachorro. Desenhe um grande 
                                  retângulo no quadro, representado a tela. Agora o big-bang chama o @code{atualiza-mundo} e @code{desenha-mundo} a cada "tick", 
                                  fazendo com que o número aumente e o cachorro se mova pela tela um pouco de cada vez. Faça a turma passar por algumas 
                                  iterações disso. Ao atuar essas etapas, os alunos estão demonstrando exatamente como as três funções trabalham juntas no código para 
                                  completar a animação no computador.}}
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
        @points[@point{@student{Se você atuasse essas funções, confiando no @code{big-bang} para atualizar o mundo, depois usar o resultado de @code{atualizar-mundo} para 
                                desenhar o mundo, e colocando tudos juntos para criar uma animação, poderia ficar complicado, e a animação não seria tão rápida quanto 
                                você vê no computador. Felizmente, o Racket tem a capacidade de executar todas essas funções e mais algumas em uma fração de tempo, 
                                para criar e desenhar suavemente, o jogo completo. Nas próximas aulas, você estará usando structs para estender esse mundo, 
                                em um jogo realmente complexo, e escrever funções para o Mundo Ninja E seus próprios jogos para torná-los mais divertidos e únicos.
                                }
                        @teacher{@management{@itemlist[@item{Peça aos alunos o que eles aprenderam nesta lição}
                                                        @item{Comportamentos que você valoriza: trabalho em equipe, fazendo anotações, engajamento, etc}
                                                        @item{Pass out exit slips, dismiss, clean up.}]}}
                        }
                        ]}
       }

       


  

