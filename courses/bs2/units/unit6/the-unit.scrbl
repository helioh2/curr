#lang curr/lib

@title{Unidade 6: Eventos de Tecla}
@declare-tags[management]

@unit-overview/auto[#:lang-table (list (list "Número" @code{+ - * / sq sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Figura"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]{
                                                                  @unit-descr{Students return to the subject of partial functions, this time defining a key-event handler that modifies their world when certain keys are pressed.}
}
@unit-lessons{
@lesson/studteach[#:title "Introdução"
        #:duration "15 minutos"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{Lápis/canetas aos alunos, e giz/marcadores de quadro branco aos professores}
                            @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                            @item{Ambiente de Edição (WeScheme ou DrRacket com o pacote bootstrap-teachpack instalado)}
                            @item{Apostila dos alunos}
                            @item{Tabela da Linguagem}
                            @item{Signs for kids, entitled "update-world", "draw-world" and "big-bang"}
                            @item{Recortes das figuras do cachorro e do rubi}]
     #:preparation @itemlist[@item{Arranjos de assento: preferencialmente aglomerando as mesas}
                             @item{O arquivo Ninja World 3 [NW3.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @editor-link[#:public-id "2iasby92mn" "WeScheme"] projetado sobre o quadro}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Até agora temos trabalhado com três principais funções para construir nosso jogo e animar nosso mundo: @code{atualiza-mundo}, 
                                @code{desenha-mundo}, e @code{big-bang}. Até o momento, seu jogo pode usar algumas funções a mais que estas, mas 
                                o Mundo Ninja ainda é básico da mesma maneira que você se lembra. 
                                @activity{@itemlist[@item{Abra o aquivo do @editor-link[#:public-id "2iasby92mn" "Ninja World 3"]
                                                         e clique em "Run", para ver o cachoro e o rubi voarem pela tela.}
                                                     @item{Qual é a assinatura para cada função neste jogo? O que elas fazem?}
                                                     @item{Cada vez que @code{atualiza-mundo} é chamada, o que muda no cachorro? Como isso acontece?
                                                                     E sobre o rubi?}
                                                     @item{Em qual lugar da tela a função @code{desenha-mundo} coloca a imagem do cachorro? E do rubi? E as nuvens?}
                                                     @item{Se você chamou @code{atualiza-mundo} no mundo @code{(make-mundo 0 640)}, o que você recebeu de volta? 
                                                                               Qual é o mundo que foi produzido? Onde o cachorro e o rubi estão depois que 
                                                                               o mundo foi atualizado?}]}
                                Nesta versão do Mundo Ninja, ambos o cachorro e o rubi estão se movendo como deveriam. Mas isso nós já sabemos: você já 
                                fez os personagens do seu jogo se moverem por conta própria. Vamos adicionar mais.}
                        
                        @teacher{Esta lição é outra oportunidade para que os alunos atuem como as três funções principais do Mundo Ninja. Desenhe uma caixa no 
                                 quadro com @code{(make-mundo 0 640)} nela, nomeie como "mundo". Solicite um voluntário, e dê a ele um crachá com o
                                 nome @code{atualiza-mundo} para usar. Pergunte pela Assinatura de Decla\ração de Propósito de @code{atualiza-mundo}. Passe por algumas iterações de ter 
                                 @code{atualiza-mundo} calculando o mundo no quadro, em cada vez atualizando ele 
                                 @management{Certifique-se de chamá-los pelo nome, i.e. "@code{(atualiza-mundo (make-mundo 0 640))}"} (No primeiro exemplo, 
                                 o aluno deve apagar o 0 e escrever 10, e apagar o 640 e escrever 635. Se eles ficarem presos, faça referência 
                                 código anterior.) Peça outro voluntário, e dê o crachá @code{big-bang}. Eles vão iniciar toda a 
                                 animação, e terão um contador de tempo. Instrua a classe para gritar "tick!" a cada cinco segundos, e quando eles gritarem, 
                                 o @code{big-bang} passará o mundo atual para @code{atualiza-mundo}, que vai atualizar e substituir ele com um novo 
                                 mundo. Deixem que façam algumas iterações, então o resto da turma pode ver a estrutura mundo sendo modificada enquanto 
                                 eles fazem a contagem. Finalmente, dê para outro voluntário o crachá de @code{desenha-mundo}, junto com os recortes 
                                 do cachorro e do rubi. Como antes, pergunte o nome, o domínio e a imagem da função. 
                                 Quando eles forem chamados, eles receberão uma estrutura @code{mundo} e substituirão a imagem do cachorro e do rubi nos 
                                 pontos apropriados no quadro. Mude o valor do mundo de volta para @code{(make-mundo 0 640)}. Chame @code{desenha-mundo}
                                 algumas vezes com diferentes mundos, então a turma poderá ver o cachorro e o rubi se movendo pela tela. Quando cada 
                                 voluntário tiver praticado, coloque todas as funções juntas: Em cada "tick" qua a turma fizer, o @code{big-bang} irá chamar 
                                 @code{atualiza-mundo} para atualizar o mundo atual, e então @code{desenha-mundo} desenhará o mundo atualizado. De novo, passe por 
                                 algumas iterações, então a turma poderá ver a estrutura mundo mudando e os personagens se movensp como resultado.}}
                 
                 @point{@student{A hora está próxima: precisamos colocar o gato ninja na tela para que o jogo fique interessante. Ela será capaz de se mover para cima e para baixo. 
                                 @activity{@itemlist[@item{Nós precisamos mudar alguma coisa no código para fazer isso funcionar?}
                                        @item{Qual parte do jogo será necessária para manter o controle se o Gato Ninja está se movendo para cima e para baixo? Qual seria um 
                                              bom nome de @vocab{variável} para isso?}]}
                                 Nós precisamos manter o controle da coordenada-y do gato, então vamos adicionar o campo @code{gatoY} no mundo.  
                                 @activity{@itemlist[@item{Onde a estrutura mundo está definida no código?}
                                                      @item{Se o gato estiver no meio da tela, qual deveria ser o valor de @code{gatoY}?}
                                                      @item{Adicione outro número na estrutura mundo, representando a coordenada-y do gato.}]}}
                         @teacher{}}
                 @point{@student{Até agora, mesmo que a coordenada-y do gato tenha sido adicionada na struct mundo, não temos nenhuma função que recebe as teclas pressionadas e
                                 faz o gato se mover. Isso é o que vamos escrever a seguir. Mas antes de descobrir como escrever a função que move o gato,
                                 precisamos realmente adicionar gatoY ao jogo. 
                                 @activity{Quais funções precisamos mudar, agora que a estrutura mundo está diferente?}
                                 Agora que o mundo contém três coisas, você precisará mudar cada @code{make-mundo} no código.
                                 @activity{@itemlist[@item{Começando pela primeira linha, percorra o código e procure por cada lugar onde aparece 
                                                           @code{make-mundo}, e mude-o para refletir a nova estrutura de mundo.}
                                                      @item{Como você acessa o campo @code{gatoY} de fora do mundo?}                                       
                                                      @item{Dissemos que estaremos escrevendo outra função para receber as teclas pressionadas e mover o gato, então é so 
                                                            adicionar @code{gatoY} em @code{atualiza-mundo}. Não se preocupe em mudar valor.}
                                            @item{Dentro do @code{desenha-mundo}, use a função @code{put-image} para colocar a figura do Gato Ninja sobre as 
                                                          outras figuras do jogo. Se ela começar no centro da tela, em qual coordenada-x 
                                                          ela seria colocada? E em qual coordenada-y?}]}}
                         @teacher{Depois que @code{gatoY} foi adicionado à estrutura mundo, mas antes que qualquer função tenha sido modificada, experimente fazer a 
                                  simulação novamente, dando o recorte do gato ninja para o voluntário do @code{desenha-mundo}. O mundo tem agora três coisas nele
                                  (@code{caoX}, @code{rubiX}, e @code{gatoY}), mas as funções de atualizar e desenhar mudam apenas as posicoes do cachorro e 
                                  do rubi. Quando o @code{big-bang} começa a animação, apenas o @code{caoX} e @code{rubiX} serão atualizados. Depois de algumas 
                                  iterações, peça aos voluntários se você tivesse apertado a tecla "para cima". se o @code{desenha-mundo} começar a mover o recorte do gato ninja,
                                  referencie o código escrito. Você não programou nada que muda o @code{gatoY} ainda.}}
                 ]
         }
                                         
@lesson/studteach[#:title "Keypress"
        #:duration "35 minutos"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will extend their understanding of events to cover key-events}
            @item{Students will deepen their knowledge of conditionals, by combining them with struct accessor and constructor functions.}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Agora que a estrutura mundo está consistente em todas as funções do Mundo Ninja, estamos prontos para fazer o gato se mover.
                                @activity{Abra sua apostila na @worksheet-link[#:page 28 #:name "Keypress"]. Usando a Receita de Projeto, escreva a
                                                                função @code{keypress} para o jogo do Mundo Ninja.} 
                                @bannerline{Passo 1 - Assinatura e Declaração de Propósito}
                                A descrição do mundo nos diz que o noma de função será @code{keypress}. E sobre o Domínio? Pense sobre o que
                                a função precisa saber comol lidar com um keypress: ela precisa de um Mundo, senão ela não saberia o que 
                                atualizar. Mas ela também precisa saber qual tecla foi pressionada (se foi @code{"up/para cima"} ou @code{"down/para baixo"}).
                                @activity{@itemlist[@item{De que tipos são @code{"up"} e @code{"down"}?}
                                                     @item{Qual é o Domínio de @code{keypress}? E a Imagem?}
                                                     @item{Qual seria uma boa Declaração de Propósito para esta função?}]}   
          @code[#:multi-line #t]{; keypress : Mundo String -> Mundo
                                 ; Dado um mundo e uma tecla pressionada, atualiza o gatoY do mundo}}
                        @teacher{}}
                 @point{@student{@bannerline{Passo 2 - Examplos}
                               @activity{Escreva um exemplo usando mundo @code{INICIO}, então o usuário pressiona @code{"up"}.
                                                                    @itemlist[@item{@code{(EXAMPLE (keypress INICIO "up") ...)}}
                           @item{O que você deveria receber de volta? (DICA: Olhe para a Imagem da Função)}
                           @item{Qual função constrói um mundo? Quais coisas fazem parte de um mundo?}
                           @item{@code[#:multi-line #t]{(EXAMPLE (keypress INICIO "up") 
                                                                 (make-mundo ...caoX...rubiX...gatoY))}}
                           @item{O @code{caoX} muda quando o usuário apertar @code{"up"}? Como você recebe o antigo @code{caoX} do mundo @code{INICIO}?}
                           @item{@code[#:multi-line #t]{(EXAMPLE (keypress INICIO "up")
                                                                 (make-mundo (mundo-caoX INICIO)...rubiX...gatoY))}}
                           @item{O @code{rubiX} muda quando o usuário pressiona @code{"up"}? Como você consegue saber o antigo @code{rubiX} do mundo @code{INICIO}?}
@item{@code[#:multi-line #t]{
(EXAMPLE (keypress INICIO "up") (make-mundo (mundo-caoX INICIO)
                                             (mundo-rubiX INICIO)
                                              ...gatoY...))}}
                           @item{E o @code{gatoY}? Quanto ele deveria mudar se o usuário pressionar @code{"up"}? Vamos dizer 10 pixels.}
                           @item{Você deve somar ou subtrair do @code{gatoY} se @code{"up"} for a tecla pressionada? Por que?}]}
                
Seu primeiro exemplo deve se parecer com isso: 
@code[#:multi-line #t]{
(EXAMPLE (keypress INICIO "up") (make-mundo (mundo-caoX INICIO)
                                           (mundo-rubiX INICIO) 
                                        (+ (mundo-gatoY INICIO) 10)))}}
                         @teacher{}}
                 @point{@student{@activity{Escreva mais um exemplo para @code{keypress} usando o mundo @code{INICIO} e a tecla @code{"down"}(para baixo). Pense sobre como @code{gatoY} deve mudar desta vez}
@code[#:multi-line #t]{(EXAMPLE (keypress INICIO "down") (make-mundo (mundo-caoX INICIO) 
                                         (mundo-rubiX INICIO) 
                                         (- (mundo-gatoY INICIO) 10)))}
