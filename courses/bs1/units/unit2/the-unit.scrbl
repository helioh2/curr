#lang curr/lib

@declare-tags[management]

@title{Unidade 2: Assinaturas, Strings e Figuras}
@unit-overview/auto[#:lang-table (list "Número" @code{+ - * / sq sqrt expt})]{
@unit-descr{Alunos são  iniciados no mapeamento e na representação de funções, em como o objeto Função
  existe como um meio de traduzir pontos de um Domínio para uma Imagem. Em conjunto com sua compreensão de
  Círculos de Avaliação, os alunos aprimoram seu entendimento das funções para incluir outros tipos de
  dados, incluindo Strings e Figuras.}
}
@unit-lessons{
@lesson/studteach[
     #:title "Revisão de Círculos de Avaliação"
     #:duration "30 minutos"
     #:overview "Alunos praticam conversão de expressões para Círculos de Avaliação, e então convertende-os em Código."
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "A-SSE.1-2" "BS-CE")
     #:materials @itemlist[]
     #:preparation @itemlist[@item{OPCIONAL: Distribua a folha de @(hyperlink "https://docs.google.com/document/d/1Odk9gkTW3zT1-AXLKZDYqJRnK1QNLSqVHRja6_jvyPg/edit?usp=sharing" "Atividade de Aquecimento").}
                              @item{Apostila dos alunos, e algo para fazer escrever.}]
     #:prerequisites (list "Order of Operations")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity[#:forevidence (list "BS-CE&1&2" "BS-CE&1&4" "A-SSE.1-2&1&3")]{
                       Pratique Círculos de Avaliação, usando a atividade da @worksheet-link[#:page 6 #:name "Circles-of-Evaluation-Practice-2"] 
                       em sua apostila.
                       @itemlist[#:style 'compact
	                         @item{em cada linha, há uma expressão matemática escrita na coluna do lado esquerdo.}
                                 @item{Examine cada uma das expressões, e desenhe o Círculo de Avaliação para cada uma na segunda coluna.}
                                 @item{Depois de converter todos eles, vá para a terceira coluna e converta cada um em um programa que pode ser escrito no computador. Não se esqueça de verificar seus parênteses, e ter cuidado ao deixar um espaço entre cada entrada.}]}}
                        @teacher{Certifique-se que os alunos tenham a oportunidade de desenhar Círculos de "fora para dentro"(começando com um grande círculo e preenchendo dentro), e de "dentro para fora"(começado com a expressão mais íntima, e caminhando para fora). @management{Isto pode ser feito como uma competição em equipe, em cada etapa as equipes preenchem um quadro da tarefa da apostila, Certifique-se de revisar depois de @bold{cada} etapa, para pegar erros de compreensão no início.}}
                        }
                 ]
         }
