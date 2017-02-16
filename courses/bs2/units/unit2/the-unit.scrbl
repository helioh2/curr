#lang curr/lib

@title{Unidade 2: Introdução à Estruturas de Dados}

@declare-tags[management]


@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sq sqrt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text}))
                                                                                                          ]{
@unit-descr{Alunos descobrem a necessidade de estruturas de dados e praticam definindo-as, criando exemplos e escrevendo funções que os produzem.}
}
@unit-lessons{
              
@lesson/studteach[
     #:title "Revisão"
     #:duration "20 minutos"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students will deepen their understanding of function definitions and the Design Recipe}]
     #:evidence-statements @itemlist[@item{}]
     #:product-outcomes @itemlist[@item{}]
     #:standards (list)
     #:materials @itemlist[@item{Pens/pencils for students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Language Table (see below)}
                            @item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "Workbook"] folders with names on covers, and something to write with}]
     #:preparation @itemlist[@item{Write Agenda on board}
                             @item{Display class posters, Language Table, Design Recipe}
                             @item{Seating arrangements: ideally clusters of desks/tables}]
     
      #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{@student{Na unidade passada, você revisou quase tudo do Bootstrap 1 incluindo Tipos de Dados, Assinaturas, e a Receita de Projeto. 
                                Nesta unidade vamos além de tudo isso, você aprenderá um novo tipo de dados inteiramente novo que será a base para tudo o que você vai fazer 
                                no Bootstrap 2.}
                        @teacher{Faça algumas perguntas de revisão para testar o entendimento dos alunos, como: 
                                 @itemlist[@item{Quais são as três partes de uma Assinatura?}        
                                            @item{Qual é o código em racket que desenha um triangulo, sólido, e verde de tamanho 22?}
                                            @item{Por que é importante escrever ao menos 2 exemplos antes de definir a função?}]}} 
                 
                 @point{@student{Para ver se o conteúdo da última unidade está fresco em sua mente, enfrente a seguinte atividade: @activity{Vá para @worksheet-link[#:page 7 #:name "double-radius"] em sua apostila. Escreva uma função chamada @code{dobro-raio}, 
                                                   que recebe um número e uma cor. Ela produz um contorno de um círculo da cor que ele recebeu, mas seu raio 
                                                   é duas vezes maior do que ele recebeu na entrada.}}
                        @teacher{@management{Se for trabalhar esse exemplo em aula, use um projetor para as crianças possam ver a função sendo escrita no computador: }}}
                 @point{@student{Você se lembra de como usar a receita de projeto para resolver problemas descritivos? @bannerline{Passo 1: Assinatura e Declaração de Propósito}
                                 @activity{ @itemlist[@item{Qual é o @vocab{Nome} desta função?}
                                                       @item{Qual é o @vocab{Domínio} desta função?}
                                                       @item{Qual é a @vocab{Imagem} desta função?}
                                                       @item{O que ela faz? Escreva sua @vocab{Declaração de Propósito} descrevendo o que a função deve fazer com suas palavras.}]}
                                 @code[#:multi-line #t]{
; dobro-raio: Numero String -> Figura
; faz um contorno de círculo que o tamanho é o dobro do raio}}
                         @teacher{Revise o propósito das Assinaturas: uma vez que sabemos o Nome, Domínio e Imagem de uma função, fica fácil escrever Exemplos usando esses tipos de dados.}}
           
                 @point{@student{@bannerline{Passo 2: Exemplos} 
                                  @activity{Usando apenas a Assinatura e a Declaração de Propósito, veja se você consegue responder as seguintes questões:
                                            @itemlist[@item{Todo Exemplo começa com o nome da função. Onde você poderia encontrar o nome da função?}
                                                       @item{Todo Exemplo precisa incluir entradas de amostra. Onde você poderia descobrir quantas entradas essa função precisa, 
                                                             e de tipos elas são?}
                                                       @item{Todo Exemplo deve incluir uma expressão para o que a função deve fazer com a entrada recebida. Onde 
                                                             você poderia olhar para descobrir o que essa função faz?}
                                                       @item{Escreva dois Exemplos no papel, e círcule e nomeio o que está mudando entre eles. Quando nomear,
                                                             pense sobre o que essa coisa representa.}]}
                                  Seus exemplos devem ser semelhantes a:
                                  @code[#:multi-line #t]{
(EXAMPLE (dobro-raio 50 "pink")
         (circle (* 50 2) "outline" "pink"))

(EXAMPLE (dobro-raio 918 "orange")
         (circle (* 918 2) "outline" "orange"))}}
                         
                         @teacher{Cada uma das respostas podem ser encontradas na Assinatura ou na Declaração de Propóstito. Sugestão: Escreva esses passos no quadro, e desenhe 
                                  setas entre eles para destacar o processo. A objetivo aqui é fazer com que os alunos tenham o hábito de fazerem essas perguntas
                                  por conta própria cada vez que tiverem que escrever exemplos, e em seguida usar seu prórpio trabalho do passo anterior para encontrar as respostas.}}
                @point{@student{@bannerline{Passo 3: Definição}
                                Uma vez que voxê sabe o que está mudando entre os dois exemplos, você pode definir a função facilmente. As coisas que estão circuladas e nomeadas
                                nos dois exemplos serão substituídas por @vocab{variáveis} na definição de função. (Você não irá @bold{sempre} querer fazer um círculo 
                                cor de rosa onde o raio é o dobro de 50. Você quer ser capaz de mudar a cor e o raio.) 
                                @activity{Debaixo de seus exemplos, copie tudo o que @bold{não} muda, e substitua as coisas que mudam pelo nome 
                                          de variáveis que você usou.}  
           @code[#:multi-line #t]{(define (dobro-raio raio cor)
                                          (circle (* raio 2) "solid" cor))}}
                @teacher{Verifique a compreensão dos alunos: Por que usamos variáveis no lugar de valores específicos? Por que é tão importante ter nomes de variáveis
                         descritivos, em oposição a @code{n} ou @code{x}?}}
                
                @point{@student{@activity{Vá para @worksheet-link[#:page 8 #:name "double-width"] em sua apostila. Escreva uma função chamada @code{dobro-largura}, 
                                                  que recebe uma largura e uma cor. A função produz um retangulo sólido, seja qual for a medida
                                                  e a cor recebida. A largura dele é o dobro da altura.
                                         @itemlist[@item{Preencha a @vocab{Assinatura} para essa função.
                                                        @itemlist[@item{Qual é o Nome dessa função?}
                                                                   @item{Qual é o Domínio da função?}
                                                                   @item{Qual é a Imagem da função?}]}
                                                    @item{Usando a Assinatura que você fez, escreva dois @vocab{Exemplos} para essa função.
                                                          @itemlist[@item{Qual parte da Assinatura te ajuda a completar o lado esquerdo de um Exemplo?}
                                                                     @item{Qual parte da Assinatura te conta o que a função precisa como Entrada?}
                                                                     @item{Como a Imagem da função te ajuda a escrever um Exemplo?}]}
                                                    @item{olhando para os dois exemplos, circule as partes que são @italic{mutáveis}, e então nomeie com um bom @vocab{nome de variável}.
                                                          @itemlist[@item{Por que é útil escolher um nome de variável antes de definir a função?}]}]
                                         Agora escreva a @vocab{definição da função}, usando os Exemplos que você ja escreveu.}}
                        @teacher{Este é muito parecido com o problema anterior, e foi pensado para que os alunos sintam-se confortáveis em usar a receita de projeto antes de mergulhar em problemas mais complexos. 
                                 Lembre os alunos sobre funções aninhadas: Uma função onde a Imagem é um número pode ser usada dentro de uma função que precisa de um número em seu Domínio, como em 
                                 @code{(circle (* 2 25) "solid" "red")}.}}
                                   ]
         }
       
