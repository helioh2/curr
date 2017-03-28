#lang curr/lib

@title{Unidade 7: atualiza-mundo Modificada}
@declare-tags[management]

@unit-overview/auto[#:lang-table (list (list "Número" @code{+ - * / sq sqrt expt}) 
                                       (list "String" @code{string-append string-length})                          
                                       (list "Figura" @code{rectangle circle triangle ellipse radial-star scale rotate put-image}))]{
@unit-descr{Os alunos continuam a combinar o uso de Cond com Estruturas de Dados, desta vez identificando maneiras pelas quais a estrutura Mundo pode mudar sem qualquer entrada do usuário.}
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
                            @item{Apostila do aluno}
                            @item{Tabela da Linguagem}
                            @item{Arquivo do Mundo Ninja 4 [NW4.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @editor-link[#:public-id "tYeLoTuxpd" "WeScheme"] pré-carregado nas máquinas dos alunos}]
        #:preparation @itemlist[@item{Arranjos de assento: preferencialmente aglomerando as mesas}
                                @item{Escreva a versão de atualiza-mundo do Mundo Ninja, com espaço para transformá-al em um ramos cond depois do cabeçalho da função.}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity{@itemlist[@item{Abra o arquivo do @editor-link[#:public-id "tYeLoTuxpd" "Ninja World 4"].}
                                          @item{O que temos dentro da estrutura mundo?}
                                          @item{O que a função @code{atualiza-mundo} faz?}
                                          @item{Qual é o valor de @code{caoX} quando o cachorro está no centro da tela? De acordo com o código, qual seria a 
                                                próxima posição do @code{caoX}?}
                                          @item{Qual é o valor de @code{caoX} quando o cachorro estiver na borda direita da tela? Qual seria o próximo valor de @code{caoX}? E 
                                                 o próximo? E o próximo?}
                                          @item{O que acontece quando o cachorro atinge a borda da tela? O que DEVERIA acontecer?}]}
                                 Até agora o cão está sainda da tela e nunca mais volta. É hora de arrumar isso. }
                        @teacher{@management{Certifique-se de dar aos alunos muito reforço positivo neste momento - o jogo está
                                             realmente tomando forma!}}}
                 ]
         }                               
@lesson/studteach[#:title "Protegendo os Limites"
        #:duration "20 minutos"
        #:overview ""
        #:learning-objectives @itemlist[@item{Adicionado detalhes á sua compreensão da função atualiza-mundo}
                                         @item{Identificar possíveis sub-domínios que exigem um comportamento diferente da função}]
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
        @points[@point{@student{Assim como no Bootstrap 1, precisamos escrever uma função que verifica se o cachorro saiu da tela pelo lado 
                                direito. Primeiro, vamos analisar algumas coisas:
                                @activity{@itemlist[@item{@code{true}(verdadeiro) e @code{false}(falso) são exemplo de qual tipo de dado?}
                                                     @item{Qual função recebe dois números como entrada e verifica se o primeiro número é 
                                                           @italic{maior que} o segundo?}
                                                     @item{Qual função verifica se um número é @italic{menor que} outro?}
                                                     @item{Qual função verifica se dois números são @italic{iguais}?}]}
                                Aqui está uma assinatura da função maior que:
@code[#:multi-line #t]{; > : Numero Numero -> Booleano
                     ; Verifica se o primeiro número é maior que o segundo}
                               @activity{Copie isso na sua Página de Assinaturas e escreva as assinaturas para outras duas funções Booleanas.}}
                        @teacher{@management{Revise Booleanos e funções Booleanas, incluindo @code{>}, @code{<}, @code{=}, @code{and}(e), e 
                                             @code{or}(ou). Certifique que os alunos copiaram as assinaturas em suas apostilas.}}}
                 
                 @point{@student{@activity{@itemlist[@item{Vá para a @worksheet-link[#:page 33 #:name "Boundary Checks"] em sua apostila.}
                                                      @item{Qual é o nome da primeira função nesta página?}
                                                      @item{@code{saiu-direita?} retornará @code{true} se um personagem sair da tela pelo lado direito 
                                                             da tela. Até quanto a coordenada-x do personagem pode ir antes dele sair 
                                                             da tela? (Dica:Qual é o tamanho da tela?)}
                                                      @item{Escreva a @vocab{Assinatura} para esta função.}]}
@code[#:multi-line #true]{; saiu-direita? : Numero -> Booleano
                     ; retorna true(verdadeiro) se o número recebido for maior que 640}
                                 Agora vamos pegar alguns exemplos de coordenadas para escrever nossos Exemplos: 
                                 @activity{@itemlist[@item{Qual coordenada-x colocaria um personagem no meio da tela?}
                                                      @item{Como você verifica se ele está fora do lado direito?}
                                                      @item{Qualquer coodernada-x maior que 640 está além do limite do lado direito da tela, então como 
                                                            você determinaria se o número de exemplo é @italic{maior que} 640?}]}
                                 @code{(EXAMPLE (saiu-direita? 320) (> 320 640))}
                                 @activity{Escreva outro EXAMPLE de uma coordenada que está fora da tela pelo lado direito, circule o que 
                                           é mutável, e escreva sua definição de função.}}
                         @teacher{Relembre os alunos da Borboleta Sam do Bootstrap 1. Esta função faz a mesma coisa que @code{direita-salvo},
                                  determina se um personagem saiu da tela baseado em sua coordenada-x.@management{Garanta que os alunos
                                  estão usando o nome inteiro de @code{saiu-direita?}, incluindo o ponto de interrogação. Pontos de interrogação são usados com frequência em funções
                                  que retornam booleanos como conveção: A função faz uma pergunta (O personagem está além do limite direito da tela?)
                                  e recebe ou @code{true} ou @code{false} como resposta.}}}
                 
                 @point{@student{Agora você tem uma função que verifica se um objeto correu para fora do lado direito. Mas pense
                                 sobre o Mundo Ninja: se o Rubi está se movendo para a esquerda, ele irá sair pelo lado direito da tela? 
                                 @activity{@itemlist[@item{Complete a receita para @code{saiu-esquerda?} na
                                                           @worksheet-link[#:page 33 #:name "Boundary Checks"]. Ao invés de verificar se 
                                                           um número é maior do que 640, o que você precisa checar?}
                                                      @item{Quando terminar, copie suas funções em seu arquivo do 
                                                            @editor-link[#:public-id "tYeLoTuxpd" "Ninja World 4"] 
                                                            , onde diz @code{;; TESTES DE CONDIÇÃO}.}]}}
                         @teacher{}}
                 @point{@student{Agora temos um meio de verificar se algo saiu pela direita OU pela esquerda da tela, mas ainda
                                 não dissemos ao jogo o que fazer quando isso acontece. No Mundo Ninja, depois do cachorro sair pelo lado direito
                                 da tela, ele deve reaparecer no lado esquerdo. 
                                 @activity{Nessa situação, qual seria o próximo @code{caoX} depois de 640?}
                                 Nós queremos mudar o @code{atualiza-mundo} para que ele se comporte da maneira antiga na maior parte do tempo, mas muda
                                 @code{caoX} para zero quando @code{caoX} for maior que 640. 
                                 @activity{O que você pode usar para fazer uma função se comportar de uma maneira para algumas entradas mas de outra maneira para 
                                           entradas diferentes?}
                                 Por enquanto temos duas @italic{condições diferentes}: quando @code{caoX} for maior que 640 e o 
                                 resto do tempo. Vamos trabalhar no código para isso:
 @code[#:multi-line #t]{(define (atualiza-mundo m)
	(cond
		[...teste...  ...resultado...]
		[else  (make-mundo  (+ (mundo-caoX m) 10) 
				    (- (mundo-rubiX m) 5)
				       (mundo-gatoY m))]))}}
                         @teacher{Relebre os alunos que todo ramo de @code{cond} deve ter um teste e um resultado, que é calculado quando o teste retorna @code{true}(verdadeiro).}}
                 @point{@student{Nós queremos ainda que nosso código original fique ali. Ele será usado no caso @code{else}, 
                                  porque quando @code{caoX} não tiver ultrapassado o limite direito da tela, queremos que o mundo se atualize normalmente.
                                  @activity{Pense sobre a primeira condição. O que o teste lhe diz se o número for maior que 640?}
                                  Você poderia usar a função maior que(@code{>}) e comparar dois números, mas você já escreveu uma
                                  função que recebe apenas um número e lhe diz se é ou não é maior que 640. 
                                  @code{saiu-direita?} @italic{faz o trabalho para você}. Mas como você vai determinar se o cachorro está dentro ou fora 
                                  do limite da direita? Você precisará pegar a coordenada-x do cachorro de dentro do mundo... 
                                  @activity{@itemlist[@item{Qual função nós usamos para isso?}
                                                       @item{Então na função @code{saiu-direita?}, qual a entrada para ela?}
                                                       @item{Adicione isso na sua função @code{atualiza-mundo}:}]}
 @code[#:multi-line #t]{(define (atualiza-mundo m)
	(cond
		[(saiu-direita? (mundo-caoX m)) ...resultado...]
		[else  (make-mundo  (+ (mundo-caoX m) 10) 
				    (- (mundo-rubiX m) 5)
				       (mundo-gatoY m))]))}}
                         @teacher{}}
                 @point{@student{A primeira cláusula testa se a coordenada-x do cachorro está fora do limite direito da tela. Se o teste 
                                   retornar @code{true}(verdadeiro), o que deveria ser o resultado? Sabemos que precisamos retornar um Mundo, pois a Imagem
                                   de @code{atualiza-mundo} é um Mundo. Isso significa que podemos escrever imediatamente @code{(make-mundo...)}: 
 @code[#:multi-line #t]{(define (atualiza-mundo m)
	(cond
		[(saiu-direita? (mundo-caoX m)) 
			(make-mundo ...caoX...
				    ...rubiX...
				    ...gatoY...)]
		[else  (make-mundo  (+ (mundo-caoX m) 10) 
				    (- (mundo-rubiX m) 5)
				       (mundo-gatoY m))]))}
                                  Como o @code{caoX} muda dentro dessa condição? Nós dissemos que queremos que o cão apareça no lado esquerdo 
                                  da tela.
                                  @activity{@itemlist[@item{Qual será o novo valor de @code{caoX}, para que ele apareça de volta ao 
                                                            lado esquerdo da tela?}
                                                       @item{O @code{rubiX} muda se o cachorro sair da tela? E o @code{gatoY}?}]}
 @code[#:multi-line #t]{(define (atualiza-mundo m)
	(cond
		[(saiu-direita? (mundo-caoX m)) 
			(make-mundo 0
				    (mundo-rubiX m)
				    (mundo-gatoY m))]
		[else  (make-mundo  (+ (mundo-caoX m) 10) 
				    (- (mundo-rubiX m) 5)
				    (mundo-gatoY m))]))}}
                         @teacher{}}
                 @point{@student{Agora é hora de pensar sobre o rubi...
                                  @activity{@itemlist[@item{Ao invés de checar se @code{rubiX} saiu pelo lado @bold{direito} da tela,
                                                            o que precisamos olhar?}
                                                       @item{Qual função que você já escreveu que verifica se um número é menor do que 0?}
                                                       @item{Como @code{atualiza-mundo} precisa mudar? Como o segundo ramo do @code{cond} 
                                                             deveria se parecer?}
                                                       @item{Termine o código para @code{atualiza-mundo} para que ele verifique se o 
                                                             rubi ultrapassou o limite esquerdo da tela.}]}
@code[#:multi-line #t]{(define (atualiza-mundo m)
	(cond
		[(saiu-direita? (mundo-caoX m)) 
			(make-mundo 0
				    (mundo-rubiX m)
				    (mundo-gatoY m))]
		[(saiu-esquerda? (mundo-rubiX m)) 
			(make-mundo (mundo-caoX m)
				    640
				    (mundo-gatoY m))]
		[else  (make-mundo  (+ (mundo-caoX m) 10) 
				    (- (mundo-rubiX m) 5)
				    (mundo-gatoY m))]))}}
                         @teacher{Essa pode ser uma oportunidade para discutir abstração e a utilidade de reuso de código com seus
                                  alunos. Os testes @code{cond} dentro de @code{atualiza-mundo} poderia ser escrito como: 
                                  @code{(> (mundo-caoX m) 640)}, ou @code{(< (mundo-rubiX m) 0)}, mas é mais esforço que 
                                  neccessário se as funções @code{saiu-direita?} e @code{saiu-esquerda?} já estão escritas, e poderia 
                                  ser confuso para outra pessoa que olha o código, quem não sabe o porque do @code{caoX} ser 
                                  comparado com 640. Além disso, do ponto de vista da programação, faz mais sentido usar os 
                                  limites específicos da tela o menos possível: Se um programador quer seu
                                  jogo sendo jogado em uma tela maior (como de um tablet), ele vai ter que percorrer todo o seu
                                  código e mudar todas as funções onde aparecem os limites da tela antiga, 640x480. Se 
                                  apenas as funções @code{saiu-direita?} e @code{saiu-esquerda?} usam o tamanho da tela, o programador pode 
                                  fazer poucas mudanças e rápidas nos números, ao invés de ter que procurar pelos ramos do @code{cond}, 
                                  como no segundo exemplo.}}
                 ]
         }
       