@activity{Depois, cuidadosamente olhe seus exemplos e circule @italic{tudo} que muda. Esta função se comporta como as outras funções que você já fez?}}
                         @teacher{}}
                 @point{@student{@bannerline{Passo 3 - Definição}
                @activity{O que vai dentro da chamada da função? Quais são bons nomes de variáveis para o mundo e a string (representando a tecla apertada) no Domínio?}
                 @code[#:multi-line #t]{(define (keypress m tecla)
	                                              ...)}
                 O que fazer agora? Este é um teste para sua intuição de programação: você têm dois exemplos diferentes, onde você soma 10 em @code{gatoY} em um caso
                 mas diminiu 10 em outro caso. Como uma função pode se comportar tão diferente? Ela tem multiplas condições, com uma resposta diferente para cada uma.
                 Você já viu isso antes, no Bootstrap:1 - @code{cond}.
                 @code{cond} é uma função especial, que mostra ao computador que a função terá multiplas condições: ela se comporta de maneira diferente 
                 dependendo do que recebe em sua entrada(s). Ela também é chamada de @vocab{função segmentada}.}
                        @teacher{Certifique-se de verificar as Assinatiras e EXAMPLES dos alunos durante esse exercício, especialmente quando é hora deles circularem e
                                 nomearem o que está mudando entre os exemplos. Esse é um passo crucial na Receita de Projeto onde eles devem descobrir a necessidade 
                                 do @code{cond}.}}
                 @point{@student{Toda @vocab{função segmentada} tem pelo menos uma @vocab{condição}. Cada condição tem uma pergunta Booleana e uma resposta. Em 
                                      sua função @code{keypress}, existe uma condição para a tecla @code{"up"}, e outra para a tecla @code{"down"}.
                                      Se a pergunta retornar verdadeiro(true), a expressão é avaliada e retorna o valor. Se a pergunta for falso(false), o computador 
                                      irá pular para a próxima @vocab{condição}. Para escrever uma função com múltiplas condições, inicie com @code{cond} e use
                                      cochetes para adicionar um ramo(branch**). Nós sabemos que cada ramo tem um teste e um resultado, formando uma @vocab{cláusula}. 
                                      @code[#:multi-line #t]{(define (keypress m tecla)
	                                   (cond
		                                 [...teste...  ...resultado...]))}}
                         @teacher{}}
                 @point{@student{Vamos começar com o primeiro ramo. Isto testará se a @code{tecla} pressionada é igual a @code{"up"}. @activity{Qual função podemos usar para testar se duas strings são iguais?}
@code[#:multi-line #t]{(define (keypress m tecla)
	(cond
		[(string=? tecla "up")  ...resultado...]))}}
                         @teacher{Colchetes encapsulam a pergunta (uma condição que retorna um booleano) e a resposta de cada cláusula. Pode ter apenas uma
                                  expressão em cada resposta.}}
                 @point{@student{Qual é o resultado se a tecla for @code{"up"}? (DICA: Olhe novamente seus EXAMPLES para ajudar.) Você pode copiar do exemplo 
                                 de @code{"up"}, e mudar todas as instâncias de @code{INICIO} para a @vocab{variável}, @code{m}:
@code[#:multi-line #t]{(define (keypress m tecla)
	(cond
		[(string=? tecla "up")  (make-mundo (mundo-caoX m) 
                                                  (mundo-rubiX m) 
                                               (+ (mundo-gatoY m) 10))]))}
@activity{Qual é a sengunda condição que precisa ser considerada? Qual expressão testára essa condição? Escreva o segundo ramo da função @code{keypress}.}}
                         @teacher{}}
                 @point{@student{Precisamos também testar se o usuário apertou a tecla @code{"down"}(para baixo):
                 @code[#:multi-line #t]{(define (keypress m tecla)
	(cond
                [(string=? tecla "up")  (make-mundo (mundo-caoX m) 
                                                    (mundo-rubiX m) 
                                                 (+ (mundo-gatoY m) 10))]
                                                       
		     [(string=? tecla "down")  (make-mundo (mundo-caoX m) 
                                                      (mundo-rubiX m) 
                                                   (- (mundo-gatoY m) 10))]))}
                               Agora o computador sabe o que fazer quando as tecla @code{"up"} ou @code{"down"} forem pressionadas, mas existem muitas teclas em seu teclado. 
                               @activity{Digite o código acima dentro do Mundo Ninja e clique em "Run". O Gato Ninja se move quando você pressiona a setas para cima("up") e 
                                         para baixo("down"). O que acontece se você apertar uma tecla diferente? Você deve receber um erro... você pode adivinhar o porquê?}}
                         @teacher{}}
                 @point{@student{O Racket não sabe o que fazer se receber outra tecla, porque não não dissemos à ele o que fazer. 
                               @activity{@itemlist[@item{O mundo deveria mudar se o usuário apartar a barra de expaço, ou a tecla @code{"r"}?}
                                                    @item{Qual mundo deve ser retornado se qualquer outra tecla for pressionada?}]}
Ao invés de enumerar todos os campos do mundo original, nós podemos usar a variável, @code{m}: 
@code[#:multi-line #t]{(define (keypress m tecla)
	(cond
                [(string=? tecla "up")  (make-mundo (mundo-caoX m) 
                                                  (mundo-rubiX m) 
                                               (+ (mundo-gatoY m) 10))]
                                                      
		[(string=? tecla "down")  (make-mundo (mundo-caoX m) 
                                                    (mundo-rubiX m) 
                                                 (- (mundo-gatoY m) 10))]
                [else m]))}
                 
A última cláusula em um condicional pode ser uma cláusula @code{else}, que é calculada se todas as cláusulas anteriores forem @code{falsas}.}
                         @teacher{Cláusulas @code{else} são melhores usadas como um catch-all* para casos que você não pode enumerar. (If you can state a precise 
                                   question for a clause), escreva uma pergunta precisa no lugar de um else. Por exemplo, se você tem um função que faz
                                   diferentes coisas dependendo de quanto a variável @code{x} é maior que @code{5}, é melhor para os iniciantes
                                   escreverem duas perguntas @code{(> x 5)} e @code{(<= x 5)}, do que ter a segunda questão sendo um @code{else}. 
                                   Questões explicitas tornam os programas fáceis de ler e de manter. Quando você usar um @code{else}, alguém terá que ler
                                   todas as questões anteriores para saber com qual condição o else corresponde: eles não podem apenas passar sobre todas as questões 
                                   para encontrar uma que combina com a situação. Isso torna o código mais legível e mais fácil de entender.}}
                 ]
         }     