@lesson/studteach[
        #:title "Iniciando com Estruturas"
        #:duration "10 minutos"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will understand the limitations of atomic datatypes}]
        #:evidence-statements @itemlist[@item{}]
        #:product-outcomes @itemlist[@item{Students identify real-world behaviors that require data structures}]
        #:standards (list )
        #:materials @itemlist[@item{Structs bags: plastic bags containing eight cards (2 labeled "number", 2 "string", 2 "image", and 2 "boolean")}]
        #:preparation @itemlist[@item{}]
        #:prerequisites (list)
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
          @points[
                   @point{@student{@activity{Para cada item abaixo, descubra qual tipo de dado você usaria para representar dentro do Racket. 
                                             Você usaria um Número, String, Figura ou Booleano para:
                     @itemlist[@item{uma cor}
                               @item{a figura de um círculo}
                               @item{seu nome}
                               @item{sua idade}
                               @item{se algo está correto ou não}
                               @item{uma coordanada-x}
                               @item{a comida favorita do seu amigo}
                               @item{uma imagem do NinjaCat}
                               @item{um conjunto de coordenadas}]}
            Um conjunto de coordenadas precisa de dois números: um x e um y. Infelizmente, funções podem apenas retornar uma parte de dados de cada vez. 
            Você pode usar uma String para retornar dois números? Não, se você tiver que somar ou subtrair eles! Por que você acha que não podemos usar uma Figura ou Booleano para representar dois Números?}
             @teacher{Você pode ilustrar a importância de estruturas com uma atividade: Passe sacolas com cards de tipos de dados, e instrua os alunos a retiratem todos os card das 
                      sacolas, e colocá-los sobre a mesa na frente deles. Liste cada coisa acima, que poderia ser retornada por uma função do Racket, e peça aos alunos para levantar um cartão 
                      para mostrar qual tipo da dado cada um seria.}}
                    
                    @point{@student{Toda função que você poderia escrever ou usar no Racket pode apenas te devolver uma coisa. Ou seja, a imagem tem apenas um item nela. 
                                    Você precisa de um novo tipo de dado - algo que pode conter mais de uma coisa ao mesmo tempo. O Racket na verdade tem uma ferramenta que pode fazer isso, 
                                    que é chamada @vocab{Estrutura de Dados}, ou apenas "struct". Uma struct pode ter vários tipos de dados. Poderia ter dois números, 
                                    para representar coordenadas, ou poderia ter quantos números você quiser, como strings, figuras, booleanos e até mesmo outras structs! 
                                    (Vamos falar sobre estruturas aninhadas na próxima lição.)}
                           @teacher{Reserve duas cartas númericas; uma representa o x e outra o y de uma coordenada. Em seguida pegue sua sacola. Coloque os dois cards numéricos 
                                    dentro da sacola, e em seguida segure-o. "Quantas @italic{coisas} eu estou segurando? Uma!"}}
                   
                    @point{@student{Agora imagine que você colocou os dois números que representam as coordenadas x e y numa caixa. Se você fosse segurar a caixa, você 
                                    estaria segurando apenas uma coisa! Do mesmo modo, estruturas complexas podem ser definidas no Racket para armazenar várias coisas. Olhe mais alguns exemplos, 
                                    mas lembre-se que você precisa de uma "struct" para agrupar as coisas. 
                                    @activity{Quais item abaixo podem ser representados usando apenas um dado (e qual @italic{tipo} ele é?), e quais precisam de 
                                              uma struct para reunir várias partes de dados? 
                                              @itemlist[@item{o nome e a idade de um personagem}
                                                         @item{um sabor de sopa, e se está quente ou não}
                                                         @item{quantos bichos de estimação você tem}
                                                         @item{a figura de uma forma geométrica, quantos lados ela tem e sua cor}
                                                         @item{a direção que um avião está voando, e sua velocidade}]}}
                            @teacher{No Bootstrap 1,os jogos dos alunos foram feitos para manter o controle de alguns números; a posição-x do perigo e do alvo, e a posição-y 
                                     do personagem principal. No Bootstrap 2, os games serão muito mais complexos, e exigirão muito mais valores para mover personagens, testar condições, 
                                     ganhar pontos, etc. As Estrutura de Dados simplificam o código organizando muitos valores diferentes: Você não poderia representar cada parte do jogador 
                                     (posição, vida, inventário, etc.) com só um número ou string, mas você pode representar todas essas coisas com uma @vocab{estrutura de dados}.}}
                    ]
           }

