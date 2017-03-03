#lang curr/lib
@declare-tags[management]

@title{Unidade 5: Animando o Jogo}

@unit-overview/auto[#:lang-table (list (list "Número" @code{+ - * / sq sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Figura"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]{
@unit-descr{Estudantes definem funções que mapeiam atributos de seu jogo de um quadro para o outro, o que lhes permite mover seus perigos, alvos e projéteis.}
}

@unit-lessons{
@lesson/studteach[
     #:title "Caça aos Bugs"
     #:duration "20 minutos"
     #:overview ""
     #:learning-objectives @itemlist[@item{Ganho de experiência na compreensão e na correção de erros de programação}]
     #:evidence-statements @itemlist[@item{Alunos serão capazes de ler mensagens de erro de erros básicos de sintaxe}
                                     @item{Alunos serã ocapazes de editar programas para eliminar erros básicos de sintaxe}]
     #:product-outcomes @itemlist[]
     #:standards (list "BS-PL.1" "BS-PL.2" "BS-PL.3" "BS-IDE")
     #:materials @itemlist[@item{Lápis/canetas aos alunos, e giz/marcadores de quadro branco aos professores}
                            @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                            @item{Tabela da Linguagem(veja abaixo)}
                            @item{Caça aos Bugs [Bugs.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/openEditor?publicId=HAu5aCVhFP" "WeScheme")] arquivo pré-carregado nas máquinas dos alunos.}]
     #:preparation @itemlist[]
     #:prerequisites (list "Defining Functions")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Depuração (encontrar e corrigir problemas no código) é uma parte importante da programação, por isso é uma boa ideia a prática de encontrar bugs no código. 
                                @activity[#:forevidence (list "BS-IDE&1&2" "BS-PL.1&1&2" "BS-PL.2&1&1" "BS-PL.2&1&2" "BS-PL.3&1&3")]{
                                        Abra o programa @editor-link[#:public-id "HAu5aCVhFP" "Caça aos Bugs"] em uma nova janela, e veja se você consegue encontrar 
                                        o bug em cada expressão. Clique em "Run" e leia a mensagem de erro com atenção! Depois de consertar uma expressão, clique em 
                                        Run e será mostrada a mensagem de erro para o próximo bug.}}
                        @teacher{Certifique-se que os alunos entendam que o objetivo não é CORRIGIR os erros, mas apenas encontrá-los.}
                        }
                 ]}

