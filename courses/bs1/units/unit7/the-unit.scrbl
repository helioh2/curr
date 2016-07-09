#lang curr/lib

@declare-tags[group selftaught bootstrap management]
@title{Unidade 7: Desvios Condicionais}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sq sqrt expt}) 
                                       (list "String" @code{string-append string-length})                          
                                       (list "Image" @code{rectangle circle triangle ellipse radial-star scale rotate put-image})
                                       (list "Boolean" @code{= > < string=? and or}))]{
  @unit-descr{Os alunos usam geometria e desvios condicionais para moverem seus personagens em resposta à teclas pressionadas.}
   }

@unit-lessons{
@lesson/studteach[
     #:title "Pizza do Luigi" 
     #:duration "20 min"
     #:overview "Alunos analizam o comportamento de uma função segmentada"
     #:learning-objectives @itemlist[@item{Students learn the concept of piecewise functions}
                                     @item{Students learn about conditionals (how to write piecewise functions in code)}
                                    ]
     #:evidence-statements @itemlist[@item{Students will understand that functions can perform different computations based on characteristics of their inputs}
                                     @item{Students will begin to see how Examples indicate the need for piecewise functions}
                                     @item{Students will understand that @code{cond} statements capture pairs of questions and answers when coding a piecewise function}
                                    ]
     #:product-outcomes @itemlist[]
     #:standards (list "BS-DR.1" "BS-DR.2" "BS-DR.3" "BS-PL.4")
     #:materials @itemlist[@item{Computers w/ DrRacket or WeScheme}
                           @item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                           @item{Class posters (List of rules, basic skills, course calendar)}
                           @item{Language Table (see below)}
                          ]
     #:preparation @itemlist[@item{"Luigi's Pizza" [LuigisPizza.rkt from @(resource-link #:path "source-files.zip" 
                                                                                       #:label "source-files.zip") |