@lesson/studteach[#:title "Keypresses no Seu Jogo"
        #:duration "35 minutos"
        #:overview ""
        #:learning-objectives @itemlist[@item{Using conditionals, students will write a function to handle different keypresses in their game.}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{No Mundo Ninja, o jogador pode apenas apertar duas teclas: @code{"up"} ou @code{"down"}. 
                                @activity{@itemlist[@item{Qual campo do Mundo muda quando a jogador pressiona @code{"up"}(para cima)? 
                                                         Como ele muda?}
                                                     @item{Pense na pessoa que está jogando seu jogo. Como ela irá controlar o jogo? Qual
                                                           tecla fará SEU jogador se mover para cima? E para baixo? O que mais eles pode fazer? Andar de um lado para o outro? 
                                                           Pular? Teleportar? Atirar um projétil?}
                                                     @item{Vá para a @worksheet-link[#:page 27 #:name "Lesson 6"] em sua apostila.
                                                                   Escreva as várias teclas que o usuário pode apertar para controlar o jogo. 
                                                                   Para cada uma, escreva o campo que é modificado na sua estrutura mundo, 
                                                                   e como ele muda.}]}}
                        @teacher{Revise as páginas da apostila dos alunos, e verifique a compreensão: eles podem mudar coisas múltiplas no jogo
                                 com apenas uma tecla?}}
                 @point{@student{@activity{Vá para @worksheet-link[#:page 30 #:name "Keypress-in-Game"] em sua apostila. Escolha 3 
                                           teclas que controlam o jogo, e ande pela Receita de Projeto: Escreva EXAMPLES para o que deve 
                                           acontecer com seu mundo INICIO dependendo de qual tecla for pressionada. Depois defina sua função. Uma vez
                                           que você completou a Receita de Projeto, digite sua função @code{keypress} em seus jogos.}

                                  Claro, funções keypress podem fazer muito mais em jogos que apenas mover um personagem para cima e para baixo. Usando o que
                                  você aprendeu sobre funções Booleanas, você pode adicionar movimentos mais avançados. Aqui vai algumas ideias:
@itemlist[
          @item{@bold{Teletransporte:} ao invés de ter a coordenada-y do jogador se modificada somando ou diminuindo, substitua com um Número para 
                 que seu jogador apareça derrepente nesse local. (Por exemplo, apertando a tecla @code{"c"} faz seu jogador teleportar
                 para o centro da tela, em y=240.)}
          @item{@bold{Detecção de Limites:} Mude a condição de se mover para cima para que o jogdor apenas se mova para cima se a @code{tecla} = @code{"up"} 
                 E a coordenada-y do jogador for menos que @code{480}. Da mesma maneira, mude a condição para @code{"down"} para também checar 
                 se a coordenada-y do jogador é maior do que 0.}
          @item{@bold{Não deixe fugir:} Adicione uma condição (antes de qualque tecla) para verificar se a coordenada-y do jogador está acima 
                 da tela @code{(> y 480)}. Se estiver, mova o jogador para baixo. Adicione outra condição para que o jogador 
                 apareça no topo da tela se ele se mover abaixo do chao.}
          @item{@bold{Desafio:} Tenha um personagem escondido quando você apertar a tecla @code{"h"}, e apenas re-apareça quando a tecla for pressionada novamente.}]
}
                         @teacher{Dica para o desafio: multiplique por -1!}}
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
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Com @vocab{condicionais} e @vocab{funções segmentadas}, você pode fazer muitas coisas acontecerem no seu 
                                     jogo com poucas linhas de código, como controlar o movimento dos personagens. Falando em 
                                     controlar personagens, o que acontece no Mundo Ninja quando o cachorro e o rubi saem da tela? 
                                     Eles continuam indo, mas não voltam - o mesmo problemas que vimos no Bootstrap:1, e se você 
                                     precisa de uma ajuda em como concertar isso, é o que vamos cobrir na pŕoxima unidade.}
                       @teacher{Peça aos alunos para que mostrem uns aos outros seus (jogos controláveis).}}
                 ]
         }
       }

       