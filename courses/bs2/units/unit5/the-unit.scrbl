#lang curr/lib

@title{Unidade 5: Construindo seu Mundo}

@declare-tags[management]

@unit-overview/auto[#:lang-table (list (list "Número" @code{+ - * / sq sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Figura"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]{
                                                                  @unit-descr{Depois de pensarem sobre seus Mundos, os alunos praticam construindo, desenhando e animando-o.}
}
@unit-lessons{
@lesson/studteach[#:title "Introdução"
        #:duration "5 minutos"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{Lápis/canetas aos alunos, e giz/marcadores de quadro branco aos professores}
                            @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                            @item{Ambiente de Edição (WeScheme ou DrRacket com o pacote bootstrap-teachpack instalado)}
                            @item{Apostila dos Alunos}
                            @item{Tabela da Linguagem}]
     #:preparation @itemlist[@item{Arranjos de assento: preferencialmente aglomerando as mesas}
                             @item{Protetor de folha de plático transparente: coloque as imagens 20 & 21 na parte da frente da apostila para facilitar a identificação}
                             @item{O arquivo Mundo Ninja 3 [NW3.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @editor-link[#:public-id "iQTSgnpSRp" "WeScheme"] pré-carregado nas máquinas dos alunos}
                             @item{BS:2 Modelo Jogo [GameTemplate.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @editor-link[#:public-id "mZCRewT44l" "WeScheme"] pré-carregado nas máquinas dos alunos com as imagens incluídas.}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity{Abra o @editor-link[#:public-id "iQTSgnpSRp" "Mundo Ninja"], e olhe 
                                          no @code{mundo} definido no início.
            @itemlist[@item{Quantas coisas estão nesse mundo? Quais são?}
                      @item{O que @code{caoX} representa? E @code{rubiX}? @bitmap{images/gameimage.png}}
                      @item{Qual função constrói um mundo?}
                      @item{Desça um pouco pelo código. Qual função atualiza o mundo?}
                      @item{Qual função desenha o mundo?}
                      @item{O quão rápido o cachorro está se movendo da esquerda para a direita? A que velocidade o rubi está se movendo da direita para a esquerda na tela?}
                      @item{Vá para @worksheet-link[#:page 21 #:name "Game Design"] em sua apostila. Quais são as coisas no seu mundo? De que tipo de dados elas são?}]}}
                        @teacher{Certifique-se que todos os alunos podem listar o nome e os tipos de tudo que está em sua estrutura @code{mundo}. Além disso,
                                 certifique-se que eles podem responder algumas perguntas sobre as funções de acesso, como em "como você consegue saber a velocidade do alien de fora
                                 do mundo?"}}
                 
                 @point{@student{Agora é hora de programar o SEU jogo. 
                                 @activity{Abra o @editor-link[#:public-id "mZCRewT44l" "BS:2 Modelo Jogo"].} No Bootstrap 1,
                                 você começou com a casca de um jogo, com algumas imagens de exemplo e funções definidas. Nesta aula o modelo de jogo é só
                                 uma coleção de comentários, contando a você como organizar suas funções e variáveis. Você estará escrevendo @italic{cada linha} do 
                                 código por conta própria. Vamos começar: 
                                 @activity{No início do arquivo, onde diz @code{;; O Mundo é:}, defina a estrutura mundo do seu jogo. 
                                          (Olhe a @worksheet-link[#:page 21 #:name "Game Design"] para refrescar sua memória.) Uma vez que você tem a estrutura mundo, desça 
                                          até onde mostra @code{;; INICIANDO MUNDO} e defina o seu primeiro exemplo de mundo: nomeie como @code{INICIO}.}}
                         @teacher{}}
                 
                 @point{@student{Então agora que você tem seu mundo, e sabe o que está nele: mas como são essas coisas? Você terá que adicionar algumas imagens.
                                 Você se lembra da função @code{bitmap/url} do Bootstrap 1? Ela recebe a URL de qualquer imagem online (dada como 
                                 string) e retorna a figura. @code{; bitmap/url : String -> Figura}
                                 @activity{@itemlist[@item{Olhe novamente na @worksheet-link[#:page 20 #:name "Game Design"] em sua apostila. Quantas coisas 
                                                           em seu jogo precisará de uma imagem própria?}
                                                      @item{Usando a pesquisa do Google Imagens ou uma ferramenta similar, encontre figuras para o cenário e para cada um dos  
                                                            personagens de seu jogo.}
                                                      @item{Defina novas variáveis para suas figuras, (i.e @code{JOGADOR}, @code{PERIGO}, etc.) e use
                                                            a função @code{bitmap/url} para colocá-las dentro do arquivo do seu jogo.}]}
                                 Algumas dicas para encontrar figuras: Suas figuras devem ser no formato PNG  ou GIF, e a url deve conter o tipo do arquivo
                                 (.png ou .gif) no final. Figuras do cenário de fundo devem ser 640x480, e figuras do personagem não devem ser maiores
                                 de 200px nas duas dimensões. Certifique-se que as imagens dos personagem devem ter fundo transparente! DICA: use 
                                 GIFs animadas para os personagens - não é apenas a animação que faz o jogo parecer melhor, mas essas figuras 
                                 geralmente têm fundos transparentes para começar.} 
                        @teacher{Encontre as figuras dos alunos antes da aula para economizar tempo, e use a função @code{bitmap/url} para colocá-las dentro de 
                                  um arquivo em branco para cada dupla de alunos.}}
                 ]
         }

@lesson/studteach[#:title "Desenhando o Mundo"
        #:duration "40 minutos"
        #:overview ""
        #:learning-objectives @itemlist[@item{Os alunos vão definir desenha-mundo, e à ligam em um manipulador de eventos}]
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
        @points[@point{@student{Agora que temos nossa estrutura mundo, precisamos saber como desenhá-la. 
                                @activity{Vá para  @worksheet-link[#:page 23 #:name "Drawing START"], e preencha seu mundo @code{INICIO} logo abaixo.
                                                   @itemlist[@item{De acordo com sua estrutura mundo, onde tudo deve estar quando o jogo começar?}
                                                              @item{Desenhe um simples esboço de seu mundo @code{INICIO} no espaço indicado.}]}
                                Em seguida coloque as imagens em ordem. Nós sabemos que devemos empilhar as figuras, então vamos usar a função @code{put-image}. 
                                @activity{Usando o desenho da @worksheet-link[#:page 23 #:name "Drawing START"], descubra qual imagem vai em cima,
                                                          qual vai em segundo lugar, e assim por diante. Faça uma lista de cima para baixo na coluna da esquerda 
                                                          Depois escreva cada coordenada das imagens na coluna da direita.}}
                        @teacher{}}
                 @point{@student{Vamos criar mais um exemplo. Isso ajudará quando você for escrever sua função que desenha o mundo, você está pronto para 
                                seguir. Na @worksheet-link[#:page 24 #:name "Drawing NEXT"] temos uma página quase idêntica à página 23. Você já escreveu o 
                                mundo @code{INICIO}, que tem tudo o que o jogo começa. Agora faça o mesmo para o mundo chamado 
                                @code{PROXIMO}. Esse mundo representa o jogo no PRÓXIMO QUADRO depois do INICIO.
                                @activity{@itemlist[@item{Preencha na estrutura mundo, e esboce o mundo @code{PROXIMO}.}
                                                     @item{Agora coloque as imagens na mesma ordem que o mundo @code{INICIO}. (Não queremos que elas 
                                                           troquem de posição no meio do jogo!) Então escreva as NOVAS coordenadas ao lado delas.}]}}
                        @teacher{Essas páginas da apostila ajudam os alunos a organizar seu pensamento antes de escrever sua própria função @code{desenha-mundo}. A ordem das
                                 figuras determinam quais figuras aparecem por cima das outras. (Isto faz mais sentido ter o rubi aparecer voando 
                                 @italic{atrás} da nuvem, ou na frente dela?)}}
                 
                        @point{@student{@activity{Qual função é usada para desenhar o mundo?} Assim com na @code{desenha-carro} e a função @code{desenha-mundo} 
                                         no Mundo Ninja, @code{desenha-mundo} recebe uma estrutura e produz uma Figura. 
                                         @activity{@itemlist[@item{Qual é o Domínio dessa função? E a Imagem da função?}
                                                              @item{No início da @worksheet-link[#:page 25 #:name "draw-world"], escreva a
                                                                    assinatura para @code{desenha-mundo}.}
                                                              @item{Preencha o cabeçalho da função para @code{desenha-mundo}.}]}}
                                @teacher{}}
                        @point{@student{Abaixo da definição da função, temos um caso padrão 'escada' usando @code{put-image}, assim como no 
                                         Mundo Ninja. Você se lembra da assinatura para @code{put-image}? Ela recebe uma figura, as coordenadas para 
                                         onde colocar a figura, e outra figura que ficará por baixo.
@code[#:multi-line #t]{; put-image : Figura Numero Numero Figura -> Figura
                       ; coloca a primeira figura nas coordenadas x e y recebidas sobre a segunda figura}
                                        @activity{@itemlist[@item{Comece do fundo da 'escada' colocando uma de suas
                                                                  figuras para o fundo.}
                                                             @item{Se você quiser que alguma figura fique centralizada na cena, quais são as coordenadas x e 
                                                                   y que você precisaria?}
                                                             @item{Mas você provavelmente não vai querer sua figura esteja no centro da tela.
                                                                   Olhe na página anterior na figura do seu mundo @code{INICIO}. Você fez uma anotação de quais
                                                                   coordenadas onde você quer quer as figuras fossem colocadas em cima do fundo.}]}
                                        Comece com algo que pareça com isso, substituindo SUA figura e coordenadas:
@code[#:multi-line #t]{(put-image IMAGEM
                                  320 240
                                  CENARIO)}
                                         @activity{@itemlist[@item{Coloque alguma de suas imagens sobre aquela imagem que essa expressão em 
                                                                   forma de 'escada' criou.}
                                                              @item{Continue aumentado a função, até você ter uma pilha com todas as imagens do seu jogo.}]}
}
                                @teacher{Trabalhe em pequenos grupos para completar essa seção. Quando os alunos terminarem de escrever desenha-mundo, peça que digitem seu 
                                         mundo PROXIMO e desenha-mundo dentro de seu jogo, na seção de @code{;; IMAGENS}. Se eles digitarem @code{(desenha-mundo INICIO)}
                                         na janela de interações, eles podem ver uma captura de tela do jogo.}}
                        ]
         }

@lesson/studteach[#:title "Atualizando o Mundo"
        #:duration "40 minutos"
        #:overview ""
        #:learning-objectives @itemlist[@item{Os alunos definem uma simples função atualiza-mundo, à relacionam com o evento on-tick}]
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
        @points[@point{@student{Desça pelo código até você ver @code{;; FUNCOES DE ATUALIZACAO}. Esse código é responsável por modificar o Mundo. 
                                @activity{Qual função você vê aqui? Qual é o Domínio dela? E a Imagem da função?}
                                @code{atualiza-mundo} recebe um mundo, e então retorna um novo mundo que foi atualizado. Pense nesta função 
                                como a que gera a próxima página de um flipbook(livreto que tem as páginas desenhadas, passando rápidamente nos dá a sensação de movimento).
            @activity{@itemlist[@item{Dê uma olhada na diferença entre os mundos @code{INICIO} e @code{PROXIMO}. O que mudou?}
                                @item{Na @worksheet-link[#:page 26 #:name "update-world"], faça uma lista do que mudou e como isso foi mudado
                                         com uma descrição do problema para escrever @code{atualiza-mundo}, usando a receita de projeto. Tenha certeza de preencher
                                         a @vocab{Assinatura} e dois EXAMPLEs antes de definir a função.}]}}
                        @teacher{@code{atualiza-mundo} é uma função que vai cuidar da lógica do jogo dos alunos. Ela determina o que muda
                                 de um segundo para o outro, e atualiza o mundo de acordo. Certifique-se que os alunos estão fazendo um novo mundo com
                                 @code{make-mundo}, e usando suas funções de acesso para mudar os valores de cada campo do mundo de acordo com 
                                 o comportamento de seu jogo. @management{Trabalhe com pequenos grupos para completar essa seção confome necessário. Quando eles
                                 tiverem terminado, peça que os alunos digitem @code{atualiza-mundo} dentro de seus jogos.}}}
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
        @points[@point{@student{Agora você tem o esqueleto básico do seu jogo, com suas figuras de personagens sobre a imagem de fundo 
                                e movendo-se. Entretanto, ainda não escrevemos nenhuma função que recebe uma ação do usuário. So você quiser que o 
                                JOGADOR se mova, você precisará aprender como fazer o jogo responder aos pressionamentos de teclas, 
                                que é o que você aprenderá na próxima unidade.}         
                       @teacher{Peça aos alunos que mostrem uns aos outros seus jogos animados! @management{Neste momento do curso 
                                os alunos terão jogos e estruturas Mundo muito diferentes. Os exemplos do Mundo Ninja servem como modelos
                                e guias para o que os alunos devem adicionar aos seus jogos a cada passo, mas a maioria vai exigir 
                                muita atenção individual para fazer seus jogos únicos se comportarem da maneira que eles querem.}}
                       }
                 ]
         }
       }