@(hyperlink "http://www.wescheme.org/openEditor?publicId=Qzjz5xbQ8h" "WeScheme")] preloaded on students' machines, and on the projector}
                              @item{REQUIRED: Hand out @(hyperlink "https://docs.google.com/document/d/1k67XlYWkHefd4APynvwSnPKRaSTeOvGD7_lRbI8hHrg/edit?usp=sharing" "Luigi's Pizza Worksheet").}]
     #:prerequisites (list "The Design Recipe" "and/or")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
  @points[
     @point{@student{@activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1")]{
                           Para iniciar essa lição, complete o desafio @(hyperlink "https://docs.google.com/document/d/1k67XlYWkHefd4APynvwSnPKRaSTeOvGD7_lRbI8hHrg/edit" 
                                      "Pizza do Luigi").}}
            @teacher{Revise as respostas dos alunos. Você pode ver um video de demonstração de introdução à condições nesses links: @(video-link (hyperlink "http://www.youtube.com/watch?v=2ckWSjWum-8" "1")),
                     @(video-link (hyperlink "http://www.youtube.com/watch?v=iTrY-N3MLRY#t=3m8s" "2"))}
           }
     @point{@student{O código para a função @code{custo} está escrito abaixo:
                     @code[#:multi-line #t]{; custo : String -> Numero
                                            ; dado um sabor, produz o custo da pizza com esse sabor
                                            (EXAMPLE (custo "queijo")     9.00)
                                            (EXAMPLE (custo "calabresa") 10.50)
                                            (EXAMPLE (custo "frango")   11.25)
                                            (EXAMPLE (custo "chocolate")  10.25)
                                            
                                            (define (custo sabor)
                                              (cond
                                                [(string=? sabor "queijo")     9.00]
                                                [(string=? sabor "calabresa") 10.50]
                                                [(string=? sabor "frango")   11.25]
                                                [(string=? sabor "chocolate")  10.25]
                                                [else 00.00]))}}
             @teacher{}
             }
     @point{@student{Até agora, todas as funções que você fez, fazem a @italic{mesma coisa} com suas entradas:
                     @itemlist[@item{@code{triangulo-verde} sempre faz triângulos verdes, não importa o tamanho recebido.} 
                                @item{@code{esquerda-salvo?} sempre compara a coordenada de entrada com -50, não importando qual número seja.}
                                @item{@code{atualizar-perigo} sempre soma ou subtrai o mesmo valor.}
                                @item{e assim por diante...}]
                     Isso ficou evidente quando se passa os Exemplos para a definição: circulando o que muda sempre resulta 
                     na definição, e o número de variáveis sempre coincidiu o o número de coisas no Domínio.
                     @activity{Vá para a página @worksheet-link[#:page 23 #:name "Pizza-Cost"], e preencha a Assinatura e Exemplos para esta função,
                               e então circule e nomeie o que muda.}}
            @teacher{Pode ser útil ter alguns Exemplos e definições escritos no quadro, para que os alunos possam acompanhar.}
           }
     @point{@student{A função @code{custo} é especial, porque diferentes sabeores resultam em diferentes expressões para calcular.
                     Se você tivesse que circular tudo o que muda no exemplo, você teria que circular os sabores @italic{e o preço}.
                     Essas são duas coisas que mudam, mas o Domínio da função tem somente um item - por isso, não podemos ter duas variáveis.}
            @teacher{}
           }
     @point{@student{Claro que, @code{preço} não é uma variável independente, já que o preço depende interiamente do @code{sabor}. 
                     Por exemplo: se o sabor é @code{"queijo"} a função irá simplismente produzir @code{9.00}, se o sabor for 
                     @code{calabresa} a função irá produzir @code{10.50}, e asssim por diante. O preço ainda é definido em função 
                     do sabor, e existem quatro possíveis sabores - quatro condições possíveis - que a função deve se preocupar.
                     A função @code{custo} faz uso de um recurso especial da linguagem chamado @vocab{condicionais} , que é 
                     abreviado no código como @code{cond}.}
             @teacher{}
             }
     @point{@student{Cada condicional tem pelo menos uma @vocab{condição}. Cada condição tem uma pergunta Booleana e um resultado. Na função do Luigi, Existe uma condição para queijo, outra para calabresa, e etc. Se a condição é @code{verdadeira}, a expressão é calculada e retorna um valor. Se a condição é falsa, o computador pula para a próxima condição. 
                     @activity[#:forevidence (list "BS-PL.4&1&1")]{
                               Dê uma olhada na função @code{custo}: 
                               @itemlist[@item{Quantas condições existem para a função @code{custo}?}
                                         @item{Identifique a pergunta da primeira condição.}
                                         @item{Identifique a pergunta da segunda condição.}]}}
            @teacher{Colchetes cercam a pergunta e a resposta em cada condição. Quando os alunos identificam as questões, eles devem encontrar a primeira expressão dentro dos colchetes. Existe apenas uma expressão para cada resposta.}
           }
     @point{@student{A última condição em uma condicional pode ser um @code{else} (senão), que será executado se todas as perguntas forem @code{falsas}. 
                      @activity[#:forevidence (list "BS-PL.4&1&1")]{
                              Na função @code{custo}, o que é retornado se todas as condições forem falsas? O que aconteceria se 
                              não existisse a condição @code{else}? Tente remover ela do código e calcule um sabor 
                              desconhecido, e veja o que acontece.
                              }
                    }
             @teacher{O @code{else} é muito usado como um "pega-tudo" para casos que não podem ser numerados. Se você pode indicar uma pergunta precisa 
                       para uma condição, escreva essa pergunta precisa ao invés de @code{else}. Por exemplo, se você tem uma função que faz coisas diferentes 
                       dependendo se alguma variável @code{x} é maior do que @code{5}, é melhor para iniciantes escrever duas condições 
                       @code{(> x 5)} e @code{(<= x 5)} em vez de ter a segunda condição sendo @code{else}. Questões explícitas tornam os programas 
                       fáceis de ler e fazer manutenção. Quando você usa @code{else}, alguém tem que ler todas as condições anteriores para saber com qual condição 
                       o @code{else} se corresponde: eles não podem voltar e fuçar nas condições anteriores para encontrar uma que combina com laguma situação. Isso pode 
                       ser um pouco contra-intuitivo para aqueles com alguma expreiência anterior em programação, mas ajuda a tornar o código mais legível e compreensível.}
           }
     @point{@student{Funções que usam condicionais são chamadas @vocab{funções segmentadas}, porque cada condição define uma
                     @italic{parte} separada da função. Porque funções segmentadas são úteis? Pense sobre o personagem principal em seu jogo: você gostaria que 
                     ele se mova de uma maneira se você aperta a seta "para cima", e de outra maneira de você apertar a tecla "para baixo". Se mover para cima e se mover para baixo precisa 
                     de duas funções diferentes! Sem o @code{cond}, você poderia apenas escrever uma função que sempre move o personagem para cima, ou sempre o mova para 
                     baixo, mas não os dois juntos.}
            @teacher{}
           }
   ]}
 
