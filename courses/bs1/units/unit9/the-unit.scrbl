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
     #:learning-objectives @itemlist[@item{Alunos praticam a explicação de artefatos e conceitos de programação para outros}]
     #:evidence-statements @itemlist[@item{Alunos serão capazes de explicar o Círculo de Avaliação para outros}
                                     @item{Alunos serão capazes de explicar o porpósito de uma Assinatura}
                                     @item{Alunos serão capazes de conduzir um público por um simples uso da Receita de Projeto}
                                     @item{Alunos serão capazes de explicar como a Fórmula da Distância é utilizada em seus jogos}
                                     @item{Alunos serão capazes de explicar como as Funções Segmentadas são usadas em seus jogos}]
     #:product-outcomes @itemlist[@item{Um cartaz que ilustra o ponto essencial de um jogo}]
     #:standards (list)
     #:materials @itemlist[@item{Computadores com DrRacket ou WeScheme}
                           @item{@(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "Apostila") do Aluno}
                           @item{Lápis/canetas aos alunos, e giz/marcadores de quadro branco aos professores}
                           @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                           @item{Tabela da Linguagem(veja abaixo)}
                           @item{Impressões do código do jogo de cada equipe.}
                           @item{Câmera - Tire fotos hoje!}
                          ]
     #:preparation @itemlist[@item{Pôster de exemplo ou um folheto para um jogo imaginário, para usar como um modelo para os alunos.}]
     #:prerequisites ""
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @points[@point{@student{Agora que você tem um jogo completo (com todos os Exemplos e Assinatura, é claro!), é hora de pensar como apresentar seu trabalho para os outros. Programadores gastam muito tempo projetando e escrevendo código, mas eles gastam também muito tempo explicando seu trabalho para os outros. Eles podem ser outros programadores em sua equipe, ou engenheiros dentro da empresa, ou até mesmo para pessoas que não sabem programar. Você acha que pode explicar seu código para outra pessoa?}
                       @teacher{Tem tempo para um desafio? Experimente introduzir a eles @lesson-link[#:name "Structs" #:label "Estrutura de Dados"], para permitir o movimento em 2D (duas dimensões)  e maior controle do jogador.}
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
     #:overview "Alunos recebem certificados por suas apresentações"
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
     #:preparation @itemlist[@item{(Opcional) Certificados de Design de Jogo: 
                                   @itemlist[@item{História mais Criativa}
                                              @item{Visual mais Criativo}
                                              @item{Maior Anotador de Detalhes}
                                              @item{Melhor Foco}
                                              @item{Maior Energia Positiva}
                                              @item{Mestres da Receita de Projeto}]
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