@lesson/studteach[#:title "Autos"
        #:duration "20 minutos"
        #:overview ""
        #:learning-objectives @itemlist[@item{}]
        #:evidence-statements @itemlist[@item{}]
        #:product-outcomes @itemlist[@item{Students make use of a complex data structure: @code{Auto}}
                                     @item{Students define variables bound to autos}]
        #:standards (list )
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[@item{The Autos file [Autos.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] |  @editor-link[#:public-id "P7qS37u1ZH" "WeScheme"] preloaded on students' machines}]
        #:prerequisites (list)
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
          @points[
                   @point{@student{Vamos supor que você quer abrir uma Loja de Carros. Você busca e entrega o carro das pessoas, faz pinturas, carrega o turbo deles, etc. 
                                   Que tipo de coisa é um carro? É um número? String? Booleano? Você não poderia descrever todas as coisas importantes 
                                   sobre um automóvel com apenas uma dessas coisas. Porem, podemos dizer que nos importamos com algumas coisas em nossa loja que podem ser
                                   descritas usando essas tipos.
                                   @activity{Para cada um dos seguintes aspectos de um carro, pense sobre qual tipo de dados você poderia usar para representá-lo:
                                             @itemlist[@item{O modelo do carro. Que poderia ser "Rize", "H2", "XTitan", ou algo parecido.}
                                                        @item{Quantos cavalos de potência o carro tem.}
                                                        @item{De que tamanho são os aros.}
                                                        @item{De qual cor o carro é.}
                                                        @item{O valor do carro, quanto custa.}
                                                        @item{Qual tipo de dado podemos usar para representar o carro todo?}]}
                                   @bitmap{images/car3.png}                                                   
                                   Vamos representar as diferentes partes de um carro assim:
                                   @itemlist[@item{@code{modelo}: @bold{String}}
                                              @item{@code{potencia}: @bold{Numero}}
                                              @item{@code{rodas}: @bold{Numero}} 
                                              @item{@code{cor}: @bold{String}}
                                              @item{@code{valor}: @bold{Numero}}]
                                   Essas são as únicas coisas que você vai acompanhar em um carro, mas você pode imaginar como vocẽ pode extendê-lo para incluir outras coisas.}
                           @teacher{@management{Copie os campos da struct carro e seus tipos no quadro.}}}
                    
                    @point{@student{Agora que você sabe tudo o que é parte de um carro, você pode usar uma struct para representar o próprio carro. (Essa é a primeira vez que 
                                    você está usando structs, e elas vão aparecer em uma GRANDE parte de seu jogo.) Vamos dar uma olhada em como isso funciona.
                            @activity{Abra o @editor-link[#:public-id "P7qS37u1ZH" "Autobody Shop"] arquivo e leia a linha que começa com 
                                               @code{(define car1....)}
                                               @code{(define car1 (make-auto "M5" 480 28 "black" 50000))}
                                               @itemlist[@item{Qual é o nome deste carro?}
                                                          @item{Qual é o modelo deste carro?}
                                                          @item{Quantos cavalos de potência o @code{car1} tem?}
                                                          @item{Qual é o tamanho dos aros do @code{car1}?}
                                                          @item{De qual cor o @code{car1} é?}
                                                          @item{Finalmente, qual é o valor do @code{car1}?}]}
                            Como você pode ver, é realmente fácil fazer uma struct carro! Temos um pouco de código que diz ao computador a ordem de tudo o que entra... 
                            e vamos falar sobre isso em breve. Por agora, vamos praticar definir alguns carros novos.}
                            @teacher{A primeira linha do arquivo conta ao computador que um @code{carro} é uma nova estrutura, e o nome de seus campos. 
                                     Abaixo temos três carros definidos e atribuidos às variáveis @code{carro1}, @code{carro2}, e @code{carro3}. Pergunte aos alunos 
                                     sobre esses carros para que pensem sobre como eles poderiam definir os seus próprios carros.}}

                    @point{@student{@activity{Defina outro carro, chamado @code{novo-carro}. Para começar
                                                                         @itemlist[@item{como você definiria essa variável?}
                                                                                    @item{Qual função é usada para construir um carro?}
                                                                                    @item{O que vem primeiro dentro de uma estrutura carro?}] 
                                              Agora o que você espera que aconteça quando você digitar @code{novo-carro} na janela de interações? Clique em Run e experimente.}             
                                              @code{(define novo-carro (make-carro "Taurus" 300 20 "white" 5000))}}
                 @teacher{peça aos alunos que o conduzam através do processo de definir uma variável chamada @code{novo-carro} e fazer um carro de qualquer modelo, potência, tamanho rodas, etc. que eles queiram.
                          Se eles estão se confundindo em fazer um carro, mande-os checar sua página de assinaturas!}}
                 
                 @point{@student{@activity{Defina duas novas variáveis de seus carros favoritos. Chame eles de [seuNome]-carro (@code{natan-carro}, @code{samuel-carro}, @code{julio-carro}, etc),
                                           ou outro nome que preferir. Vocẽ pode construir qualquer tipo de carro que quiser, enquanto sua estrutura tiver os tipos certos nas ordens corretas!}}
                         @teacher{Repetição é o ponto chave nesta lição. Peça aos alunos que identifiquem cada parte da struct carro nos carros que eles definiram.
                                  Qual é o modelo do primeiro carro? Seu valor? Verifique se seus alunos estão usando as entradas na ordem correta!}}
                    
                    @point{@student{Quando vocẽ definiu seus novos carros, você usou uma nova função? @code{make-carro}.
                                    @activity{@itemlist[@item{Qual o nome dessa função?}
                                                        @item{E o seu domínio?}
                                                        @item{Quantas coisas estão em seu domínio?}]} As cinco coisas no domínio de @code{make-carro} são, na verdade, as cinco 
                                                              coisas que nós já listamos! Em sua apostila, na página de Assinaturas, vamos escrever:
@code[#:multi-line #t]{
; make-carro : String Numero Numero String Numero -> ___________________
; modelo, potencia, rodas, cor, valor}}
                            @teacher{Lembre os alunos para que copiem as assinaturas em suas apostila, e escreva as assinaturas você mesmo no quadro.}}
                    
                    @point{@student{Nas estruturas de dados, a ordem é muito importante: nós sempre queremos que a primeira string em @code{make-carro} seja o modelo do carro, o primeiro número 
                                    seja sua potência, etc. 
                                    @activity{Debaixo da assinatura, escreva o que cada parte do domínio de @code{make-carro} representa.}}
                            @teacher{}}
                    
                    @point{@student{Nós sabemos o nome e o domínio, mas e a imagem da função? Se eu der para @code{make-carro} uma String representando o modelo do carro, um número para a potência, 
                                    outro número para o tamanho das rodas, uma string para a cor, e um número para o valor do carro, o que eu deveria receber devolta? Um Carro! Mas o Racket não tem um tipo 
                                    de dado para um carro. Vamos ter que usar uma struct. O Racket não tem carros construídos dentro dele, então logo mais você aprenderá a definir suas próprias 
                                    estruturas para usar em SEU videogame.}
                         @teacher{Carros são o primeiro exemplo de definição de um novo tipo de dados que os alunos viram, mas o Racket lhe permite definir quantas novas estruturas você precisar para guardar
                                  qualquer combinação de valores. Os pontos importantes a serem lembrados sobre structs é que qualquer @code{make-[estrutura]} chamada, deve ter o mesmo 
                                  número de elementos e os mesmos tipos de dados como na sua definição, e suas entradas devem estar na @italic{mesma ordem} da definição. A Unidade 3 introduz 
                                  os alunos ainda mais nas estruturas, e na Unidade 4 eles começam a definir sua própria struct.}}
              
                 @point{@student{@activity{Depois de clicar em "Run", no WeScheme, digite @code{carro1} na janela de interações e aperte enter. O que você recebe devolta?}
                                  Isso faz sentido? O que aconteceu quando você digitou um número na janela de interações? Nós recebemos o mesmo número de volta! E se fosse uma string? Uma figura? 
                                  Um booleano? Se não fizermos nada com nossa entrada, ou não usamos alguma função nela, nós recebemos exatamente o que digitamos! Se você colocar um carro, você receberá um carro de volta!}
                         @teacher{Lembre os alunos uqe os valores sempre se resultarão. 4 resulta em 4, a string @code{"pizza"} resulta em @code{"pizza"}, e @code{carro1} resulta em
                                  @code{(make-carro "M5" 480 28 "black" 50000)}}}
                
                  @point{@student{Você pode ver como são seus carros usando a função fornecida abaixo da tela. É chamada @code{desenha-carro}, ela recebe um carro como entrada e 
                                  te retorna uma Figura com seu carro nela.
                                  @activity{Na Janela de Interações, digite @code{(desenha-carro carro1)} e veja o que acontece. Use a função com os carros que VOCÊ definiu!} @bitmap{images/car1.png}}
                         @teacher{Os alunos passarão muito tempo "desenhando" seus carros. Incentive-os a definir alguns carros novos, e alterar sua cor, tamanho das rodas, valor, etc. para verem suas 
                                  alterações refletidas nas imagens. Não se esqueça de lembrá-los de clicar em "Run" depois de fazer qualquer alteração!}}
                  ]
           }
                 
           

@lesson/studteach[#:title "Accessor Functions"
                  #:duration "10 minutes"
                  #:overview ""
                  #:learning-objectives @itemlist[]
                  #:evidence-statements @itemlist[]
                  #:product-outcomes @itemlist[@item{Students write code that extracts each field from those autos}]
                  #:standards (list)
                  #:materials @itemlist[]
                  #:preparation @itemlist[]
                  #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      
      ]{@points[
                @point{@student{Suponha que você queira OBTER o modelo do @code{novo-carro}. Você não se importa com o tamanho das rodas, potência, ou qualquer outra coisa- você só quer 
                                saber o modelo. O Racket tem uma função para isso, chamada @code{carro-modelo}. Se você der um carro para @code{carro-modelo}, ela retornará modelo 
                                desse carro. 
                                @activity{Se você digitar @code{(carro-modelo novo-carro)} na janela de interações, o que deveria resultar? Experimente! 
                                                      @itemlist[@item{Que tipo de coisa retornou: Um número, string, figura, ou uma estrutura(struct)?}
                                                                 @item{Pratique pegando o modelo de TODOS os carros que você ja definiu, usando @code{carro-modelo}}]}
                                @activity{Em sua apostila, volte para a página de assinaturas. Pense em que tipo de coisa você dá para a função @code{carro-modelo}, 
                                          e que tipo de dado você recebe de volta.
                                          @itemlist[@item{Qual o nome dessa função?}
                                                     @item{Qual o domínio dessa função?}         
                                                     @item{E o seu domínio?}
                                                     @item{Escreva a assinatura para @code{carro-modelo} em sua folha de assinaturas.}]}
                                @code{; carro-modelo : carro -> String}
                    
                                Claro, existem funções para acessar qualquer parte de um carro, não apenas o modelo! O que você pensa ser a assinatura para @code{carro-potencia}? 
                                Escreva em sua apostila.
                                @activity{Escreva as assinaturas para @code{carro-rodas}, @code{carro-cor} e @code{carro-valor}. Em seguida, experimente-os em seus carros! Elas fazer o que você esperou?}}
                 @teacher{Uma maneira de introduzir os alunos a usar essas funções é perguntar: "Como você obtém a potência de um carro?" "Como vocẽ consegue a cor de um carro?"
                          Ao longo do curso você pode configurar um sistema de pergunta e resposta com os alunos, onde a pergunta "Como você consegue o X de um Y?" 
                          irá solicitar o nome da função acessadora.}}
                 
                 @point{@student{As funções anteriores são conhecidas como @vocab{Funções Acessadoras}. Elas permitem que você especifique qual parte da struct você quer, sem 
                                 receber toda a estrutura de volta. Se quisermos saber se podemos comprar um carro, nós provavelmente vamos ver ser o valor é menor que
                                 uma certa quantia. Da mesma forma, seu queremos saber se um personagem está morto, só precisamos saber se sua vida é menor do que 0: 
                                 para saber disso, no memento não é preciso conhecer sua posição no jogo, ou a cor da dua armadura. Programadores usam muito acessadores, para tornar grandes 
                                 partes de dados (como estruturas) mais gerenciáveis.}
                         @teacher{}}]
         }
@lesson/studteach[#:title "Autobody Shop"
        #:duration "25 minutos"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will write complex functions that consume, modify and produce structures}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students define functions that produce an auto}]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      
      ]{
        @points[
                @point{@student{Agora você sabe tudo sobre como trabalhar com carros no Racket!
                                @activity{@itemlist[@item{Qual função constrói um carro?}
                                                     @item{Qual função desenha um carro?}
                                                     @item{Como você consegue obter o valor de um carro?}
                                                     @item{Como você obtém a cor de um carro?}]}
                                Mas você não quer apenas buscar um carro e devolvê-lo. Você tem uma loja de personalização! Você vai buscar o carro das pessoas e modificá-los, 
                                tornando-os melhor de alguma maneira, e devolvê-lo ao cliente. Vamos descobrir como fazer isso.}
                        @teacher{}}
                 
                 @point{@student{@activity{Vá para @worksheet-link[#:page 9 #:name "paint-job"] em sua apostila. Escreva uma função chamada @code{pintura},
                                           que muda a cor de um automóvel.
                                                   @itemlist[@item{Qual é o domínio dessa função? precisamos receber a instrução sobre qual carro vamos pintar, 
                                                                   E qual cor vamos usar.}
                                                              @item{O que você pensa que nossa loja vai retornar? Qual seria a imagem da função 
                                                                    @code{pintura}?}]}
               @code[#:multi-line #t]{; pintura : Carro String -> Carro
; muda a cor de um carro}
               Em seu primeiro exemplo, use o original @code{carro1} e pinte-o de roxo(purple). Nós sabemos que o cliente espera receber o carro de volta: você não levaria seu carro
               em uma loja e estar satisfeito em receber só um par de rodas devolta! Mas não retornaremos o mesmo carro- vai estar quase idêntico, mas apenas a cor mudou.}
                         @teacher{Pode não ser imediatamente óbvio aos alunos quando uma função retorna um carro, eles devem usar a função @code{make-carro} para 
                                  produzí-lo. Construir um carro força os alunos a pensar sobre cada campo e sua ordem. Pensar sobre o que exatamente
                                  compõe um carro e voltar para a assinatura de @code{make-carro} dá a eles muita prática com a estrutura carro e as funções 
                                  acessadoras.}}
                 
                 @point{@student{no momento que você escrever @code{make-carro}, você sabe que deve fornecer cinco coisas: o modelo, a potência, tamanho das rodas, cor, e o valor do carro. 
                                 Nós já sabemos qual modelo o carro deve ter: o mesmo modelo que foi recebido! Mas se vocẽ não soubesse exatamente qual string usar. 
                                 Como você poderia acessar APENAS o modelo do @code{carro1} e usá-lo em seu @code{make-carro}?
                       
    @code[#:multi-line #t]{(EXAMPLE (pintura carro1 "purple" (make-auto .....))}
                                @activity{@itemlist[@item{Os cavalos de potência também não mudam na pintura. Então como você consegue a potência do @code{carro1}?}
                                                     @item{O tamanho das rodas também não mudam com a pintura. Como você consegue o tamanho das rodas do carro1?}
                                                     @item{Mas e a cor? Nesse exemplo @code{pintura} está recebendo o @code{carro1} e a string @code{"purple"}. 
                                                           Assim, a cor desse carro será @code{"purple".}}]}
                                Não se esqueça da última parte da struct carro- o valor! A declaração de propósito de @code{pintura} não diz nada sobre o valor
                                do carro mudar, então como você consegue o valor original do carro1?
                                
@code[#:multi-line #t]{(EXAMPLE (pintura carro1 "purple") (make-carro (carro-modelo carro1)
                                                                      (carro-potencia carro1)
                                                                      (carro-rodas carro1)
                                                                      "purple"
                                                                      (carro-valor carro1)))}}
                         @teacher{}}
                 
                 @point{@student{@activity{Escreva mais um exemplo para a função @code{pintura}, desta vez usando para pintar o @code{carro2} de verde. 
                                          @itemlist[@item{Circule e nomeie o que muda entre os dois exemplos. De quantas variáveis essa função precisa?}
                                                     @item{Escreva a definição, usando os exemplos para te ajudar.}]}
                        
Depois de substituir as coisas que mudam pelas variáveis, sua definição deve ser semelhante a essa: 
@code[#:multi-line #t]{(define (pintura carro cor) (make-carro (carro-modelo carro)
                                                               (carro-potencia carro)
                                                               (carro-rodas carro)
                                                               cor
                                                               (carro-valor carro)))}}
                         @teacher{os alunos podem ser tentados a colocar a @code{cor} entre aspas, porque a cor do carro deve ser uma string. No entanto, o domínio 
                                  de @code{pintura} nos diz que a função recebe um carro e uma string, então qualquer cor que recebermos já estará 
                                  entre aspas. Valores resultam neles mesmos, então a string "color" não pode resultar em outra coisa a não ser "color".
                                  Se quisermos que a cor seja uma variável, ou um atalho para "purple", "green", "blue", etc, é preciso que sejam escritas SEM aspas.}}
                 
                 @point{@student{@activity{Vá para @worksheet-link[#:page 10 #:name "turbocharge"] em sua apostila. Quando você coloca turbo em um motor, ele tem
                                           mais força. Sua loja oferece um serviço de colocar turbo nos carros que aumenta em 20 cavalos a potência, mas todos o 
                                           resto se mantém igual. 
                    @itemlist[@item{Preencha a @vocab{Assinatura} e a @vocab{Declaração de Propósito} para a função.}
                              @item{Escreva dois @vocab{Exemplos} de como você usaria a @code{turbocharge}.}
                              @item{Circule e nomeie o que varia entre esses exemplos com nomes de @vocab{variáveis}.}
                              @item{Defina a função.}]}}
                         @teacher{Dê aos alunos tempo suficiente para praticar o uso das funções acessadoras, extrair partes da Estrutura Carro e modificá-las.}}]
         }

                                                                                                                                                                                @lesson/studteach[#:title "Closing"
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
        @points[@point{@student{Estruturas são uma poderosa ferramenta para representar dados complexos em um programa. Simples jogos, como Pong, precisam apenas
                                acompanhar alguns números de cada vez, como a posição da bola, posição de cada plataforma e os pontos. Mas se um jogo tem muitos 
                                inimigos diferentes, casa um com sua própria posição e vida, ou muitas fases com diferentes imagens no fundo, o jogo pode ficar 
                                complicado muito rápido, e as structs são uma ótima maneira de gerenciar e cuidar de todos os dados. Progrmadores podem fazer MUITO com
                                estruturas de dados, e nas próximas aulas você vai criar suas próprias estruturas para fazer um game personalizado.}
           @teacher{@management{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                          @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                          @item{Pass out exit slips, dismiss, clean up.}]}}
  
           }
 ]}
       }
       