@lesson/studteach[
     #:title "Movimento do Personagem" 
     #:duration "25 min" 
     #:overview "Alunos escrevem uma função segmentada que permite o personagem se mover para cima e para baixo usando as setas."
     #:learning-objectives @itemlist[@item{Os alunos aprendem que a manipulação de entradas de usuário precisam de funções segmentadas}
                                     @item{Os alunos aprendem quais perguntas devem ser feitas para detectar teclas pressionadas}
                                     @item{Os alunos aprendem como escrever suas próprias expressões condicionais}
                                     @item{Os alunos raciocinam sobre o posicionamento dos objetos usando matemática}]
     #:evidence-statements @itemlist[@item{Os alunos irão aprender como escrever expressões diferentes que calculam novas coordenadas em diferentes direções}
                                     @item{Os alunos serão capazes de escrever expressões que verificam qual tecla foi pressionada}
                                     @item{Os alunos serão capazes de escrever uma condional de ligação de teclas pressionadas para diferentes direções de movimento}
                                     @item{Os alunos irão aprender a escrever exemplos que ilustram cada condição em uma função segmentada}
                                     @item{Os alunos serão capazes de experimentar com o uso de funções para mudar a velocidade ou a natureza do movimento do personagem em um jogo}
                                    ]
     #:product-outcomes @itemlist[@item{Alunos irão escrever @code{atualizar-jogador}, que move seu personagem quando teclas definidas forem pressionadas}]
     #:standards (list "A-SSE.1-2" "BS-DR.2" "BS-DR.3")
     #:materials @itemlist[@item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                           @item{All student computers should have their game templates pre-loaded, with their image files linked in}]
     #:preparation @itemlist[]
     #:prerequisites (list "Luigi's Pizza" "Target and Danger Movement")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
    ]{
      @points{
       @point{@student{Agora que sabemos do @code{cond}, podemos escrever @code{atualizar-jogador}.
                       @activity[#:forevidence (list "BS-M&1&1" "BS-M&1&2" "BS-DR.2&1&1" "BS-DR.3&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2")]{
                                 @bitmap{images/update-player.png} Olhe a seguinte figura, e descreva o que acontece quando a tecla seta "para cima" é pressionada. 
                                 @itemlist[@item{Com qual coordenada x o jogador começa?}
                                           @item{Com qual coordenada y o jogador começa?}
                                           @item{E depois que o jogador se mover? 
                                                 @itemlist[@item{Quais são as novas coordenadas x e y?}
                                                           @item{O que mudou e quanto mudou?}
                                                           @item{O que acontece quando apretamos a tecla seta "para baixo"?}
                                                           @item{Quais devem ser as novas coordenadas?}
                                                           @item{O que deve acontecer se o usuário pressionar @italic{alguma outra} tecla que não é seta "para cima" e seta "para baixo"?  }]}]}
                      }
              @teacher{Desenhe uma tela no quadro, e coloque coordenadas para o personagem, alvo e perigo. Circule todos os dados associados com o personagem Jogador.}
              }
       @point{@student{A tabela a seguir resume o que deve acontecer com o jogador quando cada tecla é pressionada:
                           @build-table/cols['("Quando..." "Faça...")
                                             '(("tecla é \"up(para cima)\"" "tecla é \"down(para baixo)\"" "tecla é qualquer outra")
                                               ("adicione 20 para jogador-y" "diminua 20 de jogador-y" "retorne y sem alteração"))
                                             (lambda (r c) (para ""))
                                             2 3]
                           
                           @activity[#:forevidence (list "BS-M&1&1" "BS-M&1&2" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2")]{
                                    On @worksheet-link[#:page 24 #:name "Design-Recipe-Update-Player"] in your workbook, 
                                    you'll find the word problem for @code{update-player}.}
                           (Se você não gostar de usar as setas de direção para fazer o jogador mover-se para cima e baixo, 
                           você pode facilmente mudá-los para trabalhar com "w" e "x"!)
                           }
               @teacher{Certifique-se de verificar os EXAMPLEs e Assinaturas dos alunos durante esse exercício, especialmente quando for hora 
                        de circular e nomear o que é variável entre os exemplos. Este é um passo fundamental na Receita de Projeto onde eles 
                        devem descobrir a necessidade de usar o @code{cond}.}
               }
       @point{@student{Você também pode adicionar movimentos mais avançados, usando o que você aprendeu sobre
                       funções booleanas. Aqui estão algumas ideias: 
                       @itemlist[@item{@bold{Warping***:} ao invés de ter a coordenada-y somada
                                        ou diminuída, substitua ela com um número para que o
                                        o jogador apareça de repente nessa localização. 
                                       (Por exemplo, pressionando a tecla "c" faz o jogador 
                                       voltar ao centro da tela, em y=240.)}
                                  @item{@bold{Boundary-detection***(detecção de limites)} Altera a condição de se movimentar para cima
                                         para que o jogador só consiga subir se a tecla="up" AND 
                                         @code{jogador-y} for menor que 480. Da mesma maneira, altera a condição 
                                         para baixo para verificar se @code{player-y} é maior do que 0.}
                                  @item{@bold{Wrapping***:} Adiciona uma condição (antes de qualquer tecla) 
                                         que verifica se a coordenada-y do jogar está acima 
                                         da tela (y > 480). Se estiver, faça o jogador 
                                         aparecer na parte de baixo(y=0). Adicione outra condição que 
                                         o jogador apareca no topo da tela se ele se mover abaixo da parte inferior da tela.}
                                  @item{@bold{Desafio:} Faça o jogador ficar invisível quando a tecla "h" for pressionada, 
                                        só re-apareça quando ela for pressionada novamente!}]}
               @teacher{Dica para o Desafio: multiplique por -1.}}
       }}
     
@lesson/studteach[
     #:title "Closing"
     #:duration "5 min"
     #:overview ""
     #:learning-objectives @itemlist[]
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
        @points[@point{@student{Congratulations - you've got the beginnings of a working game!  
                                What's still missing? Nothing happens when the player collides with the object or target!
                                We're going to fix these over the next few lessons, and also work on the artwork and story 
                                for our games, so stay tuned!}
                        @teacher{@management{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                                       @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                                       @item{Pass out exit slips, dismiss, clean up.}]}}
                        }
                        ]}
}