@lesson/studteach[#:title "Testes e Resultados"
        #:duration "45 minutos"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Alunos vão usar Cond em suas funções atualiza-mundo}
                                     @item{Alunos identificarão circunstâncias onde as funções de seus jogos precisam ter um comportamento diferentes}
          @item{Alunos definirão essas circunstâncias - e o comportamento desejado - no código, em diferentes ramos do Cond}]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Agora, use o que você sabe sobre detecção de limites e aplique no seu próprio jogo. 
                                @activity{@itemlist[@item{Abra o arquivo do seu jogo.}
                                                     @item{Refatore sua função @code{atualiza-mundo} para que ela use 
                                                           @code{cond}s, com seu código atual dentro da caso @code{else}.}
                                                     @item{Depois, copie e cole suas funções @code{saiu-esquerda?} e @code{saiu-direita?} 
                                                           do Mundo Ninja para o seu jogo.}
                                                     @item{Pense sobre as coisas do seu jogo que voam para fora da tela. Elas 
                                                           voam para fora da esquerda? Da direita? Por cima ou por baixo? Você precisa 
                                                           escrever uma função @code{saiu-cima?} ou @code{saiu-baixo?}}
                                                     @item{Na coluna do lado esquerdo da @worksheet-link[#:page 34 #:name "Test and Result"],
                                                           faça uma lista dos testes que você precisa fazer para decidir se cada coisa
                                                           voa para fora da tela. Por exemplo, com o cachorro nós dissemos
                                                           @code{(saiu-direita? (mundo-caoX m))}. À direita, descubra 
                                                           qual mundo você precisa fazer, para que a coisa
                                                           que você está testando reapareça na tela depois que ela tenha saído.}]}}
                        @teacher{Trabalhe em pequenos grupos para completar essa página da apostila.}}
                 ]
         }

