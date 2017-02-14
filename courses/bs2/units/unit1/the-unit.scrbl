#lang curr/lib

@title{Unidade 1: Tudo o que você aprendeu no Bootstrap 1...}

@declare-tags[management]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
   @unit-descr{Alunos revisarão quase todo o conteúdo do Bootstrap 1, incluindo Círculos de Avaliação, Assinaturas, Expressões que trabalham com strings e figuras, Definições de Variáveis, Definições de Funções, e a Receita de Projeto.}
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
      #:preparation @itemlist[]
      #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      
      ]{
        @points[@point{@student{Bem-vindo de volta ao BootStrap! Para começar, você vai praticar tudo, desde o BootsTrap 1. O quanto você ainda se lembra?}
                       @teacher{@management{Introduce teaching staff. Give some background: age, where you're from, something surprising about yourself, favorite food, etc. Anything to allow kids to connect. Have students introduce themselves. Set expectations and rules for the class.}}}
                ]}
       
@lesson/studteach[
        #:title "Expressões"
        #:duration "30 minutos"
        #:overview "Students review Racket expressions, defining variables, and circles of evaluation from Bootstrap 1"
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
        #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket}
                                @item{If using DrRacket, make sure the Review.rkt file is loaded}
                                @item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbook"] folders with names on covers, and something to write with}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{@points[
           @point{@student{@activity{Abra @editor-link[#:public-id "pTQwdxSDp2" "esse link"] em uma nova janela. No início da janela de definições, temos algumas @vocab{variáveis} definidas. 
                                          @itemlist[@item{Qual o nome das variáveis que já foram definidas? Qual o valor de cada variável?}
                                                     @item{Qual seria o resultado se você digitasse o nome de cada variável na Janela de Interações? Pense em um palpite, então clique em "Run" e digite o nome de cada variável na janela de Interações. Seus palpites estavam certos?}]
                                          Dê uma olhada na variével @code{OUTLINE} na linha 20. 
                                          @itemlist[@item{Qual forma ela desenha?}
                                                     @item{Qual o tamanho que ela irá ter?}
                                                     @item{Ela será sólida ou apenas o contorno?}
                                                     @item{Que cor ela tem?}]
                                          Na janela de Interações digite @code{OUTLINE}. Tem a forma que você esperava?}
O problema é que usamos um nome confuso para uma variável: o nome é "outline"(representa contorno), mas a figura era do tipo "solid". Lembre-se: escolha o nome das variáveis com atenção!}
                   @teacher{Revise a Interface do DrScheme ou a IDE do WeScheme.
                            Relembre os alunos sobre a importância de bons nomes de variáveis: eles fazem o código mais legível, e um nome descritivo torna claro o que está sendo definido.}
                   }
           @point{@student{@activity{Em seu arquivo de revisão, defina:
                           @itemlist[@item{dois Números adicionais}
                                     @item{duas Strings adicionais}
                                     @item{um Booleano a mais}
                                     @item{uma Figura a mais}]
                   e pratique e confira os valores usando a janela de interações.}
Agora temos valores, e sabemos como definir atalhos para eles. Contudo, também temos várias funções internas que nos permitem brincar com esses valores. 
@activity{Quais funções que você conhece que trabalham com números? De quantas você se lembra?}}
                   @teacher{Relembre os alunos que operações aritméticas, como +, -, *, e / são funções.}
    }
           @point{@student{Você já viu um código em Racket antes, mas você se lembra do Círculo de Avaliação? Os Círculos permitem que você visualize a 
                           ordem das operações e facilmente traduzir expressões matemáticas em código do Racket. Vamos revisar os Círculos de Avaliação! 
                           @activity{@itemlist[@item{Como você desenha um Círculo de Avaliação para a expressão 10 - 6 ?}
                                               @item{Qual é a função na expressão acima?}
                                               @item{Em qual posição o nome da função é desenhada no Círculo?}
                                               @item{Quais são os números que a função @code{-} recebeu como Entrada nesse expressão?}
                                               @item{Onde os valores de Entrada são desenhados no círculo? Em que ordem os números devem aparecer?}]}
A expressão 10 - 6 pode ser desenhada como um Círculo de Avaliação assim: 
@bitmap{images/CE1.png}
@activity{Como você converte esse Círculo de Avaliação para código em Racket?  
          @itemlist[@item{Qual é o primeiro caractere que você digita quando converte um Círculo de Avaliação? (Dica: se vocẽ partir um círculo no meio, você fica com duas coisas que se parecem com quais tecla do teclado?)}
                    @item{O que vem a seguir em uma expressão Racket, dentro dos parênteses?}
                    @item{Onde você olha a seguir? Como você sabe qual entrada vem primeiro no código Racket?}
                    @item{Como você termina, ou fecha uma expressão em Racket?}]}
O Círculo de Avaliação acima foi convertido para esta expressão em Racket: @code{(- 10 6)}. Por que estaria errado escrever @code{(- 6 10)}?
@activity{Vá para a @worksheet-link[#:page 3 #:name "circles-competition"] em sua apostila. Cada linha tem uma expressão matemática. Você terá que converter as expressões para Círculos de Avaliação, e depois converter o Círculo em código Racket.}}
                   @teacher{Revise os círculos de avaliação e círculos aninhados com números, bem como convertê-los para código em Racket.
                           Relembre os alunos que as entradas são lidas da esquerda para a direita, e essa ordem é importante. Certifique-se de desafiar os alunos com 
                           Círculos que estão aninhados pelo menos em dois níveis de profundidade. Muitos alunos que são capazes de resolver aninhamentos simples ainda encontram dificuldade 
                           quando lidam com expressões mais complexas.}
                   }
           ]}
       
@lesson/studteach[
        #:title "Assinaturas"
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
          @points[
                  @point{@student{É importante manter o controle de como essas funções funcionam, e o Bootstrap 1 introduziu a ideia de @vocab{Assinaturas}. A assinatura para a função @code{star} é mostrada abaixo. @code[#:multi-line ""]{; star: Numero String String -> Figura}
As Assinaturas resumem três partes essenciais sobre uma função: 
@itemlist[@item{O @vocab{Nome} da função: neste caso, @code{star}}
                    @item{O @vocab{Domínio} da função, que são os tipos de dados que a função recebe: neste caso, um Número e duas Strings.}    
                    @item{A @vocab{Imagem} dessa função, é o tipo de dados que essa função produz: nesse caso uma Figura.}]
@bannerline{Toda assinatura possui três partes: Nome, Domínio e Imagem!}
A assinatura é uma anotação que escrevemos para nós mesmos sobre como usar a função. Assim como no Bootstrap 1, será muito útil manter o registro das assinaturas de cada função que você aprender. A primeira página da sua apostila tem uma tablea chamada "Assinaturas", onde você pode (e deve!) copiar cada assinatura que você for aprendendo. 
@activity{A Assinatura para @code{+} é mostrada a seguir.
          @code[#:multi-line ""]{; +: Numero Numero -> Numero}                
Escreva as Assinaturas para @code{*}, @code{-}, @code{/} e @code{sqrt}}}                             
       @teacher{Enfatize aos alunos que a assinatura de uma função te diz MUITO sobre ela. Também pode ser útil pedir-lhes para pensar em motivos de porque Assinaturas são uma coisa boa, para que eles sejam capazes de dizer com sua própria voz. @management{Certifique-se de escrever toda assinatura aprendida em sua apostila.} 
                Revise assinaturas de funções que produzem figuras, como @code{circle}, @code{triangle}, @code{rectangle}, @code{ellipse}, etc.}}
                   @point{@student{@activity{Abaixo temos algumas expressões usando funções que você viu no Bootstrap 1. Para cada uma, identifique qual função está sendo utilizada e escreva sua Assinatura em sua página de Assinaturas. Se precisar de ajuda, experimente digitar as expressões em seu computador. @itemlist[@item{@code{(circle 75 "solid" "red")}}
                    @item{@code{(rectangle 20 30 "outline" "green")}}
                    @item{@code{(ellipse 85 100 "solid" "pink")}}
                    @item{@code{(text "Hello world!" 50 "blue")}}]}}
                           @teacher{Para prática adicional, peça aos alunos que escrevam assinaturas para problemas escritos. Esse é um ótimo momento para lembrá-los sobre conexões com álgebra e aplicar habilidades aprendidas no Bootstrap em sua aulas de matemática.}}
                   ]
           }
          
@lesson/studteach[
        #:title "A Receita de Projeto"
        #:duration "30 minutos"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students review the Design Recipe and become comfortable using it to write functions}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students define functions to meet a goal, or problem statement.}]
        #:standards (list)
        #:materials @itemlist[@item{Design Recipe Sign}]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
          @points[@point{@student{Você revisou como definir valores, e como usar assinaturas para funções internas. Você se lembra como definir sua própria função? No Bootstrap 1, você usou uma ferramenta chamada @vocab{Receita de Projeto} para definir funções de vários problemas. Vamos rever os passos da Receita de Projeto: 
                                  @activity{Vá para @worksheet-link[#:page 4 #:name "Fast-Functions"] em sua apostila.}
                                  Aqui temos uma definição de função: @code[#:multi-line #t]{;dobro : Numero -> Numero
                                                                                             ;recebe um número e o multiplica por dois
                                                                                             
                                                                                             (EXAMPLE (dobro 5) (* 2 5))
                                                                                             (EXAMPLE (dobro 7) (* 2 7))

                                                                                             (define (dobro n)  (* 2 n))}
                                  @bannerline{Passo 1: Escreva a Assinatura e a Declaração de Propósito}
                                  @activity{@itemlist[@item{Qual é o @vocab{Nome} desta função? Como você sabe?}
                                                       @item{Quantas entradas ela tem em seu @vocab{Domínio}?}
                                                       @item{De qual tipo de dado o @vocab{Domínio} é?}
                                                       @item{Qual o foi o Nome dado para a entrada?}
                                                       @item{Qual é a @vocab{Imagem} dessa função?}
                                                       @item{Com suas próprias palavras, o que essa função faz?}
                                                       ]}
                                  A @vocab{Assinatura} é uma maneira de pensar sobre a função de um modo geral, sem ter que se preocupar exatamente como ela funcionaŕa ou como será usada. Começando com simples perguntas com essas, tornará os próximos passos @bold{mais} fáceis de pensar.}
                          @teacher{@management{Review the importance of definitions for students (Defining values helps cut down on redundancy and makes future changes easier, defining functions allows for simplicity and testability. Be sure to use vocabulary regularly and carefully, pushing students to use the proper terms throughout.)}
                                   A Receita de Projeto é uma ferramenta útil para alunos resolverem problemas escritos e à quebrá-los em partes menores (Assinatura, declaração de propósito, EXAMPLES, e código). Em vez de pular direto para escrever o código, os alunos devem primeiro observar quais tipos de dados a função receberá e produzirá, e praticar usando suas próprias palavras para descrever o que a função faz. Depois dessa etapa, a Assinatura e a Declaração de Propósito podem ser invocadas para escrever EXAMPLES para essa função.}}
                   
                  @point{@student{@bannerline{Passo 2: Dê Exemplos}
                                  O que acontece com a entrada da função? 
                                  @activity{Olhe para os dois Exemplos escritos acima. @itemlist[@item{O que aconteceria se você digitar @code{(dobro 5)} na janela de interações? E digitar @code{(dobro 7)}?}
                 @item{O que aconteceria se você mudasse o nome da entrada @code{n} para alguma outra coisa, como @code{x}? Onde mais eu teria que mudar?}]}
Uma vez que conhecemos a Assinatura de função, torna-se fácil de escrever exemplos: nós começamos usando a função com alguma(s) entrada(s) (@code{(dobro 5)}), em seguida escrevemos em código Racket o que esperamos que o computador faça com essas entradas. (Neste caso, @code{dobro} multiplicará a entrada por 2.)}
                           @teacher{Escrever Exemplos é parecido com "mostrar seu trabalho" na aula de matemática: Você quer ver @italic{como} os alunos chegaram nas respostas, e não apenas se elas têm as respostas. É também muito mais fácil depurar uma função usando a receita de projeto, porque você pode checar individualmente cada seção procurando erros. Escrever EXAMPLEs para código é também chamado de "teste de unidade", algo que os programadores profissonais fazem o tempo todo.}}
                           
                    @point{@student{@activity{Em sua apostila, escreva a assinatura e dois Exemplos para uma função chamada @code{triplo}, que recebe um número como entrada e o multiplica por 3.}
                                    Agora olhe para seus dois Exemplos. Qual é a única coisa que muda de um para o outro? @activity{Em sua apostila, circule o que é mutável, ou @vocab{variável}, entre seus dois EXAMPLEs.} 
               A única coisa que muda é o número dado a @code{triplo} e multiplicado por 3. Relembre do Bootstrap 1 que você já circulava e nomeava o que mudava em cada exemplo, isso torna incrivelmente fácil definir uma função! Tudo o que você precisa fazer é substituir a coisa que muda por um nome! 
               @bannerline{Passo 3: Defina a função}
               @activity{Agora escreva o cabeçalho e o corpo para @code{triple}. Não se esqueça de substituir a coisa que muda por uma variável!}}
            @teacher{Assim como escrever Assinaturas nos ajuda e escrever Exemplos, escrever Exemplos torna mais fácil escrever a definição da função: circulando o que muda entre os exemplos fica óbvio o que é a coisa @italic{mutável} e onde precisamos usar nossa @italic{variável} na função. Você vai querer conectar explicitamente cada etapa da Receita de Projeto. Peça aos alunos que justifiquem cada parte de sua Assinatura referindo-se ao problema descrito, para justificar cada passo de seus Exemplos referindo-se ao problema e a assinatura, e finalmente para justificar cada passo da definição referindo-se ao Problema Descrito, Assinatura e Exemplos. O mesmo nome de variável pode ser usado em múltiplas funções, como na matemática(onde muitas funções usam X como nome de variável, por exemplo)
                     @management{Essa atividade pode ser feita como uma competição em equipe: as equipes têm um minuto para escreverem a assinatura e dois exemplos para @code{triplo}, e outro minuto para o cabeçalho e corpo da função. Atribua pontos para as equipes que completam cada função.} Certifique-se de que os alunos preencham TODA a assinatura, com dois exemplos, antes de circularem o que varia on corpo da função. Construa esses bons hábitos no início do curso e incentive!}}                                         
          @point{@student{Usando a Receita de Projeto, tente resolver os seguintes problemas:
                          @activity{@itemlist/splicing[
                               @item{Escreva a função @code{mais1}, que recebe um número e adiciona um á ele}
                               @item{Escreva a função @code{misterio}, que recebe um número e subtrai 4 dele}
                               @item{Escreva a função @code{ponto-vermelho}, que recebe um número e desenha um círculo sólido vermelho, usando o número como raio}]}
            }
          @teacher{@code{ponto-vermelho} é uma função difícil de escrever, e alguns alunos não sabem o que fazer. Isto é intencional! Dê a eles algum tempo para quebrar a cabeça, e depois os ajude a pensar.}
          }]}
                                               
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
      ]{@points[@point{@student{Você acabou de revisar a primeira metade do curso Bootstrap 1 em apenas 1 unidade! Ao longo do Bootstrap 2 você usará todos os conceitos e muitas funções que aprendeu no Bootstrap 1. Você conhecerá novos tipos de dados, funções e conceitos de programação. É claro, tudo isso com a ajuda de sua velha amiga Receita de Projeto, que irá ajudálo a escrever suas próprias funções para seu videogame! Agora que estamos no Bootstrap 2, os jogos que você será capaz de criar serão mais interativos e avançados que no Bootstrap 1. Há muito o que aprender... até a Unidade 2!}
                       @teacher{}}
                                  ]
         }
       }