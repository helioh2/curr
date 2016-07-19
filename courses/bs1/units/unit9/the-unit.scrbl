#lang curr/lib

@declare-tags[management]

@title{Unidade 9: Preparando para o Lançamento}

@unit-overview/auto[#:lang-table (list (list "Numero" @code{+ - * / sq sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Figura"  @code{rectangle circle triangle ellipse star text scale rotate put-image})
                                       (list "Booleano" @code{= > < string=? and or}))]{

@unit-descr{Alunos editam detalhes do jogo e se preparam para sua Festa de Lançamento!}
 }

@unit-lessons{
@lesson/studteach[
     #:title "Preparando a Apresentação" 
     #:duration "60 min"
     #:overview "Os alunos criam cartazes e projetos de apresentações para seus jogos."
     #:learning-objectives @itemlist[@item{Students practice explaining programming artifacts and concepts to others}]
     #:evidence-statements @itemlist[@item{Students will be able to explain the Circles of Evaluation to others}
                                     @item{Students will be able to explain the purpose of a Contract}
                                     @item{Students will be able to walk an audience through a simple use of the Design Recipe}
                                     @item{Students will be able to explain how the Distance Formula is used in their game}
                                     @item{Students will be able to explain how Piecewise Functions are used in their game}]
     #:product-outcomes @itemlist[@item{Um cartaz que ilustra o ponto essencial de um jogo}]
     #:standards (list)
     #:materials @itemlist[@item{Computadores com DrRacket ou WeScheme}
                           @item{@(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "Apostila") do Aluno}
                           @item{Canetas/lápis para os alunos, e giz/canetão aos professores}
                           @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                           @item{Tabela da Linguagem(veja abaixo)}
                           @item{Impressões do código do jogo de cada equipe.}
                           @item{Câmera - Tire fotos hoje!}
                          ]
     #:preparation @itemlist[@item{Sample poster or tri-fold poster for a fictional game, to use as a model for students.}]
     #:prerequisites ""
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @points[@point{@student{Agora que você tem um jogo completo (com todos os Exemplos e Assinatura, é claro!), é hora de pensar como apresentar seu trabalho para os outros. Programadores gastam muito tempo projetando e escrevendo código, mas eles gastam também muito tempo explicando seu trabalho para os outros. Eles podem ser outros programadores em sua equipe, ou engenheiros dentro da empresa, ou até mesmo para pessoas que não sabem programar. Você achar que pode explicar seu código para outra pessoa?}
                       @teacher{Tem tempo para um desafio? Experimente introduzir a eles @lesson-link[#:name "Structs" #:label "Estrutura de Dados"], para permitir o movimento em 2D (duas dimensões)  e mais controle do jogador.}
                       }
                @point{@student{@activity{Crie um cartaz de amostra para seu jogo! Todo Cartaz deve ter o seguinte:
                                          @itemlist[@item{Seu(s) nome(s), e o título do jogo}
                                                     @item{Uma figura para atrair o olhar das pessoas}
                                                     @item{A história por trás do seu jogo}
                                                     @item{Uma descrição escrita de UMA função do seu código. Essa descrição deve incluir o Nome, Domínio e Imagem da função, com uma explicação sobre o que ela faz e como é usada em seu jogo. Em vez de descrever uma função, você poderia descrever alguns conceitos que você aprendeu (Círculos de Avaliação, Receita de Projeto, Funções Segmentadas, Teorema de Pitágoras) e como você o usou na criação do jogo.}]}}
                       @teacher{Certifique-se que cada grupo de alunos tenha uma função diferente para falar, de forma que a turma toda irá rever o jogo inteiro. Você também pode querer ter grupos atribuidos a falar sobre Círculos de Avaliação, Assinaturas, e o propósito da Receita de Projeto, Funções Segmentadas (divididas em partes menores) e do Teorema de Pitágoras.}
                       }
                @point{@student{Depois de ter feito o cartaz, pense como você vai usá-lo durante sua apresentação. O que você vai dizer ao público? Como você vai usar o que você escreveu no cartaz ou no seu código para ajudar na apresentação?}
                       @teacher{@management{Demonstre uma apresentação ruim, esboçando uma má postura, baixa voz, e resmungando. Quando for hora de falar do código, pare. Peça as crianças para criticar, apontar o que eles gostaram e não gostaram. O que eles pensam sobre a velocidade da apresentação? Eles conseguem te ouvir? Em seguida, mostre uma apresentação muito melhor! Demonstre energia positiva, discurso claro, etc.} }
                       }
                @point{@student{@activity{Escreva ou pratique uma apresentação de 5 minutos, em que você se apresenta e explica seu jogo, em seguida, dirija ao público uma explicação da função ou conceito que lhe foi atribuído.}}
                       @teacher{Peça aos alunos que revisem suas apresentações, e tenham um feedback de sua dupla. Você pode querer mostrar uma explicação de algumas linhas de código, para que eles vejam o que você está procurando. Não permita que eles apenas recitem o código! Eles devem ser capazes de explicar cada linha em pleno Portugês - não tenha medo de empurrar os alunos para realmente explicar o que está acontecendo.}
                       }]
        }
      
@lesson/studteach[
     #:title "Comemoração" 
     #:duration "15 min"
     #:overview "Students are awarded certificates for their presentation"
     #:learning-objectives @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[@item{Computadores com DrRacket ou WeScheme}
                           @item{@(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "Apostila") do Aluno}
                           @item{Canetas/lápis para os alunos, e giz/canetão aos professores}
                           @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                           @item{Tabela da Linguagem(veja abaixo)}
                           @item{Impressões do código do jogo de cada equipe.}
                           @item{Câmera - Tire fotos hoje!}
                          ]
     #:preparation @itemlist[@item{(Optional) Game Design Certificates: 
                                   @itemlist[@item{Most creative story}
                                              @item{Most creative visuals}
                                              @item{Best Note-Takers}
                                              @item{Best Focus}
                                              @item{Most Positive Energy}
                                              @item{Design Recipe Masters}]
                                   }]
     #:prerequisites ""
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @points[@point{@student{Parabéns: você fez algo realmente incrível! Você aprendeu uma nova linguagem de programação, aprendeu sobre Círculos de Avaliação, Números, Strings, Booleanos, Figuras, Funções, Valores, Estruturas de Decisão, a Receita de Projeto, Assinaturas, e mais. Você fez um foguete voar, aprendeu a gerar gráficos de computador, e colocou tudo isso em conjunto para construir um belo jogo!}  
                       @teacher{@management{Peça a turma para dar uma salva de palmas. Dê prêmios, e fale sobre o desempenho dos alunos, etc}}
                       }]
        }

}