@lesson/studteach[
     #:title "Movimento do Perigo e do Alvo"
     #:duration "30 minutos"
     #:overview "Alunos planejam a animação no plano cartesiano, e escrevem uma simples função linear que anima seu Perigo."
     #:learning-objectives @itemlist[@item{Alunos aprendem a mover elementos do jogo através de funções que calculam atributos de um quadro com base no quadro anterior}]
     #:evidence-statements @itemlist[@item{Alunos serão capazes de escrever funções que recebem o valor de uma coordenada de um elemento e produz o valor da próxima coordenada naquela dimensão}
                                     @item{Alunos vão aprender como controlar a velocidade de movimento através de funções}]
     #:product-outcomes @itemlist[@item{Os alunos vão adicionar movimentos ao perigo}
                                  @item{Os alunos vão adicionar movimentos ao alvo}]
     #:standards (list "F-IF.1-3" "F-LE.5" "BS-DR.2" "BS-DR.3")
     #:materials @itemlist[@item{Lápis/canetas aos alunos, e giz/marcadores de quadro branco aos professores}
                            @item{@(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "Apostila do Aluno")}
                            @item{Todos os computadores dos alunos devem ter seu modelo de jogo pré-carregado, com seus arquivos de imagens}
                            @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                            @item{Tabela da Linguagem(veja abaixo)}]
     #:preparation @itemlist[@item{OPCIONAL: Distribua esta @(hyperlink "https://docs.google.com/document/d/1VGSW8kmjFikwZhZzH9JOyddqBqgDl1vkVcPlbxEGCC4/edit?usp=sharing" "Atividade de Aquecimento").}]
     #:prerequisites (list "Game Images" "The Design Recipe")
     #:pacings (list 
                @pacing[#:type "remediation"]{At this point, students should be very comfortable with the Design Recipe. If they are struggling, try reviewing the Contract with them first, then having a student act out the function. Ask that student what their name is, what they are expecting to be given, and what they will produce. Have them simulate a function call by calling out their name ("update-danger") and giving them an x-coordinate (they should produce a number that is 50 fewer than what they were given). Then refer back to this skit when writing Examples: the call-and-response is exactly how the code should behave, with students only having to write the code for whatever work your volunteer was doing in their head.}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@bitmap{images/AnimationDiagram.png}As dimensões do seu video game são 640x480, e cada personagem está localizado na tela com coordenadas(x, y). Seu Alvo(A), Jogador(J) e Perigo(P) se movem pelos eixos x e y, tendos suas coordenadas x ou y alteradas de acordo com a função de animação. Essas funções de animação começam bem simples: elas recebem a coordenada x ou y atual, e produzem a próxima coordenada x ou y. Mais tarde você será capaz de adaptá-las para criar movimentos mais sofisticados, usando @italic{ambas} coordenadas x e y na mesma função.}
                        @teacher{}
                        }
                 @point{@student{@activity[#:forevidence (list "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "F-LE.5&1&1" "7.EE.3-4&1&4" "F-IF.1-3&1&4")]{
                                           Vá para @worksheet-link[#:page 15 #:name "Design-Recipe-Update-Danger"] na sua apostila, em @code{atualizar-perigo}.
                                           @itemlist[@item{Leia a questão com calma, e preste atenção @italic{no que a função recebe como entrada}.}
                                                      @item{Preencha a @vocab{Assinatura} e a @vocab{Declaração de Propósito} da função, usando o que você circulou para te ajudar a escolher o Domínio.}
                                                      @item{Escreva dois @vocab{Exemplos} para a função.}
                                                      @item{Circule e nomeie o que muda entre os dois exemplos, e nomeie dando um nome para a @vocab{variável}.}
                                                      @item{Defina a função.}]}}
                         @teacher{Se os alunos estão trabalhando por conta própria, verifique seu trabalho para garantir que cada último passo está correto. Se a turma está trabalhando em conjunto, não se esqueça de pedir aos alunos para justificar seu último passo. @management{Dica: Diga aos alunos que eles devem ter sua autorização antes de digitar o código,  e use essa expectativa para verificaro papel de cada aluno com cuidado.}}
                         }
                 @point{@student{Colocando tudo isso junto, @code{atualizar-perigo} é definido por:
                                 @code[#:multi-line]{; atualizar-perigo : Numero -> Numero
                                                     ; diminui 50 da coordenada-x do perigo
                                                     (EXAMPLE (atualizar-perigo 171) (- 171 50))
                                                     (EXAMPLE (atualizar-perigo -90) (- -90 50))
                                                     (define (atualizar-perigo x) (- x 50))}
                                 (Nota: você pode ter diferentes Exemplos e nomes de variáveis.)
                                 @activity{Abra o arquivo de seu jogo, e desça até encontrar a definição de @code{atualizar-perigo}. A assinatura está certa?
                                           Tenha certeza que isso combina com o que você tem em sua apostila, adicione ambos os exemplos e corrija a definição. Quando você 
                                           clicar "Run", deve ver seu perigo voar por toda a tela!}
                                 }
                         @teacher{}
                         }
                 @point{@student{Agora é hora de animar o Alvo, que se move na direção oposta.
                                 @activity[#:forevidence (list "BS-DR.3&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "7.EE.3-4&1&4" "F-IF.1-3&1&4")]{
                                           Vá para @worksheet-link[#:page 16 #:name "Design-Recipe-Update-Target"] de sua apostila em @code{atualizar-alvo}.
                                           @itemlist[@item{Leia o problema com calma, e preste atenção @italic{no que a função recebe como entrada}.}
                                                      @item{Preencha a @vocab{Assinatura} e a @vocab{Declaração de Propósito} para a função, usando o que você circulou para te ajudar a escolher o Domínio.}
                                                      @item{Escreva dois @vocab{Exemplos} para a função.}
                                                      @item{Circule e nomeie o que muda entre os dois exemplos, e nomeie dando um nome para a @vocab{variável}.}
                                                      @item{Defina a função.}]}}
                         @teacher{Para os alunos que terminaram isso rapidamente, deixe-os experimentar tornar o Alvo e Perigo mais rápidos ou lentos, ou ainda mudar sua direção. Certifique-se que estão digitando Exemplos, e atualizando os anteriores para acompanhar as mudanças feitas na definição.}
                         }
     ]}