@lesson/studteach[#:title "Ramos na atualiza-mundo"
        #:duration "15 minutos"
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
        @points[@point{@student{Olhe para os ramos do @code{cond} na função @code{atualiza-mundo} do Mundo Ninja. Perceba 
                                            que cada ramo, precisamos de um teste e um resultado. Isso é exatamente o que 
                                            você escreveu em sua apostila para o seu jogo. Tudo o que precisa fazer agora é 
                                            cercar cada linha da sua tabela com colchetes e digite-a em 
                                            seu jogo.
                                            @activity{Adapte @code{atualiza-mundo} para que cada coisa reapareça na 
                                                            tela depois de ter saído.}}
                        @teacher{Trabalhe em pares ou pequenos grupo para ajudar os alunos em suas próprias funções
                                 @code{atualiza-mundo}.}}
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
        @points[@point{@student{Tome um minuto e admire seu trabalho: Você colocou muito tempo e empenho no seu jogo 
                                durante esse curso, e está se unindo bem com estrutura de dados complexos
                                e movimentos avançados. Isso já é muito mais sofisticado que seu jogo do Bootstrap 1! 
                                Mas algo ainda está faltando: no jogo Gato Ninja, nada acontece quando o gato 
                                colide com o cachorro, ou com o rubi. Na próxima lição vamos mudar isso: você será capaz
                                de lidar com colisões com os personagens do seu jogo! Comece a pensar sobre o que deveria 
                                acontecer quando seu jogador pega algum tesouro, atira em um zumbi, ou alguma outra condição 
                                do seu jogo.}
                        @teacher{@management{Recorde os alunos até onde eles chegaram desde o Bootstrap 1 e o início
                                             do Bootstrap 2. Eles expandiram seus conhecimentos de Racket e programação, 
                                             aprenderam sobre um novo tipo de dados e criaram seus próprios jogos avançados!}
                                  Peça aos alunos para que mostrem seus jogos uns aos outros.}}
                 ]
         }
       }