@lesson/studteach[
     #:title "Strings e Figuras"
     #:duration "20 minutos"
     #:overview "Alunos estendem a metáfora do Círculo de Avaliação para incluir novas funções e tipos de dados."
     #:learning-objectives @itemlist[@item{Alunos serão capazes de usar funções que produzem Figuras}
                                     @item{Alunos entenderão o conceito de tipo de dado}
                                     @item{Alunos entenderão que cada valor possui um tipo de dado}
				     @item{Alunos entenderão que tipos de dados descrevem as entradas e saídas das funções}
                                    ]
     #:evidence-statements @itemlist[@item{Quando recebem Círculos de Avaliação para uma nova expressão, funções ou tipos de dados, os alunos serão capazes de aplicar as regras para converter Círculos de Avaliação em código}
                                     @item{Alunos serão capazes de identificar o que cada argumento representa para produzir a imagem da função}
                                     @item{Alunos serão capazes de escrever expressões que geram figuras simples (triângulos, círculos, estrelas, etc)}
                                     @item{Dado um valor, os alunos serão capazes de identificar seu tipo de dado}
                                     @item{Dada uma expressão, os alunos serão capazes de identificar o tipo de dado de seu resultado}
                                     @item{Alunos serão capazes de diferenciar entre tipos e valores}]
     #:product-outcomes @itemlist[@item{Os alunos digitarão (avaliarão) expressões que resultam em Strings e Figuras}]
     #:exercises (list (make-exercise-locator "Strings-and-Images" "many-types-coe-to-code1"))
     #:standards (list "N-Q" "BS-PL.1" "BS-PL.2")
     #:materials @itemlist[@item{Ambiente de Edição (WeScheme ou DrRacket com o pacote bootstrap-teachpack instalado)}]
     #:preparation @itemlist[@item{Apostila dos alunos, e algo para fazer escrever.}]
     #:prerequisites (list "Intro to Programming")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[          
            @point{@student{O Círculo de Avaliação é uma poderosa ferramenta, e pode ser usada muito além do que com apenas números.
     Considere o Círculo de Avaliação mostrado aqui. @sexp{(star 50 "solid" "red")}
                            @activity[#:forevidence "N-Q&1&2"]{@itemlist[@item{Qual é o nome da função que está sendo usada?}
                                                 @item{Quantos argumentos foram dados para essa função?}
                                                 @item{O que você acha que essa função irá fazer?}]}
                             As mesmas regras usadas para transformar o Círculo de Avaliação em Código ainda se aplicam. Aqui está o código para esse Círculo: @sexp[#:form "code"]{(star 50 "solid" "red")}
                             }
                    @teacher{Os Alunos não precisam saber todas as respostas aqui – o objetivo é fazer com que eles apliquem o que eles já sabem sobre Círculos de Avaliação em uma nova expressão, e discutir com eles o que eles pensam que essa expressão poderia resultar. Peça à eles justificarem suas respostas, e explicarem porque seu pensamento está correto. Relembre os exemplos anteriores dos Círculos de Avaliação, será útil.}
                    }
             @point{@student{@activity[#:forevidence "BS-PL.1&1&2"]{Digite esse código na janela de Iterações, e pressione “Enter”. O que você recebeu de volta?
                                       @itemlist[@item{O que a função @code{star} faz?}
                                                  @item{Digite a expressão novamente, mas use um número muito maior que @code{50}. O que o primeiro argumento diz ao computador?}
                                                  @item{Digite a expressão novamente, mas desta vez use @code{"outline"} no lugar de @code{"solid"}, sendo cuidadoso e mantendo as Aspas Duplas! O que o segundo argumento diz ao computador?}
                                                  @item{Agora substitua @code{"red"} por alguma outra palavra (mantendo as Aspas Duplas!). O que o terceiro argumento diz ao computador?}]
                                       @editor-link[#:interactions-text "(star 50 \"solid\" \"red\")" "Clique aqui e experimente!"]
                                       } 
                             }
               
                     @teacher{Essa atividade foi pensada para que os alunos @italic{brinquem} com os novos termos e conceitos, a partir daí poderão desenvolver seu próprio modelo do que está acontecendo. Neste ponto, NÂO é necessário que o aluno entenda o código detalhadamente. Se você precisar dar a eles muitos trechos de código, não tem problema – apenas deixe eles brincarem!}
                     }
             @point{@student{Há um @vocab{tipo} de valor inteiramente novo sendo usado nestas expressões: @code{"solid"} e @code{"red"} são exemplos de um novo tipo de dados, chamado @vocab{String}.  
                             @bannerline{Uma String é qualquer coisa entre Aspas Duplas.}
     Da primeira vez que você aprendeu sobre valores, você viu que um programa nada mais é do que um valor, como um número.
     Se você digitar um número na janela de Iterações, por exemplo, retornará ele mesmo. Para lembrá-lo disso,
     tente calcular @code{716} na janela de Iterações.
     @editor-link[#:interactions-text "716"
    " O que você espera receber de volta?"]
     Já que Strings também são valores , o valor @code{“red”} também é um programa Válido. Assim como os valores do tipo Numero, Strings também retornarão elas mesmas na janela de Iterações.
                                          @activity[#:forevidence "BS-PL.1&1&1"]{Tente colocar diferentes Strings na Janela de Iterações. O que acontece se você pôr várias palavras entre Aspas Duplas? E números entre Aspas?}
                                       }
                     @teacher{Alunos devem ver Strings como um tipo semelhante ao tipo Numero: um tipo diferente de valor, mas que ainda o programa pode computá-lo e servir de argumento para uma função. Note que o Numero 42 e a String “42” são valores diferentes! Você pode somar o Número 42 à outro número, porém não pode somar a String “42” á nenhum número.}
                     }
             @point{@student{Essa expressão também inclui uma nova @vocab{função} chamada @code{star}. Assim como a função @code{+} precisa de dois números como entrada, a função @code{star} precisa de @italic{um Numero e duas Strings}, e produz um novo tipo de dado, do tipo @vocab{Figura}.
                            @activity[#:forevidence "BS-PL.1&1&1"]{Qual é o tipo de dado de cada um dos valores listados abaixo – Numero, String ou Figura? 
                                      @itemlist[@item{@code{42}}
                                                 @item{@code{"Oi, mãe!"}}
                                                 @item{@code{9273482.42}}
                                                 @item{@bitmap{images/TriangleImage.png}}
                                                 @item{@code{"84729"}}
                                                 @item{@code{"Strings e Números são diferentes tipos de dados!"}}
                                                 @item{@bitmap{images/coffee-cup.png}}]
                                                 }}
                     @teacher{Os alunos viram até agora Números, Strings e Figura. Você deve certificar-se de que eles conseguem identificar corretamente os exemplos a seguir.}
                     }
             @point{@student{Você também viu expressões que @vocab{produzem} valores, como em @code{(* 16 4)}, que produzirá um Numero, porém outras expressões podem produzir Strings e Imagens. 
                             @activity[#:forevidence "BS-PL.1&1&2"]{Que tipo de dado cada uma das expressões a seguir irão produzir?
                                      @itemlist[@item{@code{(/ (+ 7 2) 3)}}
                                                 @item{@code{(star 500 "solid" "purple")}}
                                                 @item{@code{(star (+ 1 3) "outline" "blue")}}
                                                 @item{@code{(- (* 4 2) (+ 1 0))}}
                                                 ]}
                             @activity[#:forevidence "BS-M&1&3"]{Alguns dos itens listados abaixo são @vocab{tipos}, enquanto outros são @vocab{valores}. Você pode diferenciá-los?
                                       @itemlist[@item{792.24}
                                                 @item{String}
                                                 @item{"hi, mom!"}
                                                 @item{"91"}
                                                 @item{Número}
                                                 @item{Figura}
                                                 @item{102}
                                                 ]}
                             }
                     @teacher{Para prática adicional, os alunos deve identificar o Tipo de cada argumento dessas expressões. Indo Além - se o tempo permitir, você pode começar a trabalhar @lesson-link[#:name "Manipulating-Images" #:label "Manipulação de Imagens"] ou @lesson-link[#:name "Making-Flags" #:label "Construindo Bandeiras"].}
                     }
             ]}
@lesson/studteach[
     #:title "Assinaturas"
     #:duration "35 minutos"
     #:overview "Alunos aprendem a descrever funções e seus comportamentos, usando formalismos incluindo Assinaturas (Domínio e Imagem) e Tipos de Dados."
     #:learning-objectives @itemlist[@item{Alunos começarão a escrever e usar Assinaturas, que resumem o nome, domínio, e imagem de uma função}
                                     @item{Alunos aprenderão como usar uma função baseada na informação de sua Assinatura}
                                    ]
     #:evidence-statements @itemlist[@item{Dada uma expressão, os alunos serão capazes de identificar o nome de uma função que está sendo utilizada}
                                      @item{Dada uma expressão, os alunos serão capazes de identificar quantos argumentos são utilizados}
                                      @item{Dado um valor, os launos serão capazes de identificar seu tipo}
                                      @item{Alunos serão capazes de identificar as partes de uma assinatura}
                                      @item{Alunos serão capazes de diferenciar entre assinaturas e chamadas de funções}
                                      @item{Dado um exemplo de uma função sendo aplicada, os alunos serão capazes de escrever uma assinatura para essa função}]
     #:product-outcomes @itemlist[@item{Alunos escreverão Assinaturas para expressões aritméticas, bem como para expressões que produzem figuras}]
     #:exercises (list (make-exercise-locator "Contracts" "id-expr-pieces1")
		       (make-exercise-locator "Contracts" "match-contracts-exprs1"))
     #:standards (list "BS-PL.2" "BS-IDE" "N-Q" "F-IF.1-3")
     #:materials @itemlist[@item{Ambiente de Edição (WeScheme ou DrRacket com o pacote bootstrap-teachpack instalado)}]
     #:preparation @itemlist[@item{Computador para cada aluno (ou par), executando WeScheme ou DrRacket}
                              @item{Apostila dos alunos, e algo para fazer escrever.}]
     #:prerequisites (list "Intro to Programming")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Você já viu algumas funções que precisam de dois Números como Argumentos, como a função @code{+}, e @code{-}. Enquanto que, a função @code{star} precisa de um Numero e Duas Strings. As funções possuem diferentes argumentos de entrada, e precisamos achar uma maneira de manter o controle dos requisitos de Entrada para cada função.
                        @bannerline{O Domínio de uma função é o dado que ela espera receber como entrada.}
                        @activity[#:forevidence (list "F-IF.1-3&1&1")]{Por que é útil conhecer o @vocab{Domínio} de uma função?}
                        Ao manter uma lista de todas as funções em uma linguagem, e seu Domínio, programadores podem facilmente checar como cada função é usada. Entretanto, é importante também manter controle de que Dado cada função produz! Por exemplo, um programa não usaria a função @code{star} se ele está tentando produzir um Numero, porque @code{star} produz somente Figura.
                        @bannerline{A Imagem de uma função é o dado que a função produz.}
                        Domínios e Imagens ajudam programadores a escrever um código melhor, prevenindo erros bobos e dando a eles dicas do que fazer em seguida. O programador que quiser usar @code{star} ode checar no Domínio e imediatamente ver que o primeiro Argumento precisa ser do Tipo Numero(como @code{100}), sem ter que lembrar disso toda hora. Ao invés de escrever um simples numero, o programador pode escrever uma expressão matemática, como @code{(* 25 4)}. Nós sabemos que esse código retornará um valor(Numero) olhando na Imagem de @code{*}; portanto, o resultado de @code{*} pode ser usado no lugar de qualquer valor Numero.}
                        @teacher{Domínio e Imagem são conceitos essenciais, que podem ser reforçados modificando uma simples expressão; ex. @code{(+ 1 2)}, nós sabemos que a função @code{+} recebe dois Números, no caso 1 e 2. Contudo, esses números podem ser substituídos por @italic{alguma outra expressão} – expressão que produz um Número. Peça aos alunos sistematicamente substituir cada valor, com uma expressão, pedindo-lhes para justificar a sua substituição usando o Domínio e Imagem de cada função.}
                        }
                 @point{@student{Quando programadores escrevem os Domínios e Imagens de cada função, eles escrevem as chamadas @vocab{assinaturas}, para manter o controle do que cada função precisa.
                 @bannerline{A Assinatura possui três partes: o Nome, Domínio e Imagem da função.}
                 A assinatura de @code{star} é:
                 @code[#:multi-line ""]{; star: Number String String -> Image}
                 Isto demonstra que o @vocab{Nome} da função é @code{star}, seus argumentos de entrada são um Numero e duas Strings que representam o Domínio, e produz uma Figura como Imagem. Escrevemos a Assinatura usando Tipos de Dados ao invés de Valores porque podemos ser mais amplos: a Figura da estrela pode ter qualquer tamanho, então o Domínio de @code{star} especifica que poderia ser @italic{qualquer número}. A Assinatura nos diz como cada função pode ser usada.}
                     @teacher{}
                     }
             @point{@student{Assinaturas são tão úteis que devemos manter uma lista delas em algum lugar. Nas últimas páginas do seu livro contém uma folha com o nome “Assinaturas”. Escreva a assinatura da função @code{star} na primeira linha da sua tabela.}
                    @teacher{São erros comuns dos alunos quando escrevem assinaturas: colocarem valores(exemplo: @code{“red”)} ao invés do Tipo de Dado (exemplo:”string”); e também esquecem argumentos. Leia as Assinaturas dos Alunos cuidadosamente, pois isso influenciará muito no decorrer da aprendizagem.}}
             @point{@student{Aqui está o contrato de uma nova função:
                 @code[#:multi-line ""]{; rectangle: Number Number String String -> Image}
                 @activity[#:forevidence (list "BS-PL.2&1&1")]{@itemlist[@item{Qual é o @vocab{Nome} dessa função?}
                                      @item{Quantos itens o @vocab{Domínio} dessa função possui?}
                                      @item{Qual o tipo de dado de cada item do Domínio?}
                                      @item{Qual é a @vocab{Imagem} dessa função?}
                                      ]}
                 A Assinatura diz a você exatamente como usar a função, escrevendo seu nome e, em seguida, usando @vocab{valores} para cada um dos argumentos no 
                 @vocab{Domínio}. Aqui está um exemplo de uma expressão usando @code{rectangle}:
                 @code[#:multi-line ""]{(rectangle 100 50 "solid" "blue")}
                 @editor-link[#:interactions-text "(rectangle 100 50 \"solid\" \"blue\")"
                                                  "O que você achar que este código irá produzir?"]}
                     @teacher{Peça aos alunos experimentarem mudar os valores dos argumentos, sempre chamando a atenção ao Domínio da função.}
                     }
             @point{@student{Escrevendo a Assinatura para nossas funções, podemos facilmente ver como elas são usadas.
                             @activity[#:forevidence (list "BS-PL.2&1&1" "F-IF.1-3&1&1")]{A Assinatura de @code{+} é mostrada a seguir.
                                       @code[#:multi-line ""]{; +: Number Number -> Number}                
                                       Você pode escrever a Assinatura para @code{*}, @code{-}, @code{/} e @code{sqrt}?}}
                     @teacher{}
                     }
             @point{@student{Agora que você sabe como usar uma Assinatura para escrever uma expressão, aqui vai a Assinatura de algumas novas funções que produzem Figuras:
                             @code[#:multi-line ""]{; ellipse:  Number Number String String -> Image
                                                    ; triangle: Number String String        -> Image
                                                    ; circle:   Number String String        -> Image}
                             @activity[#:forevidence (list "BS-PL.2&1&1" "BS-PL.2&1&3")]{Veja se você consegue descobrir como usar essas funções para desenhar novas formas!
                                                                                         @editor-link[#:interactions-text "(ellipse 150 40 \"outline\" \"black\")"
                                                                                                                          "Aqui está um exemplo para você começar"]}
                             }
                     @teacher{Você deve começar a direcionar os alunos a escreverem expressões mais sofisticadas, substituindo valores Numero com expressões inteiras (por exemplo, @code{(star (* 10 5) "solid" "purple"). Alunos devem estar confortáveis olhando a subexpressão como um único argumento para a função circundante. Faça com que os alunos escrevam PRIMEIRO as Assinaturas em seus cadernos antes de deixar eles brincando com as funções.}}
                     }
             @point{@student{Aqui está uma expressão que usa uma função muito interessante: @code{(bitmap/url "http://bootstrapworld.org/images/icon.gif")}.  Essa função pega como entrada a URL de qualquer imagem que você pode encontrar online, e irá produzir essa figura que você pode usar em seu programa.
                             @activity[#:forevidence (list "BS-PL.2&1&1")]{@itemlist[@item{Quais são as três partes da Assinatura?}
                                                  @item{Qual o Nome dessa nova função?}
                                                  @item{Quantos	itens estão presentes em seu Domínio?}
                                                  @item{Qual o Domínio da função?}
                                                  @item{O que essa expressão irá retornar?}]}                             
                             }
                     @teacher{Se você quer que seus alunos pratiquem usando @code{bitmap/url}, é recomendado usar Motores de busca, como o @(hyperlink "https://images.google.com" "Google Imagens") ou @(hyperlink "http://www.bing.com/images" "Bing Imagens"). Tenha certeza de que os alunos peguem a URL da Imagem, e @italic{não da página web que a contém.}}
                     }
               @point{@student{Assinaturas ajudam programadores a escrever código, então é sempre uma boa ideia escrever Assinaturas para cada função que você ver. 
                               @activity[#:forevidence (list "BS-PL.2&1&2" "F-IF.1-3&1&1")]{
                                                                                            Você pode descobrir a Assinatura de uma função, apenas olhando um
                     exemplo de código? @editor-link[#:interactions-text "(text \"Bootstrap\" 30 \"purple\")"
                                                     "Olhe a função que está sendo usada aqui!"], 
                     e veja se você pode escrever o @vocab{Nome}, @vocab{Domínio} e @vocab{Imagem} dela.
                                         
                                         Não confunda a Assinatura da função com o Código da função! Alguns dos itens listados abaixo são Assinaturas, mas outros são apenas exemplos dessas funções em uso. Você pode dizer quais são Assinatura e quais são códigos?
                                         @itemlist[@item{@code{; triangle : Number String String -> Image}}
                                                    @item{@code{(triangle 100 "outline" "blue")}}
                                                    @item{@code{(square (+ 200 5) "solid" "red")}}
                                                    @item{@code{; square : Number String String -> Image}}]}
                                         }
                       @teacher{}
                       }
                @point{@student{Às vezes, cometemos erros enquanto estamos escrevendo código, e usamos um valor que viola a Assinatura. Felizmente, o computador identifica esses casos e fornece @vocab{Mensagens de Erro} para nos ajudar a encontrar e corrigir o problema. Uma mensagem de erro destaca o trecho que contém o erro e mostra onde o computador encontrou o problema.  
                       @activity[#:forevidence (list "BS-IDE&1&2")]{Para cada expressão incorreta a seguir, olhe o código
                     e veja se descobre o que está errado. Então, digite o código
                     na janela de Iterações e veja a Mensagem de Erro recebida.
                     A Mensagem de Erro mostrou o mesmo erro que você identificou? 
                                 @itemlist[@item{@code{(+ 4 "hi")}}
                                           @item{@code{("hi" + "mom")}}
                                           @item{@code{(* (+ 4 5) "pizza")}}
                                           @item{@code{(star "solid" "red" 40)}}
                                           @item{@code{(star "40" "solid" "red")}}
                                           @item{@code{(star 40 "red" "solid")}}
                                           @item{@code{(star 40 "solid" "yelow")}}
                                           @item{@code{(star (* 4 10) "blue")}}
                                           @item{@code{(cirle 25 "outline" "blue")}}
                                          ]}}
                       @teacher{Prática controlada com mensagens de erro ajudam os alunos a ganharem confiança e lidar melhor com erros mais tarde. É bom se os alunos não detectarem o erro no primeiro momento(antes da mensagem de erro), porém ter o aluno explicando o erro com suas próprias palavras deve reforçar o uso correto dessas funções ao longo do curso.}}
             ]}
       
@lesson/studteach[
     #:title "Enceramento"
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
        @points[@point{@student{Esse lição aumenta o que você já sabe sobre Círculos de Avaliação, expressões, e código para trabalhar com Strings e Figuras.
                    Você aprendeu que tudo o você já sabia sobre Números também se aplica à Strings e Figuras (fará seus 
                    programas mais interessantes). Você também aprendeu como usar funções do tipo Figura e a criar suas próprias figuras, e como
                    usar figuras já existentes em seu programas (através de @code{bitmap/url}).}
                        @teacher{@management{@itemlist[@item{Peça a alunos que digam voluntariamente o que aprenderam na lição}
                                                        @item{Comportamentos que você valoriza: trabalho em equipe, de anotações, participação, etc}
                                                        @item{Pass out exit slips, dismiss, clean up.}]}}
                        }
                @point{@student{Na próxima unidade , você aprenderá como criar suas próprias funções para salvar seu trabalho escrevendo expressões (isto será uma parte
                    essencial na construção do jogo). Você também vai começar a personalizar seu jogo com figuras
                    para os elementos em seu design do jogo.}
                       @teacher{}}
                        ]}
}