@lesson/studteach[
     #:title "Movimento do Projétil (Opcional)"
     #:duration "15 minutos"
     #:overview "OPCIONAL: os alunos descobrem que as definições de \"misterio\" são na verdade usadas para adicionar projéteis, e adaptar essas definições para adicionar projéteis personalizados e animação dos projéteis no game."
     #:learning-objectives @itemlist[@item{Alunos aprendem a mover elementos do game através de funções que calculam atributos de um quadro com base no quadro anterior}]
     #:evidence-statements @itemlist[@item{Alunos são capazes de escrever funções que recebem como entrada uma coordenada de um elemento e produz o próximo valor da coordenada desta dimensão}]
     #:product-outcomes @itemlist[@item{Alunos vão adiconar o movimento dos projéteis em seus jogos}]
     #:standards (list "F-IF.1-3" "F-LE.5" "BS-DR.3")
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:prerequisites (list "Brainstorming" "The Design Recipe")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Este modelo de jogo tem um objeto misterioso, que está definido no final da tela. O "misterio" é na verdade um @italic{projétil}, que está com as coordenadas do Jogador. Como você pode ver, o @code{misterio} está definido para ser uma pequena estrela prateada, mas você pode alterar isso para a imagem que você quiser. Se no seu jogo o jogador for uma macaco, você poderial mudar a definição de @code{misterio} para ser um bitmap de uma banana, de modo que o macaco vai jogar bananas toda vez que a barra de espaço for pressionada. Um jogo que se passa no espaço poderia ter um alien lançando cristais, ou em um jogo de esportes ter um atleta lançando uma bola.
                                @activity[#:forevidence (list "BS-DR.3&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "7.EE.3-4&1&4" "F-IF.1-3&1&4")]{
                                          @itemlist[@item{Mude a definição de @code{misterio}, para que seu projétil pareça da maneira que você quiser. Não se esqueça de usar @code{scale} e @code{rotate} se você precisar ajustar sua imagem um pouco.}
                                                     @item{Use a Receita de Projeto para escrever @code{atualizar-misterio}, para que o projétil se mova para a esquerda ou para a direita. Dica: isto será bem parecido com suas soluções para @code{atualizar-perigo} e @code{atualizar-alvo}!}]}}
                        @teacher{Tenha cuidado ao introduzir Projéteis no jogo! Muitos alunos vão realmente ser @bold{menos criativos} ao usá-los, uma vez que irá enviar à sua mente automaticamente o formato "atire no cara mau". Muitos professores optam por ignorar esta seção inteiramente, ou então adicionar só quando os jogos estiverem completos.}
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
        @points[@point{@student{Parabéns - você tem o começo de um belo jogo! No entanto, várias coisas permanecem inacabadas:
                                @itemlist[@item{O jogador não se move}
                                           @item{Quando o Alvo ou o Perigo saem da tela, eles nunca voltam}
                                           @item{Nada acontece quando o Jogador se choca com o Perigo ou com o Alvo}]
                                As próximas lições vocês irão estender o que você sabe sobre funções, de modo que você pode definir funções para implementar cada um desses recursos.}
                        @teacher{@management{@itemlist[@item{Peça aos alunos o que eles aprenderam nesta lição}
                                                        @item{Comportamentos que você valoriza: trabalho em equipe, fazendo anotações, engajamento, etc}
                                                        @item{Dê os recados de saída, despense-os e coloque o local em ordem.}]}}
                        }]
         }
}

