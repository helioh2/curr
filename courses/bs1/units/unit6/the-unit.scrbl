#lang curr/lib
@declare-tags[management]

@title{Unidade 6: Comparando Funções}

@unit-overview/auto[#:lang-table (list (list "Numero" @code{+ - * / sq sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Figura"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]{
@unit-descr{Os alunos descobrem tipos Booleanos, e os usam para criar programas que testam valores, e então modelam o cenário usando esses programas.}
}

@unit-lessons{
@lesson/studteach[
     #:title "Revisão"
     #:duration "15 minutos"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[@item{Lápis/canetas aos alunos, e giz/marcadores de quadro branco aos professores}
                            @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                            @item{Tabela da Linguagem(veja abaixo)}]
     #:preparation @itemlist[@item{OPCIONAL: Distribua a @(hyperlink "https://docs.google.com/document/d/1MUFoGYpftF5rzk0-Gp2eoE7ryvsCoIEtXyVuC4FltTI/edit?usp=sharing" "Atividade de Aquecimento").}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@item{@student{Quais tipos de dados você viu até agora? Você pode pensar em valores do tipo @code{Número}? Do tipo @code{String}? Do tipo @code{Figura}?
                               Quais são algumas expressões que produzem um @code{Número}? E quanto aos outros tipos de dados?}
                       @teacher{Antes de apresentar um novo tipo dado (Booleano), esta pode ser uma boa hora para revisar rapidamente os três principais
                                cenários onde vocês aprenderam a trabalhar com expressões: Círculos de Avaliação, Assinatura e Receita de Projeto.
                                Nesta lição, alunos irão aplicar cada um destes cenários aos Booleanos, descobrindo que tudo que já aprenderam
                                ainda aplica-se mesmo em um novo tipo.}}]}

@lesson/studteach[
     #:title "Booleanos"
     #:duration "10 minutos"
     #:overview "Alunos ão apresentados a um novo tipo (Booleano), e praticam os usando e mconjunto com Círculos de Avaliação, Assinaturas e Código."
     #:learning-objectives @itemlist[@item{Alunos aprendem sobre valores Booleanos e funções que os manipulam}]
     #:evidence-statements @itemlist[@item{Alunos vão conhecer sobre os dois valores Booleanos(true/verdadeiro e false/falso)}
                                     @item{Alunos escreverão Círculos de Avaliação para funções que produzem o tipo Booleano}
                                     @item{Alunos aprendem como usar operadores aritméticos (como @code{<} e @code{>}) que produzem Booleanos}
                                    ]
     #:product-outcomes @itemlist[]
     #:standards (list "7.EE.3-4" "BS-IDE" "BS-PL.1" "BS-PL.2")
     #:materials @itemlist[@item{Lápis/canetas aos alunos, e giz/marcadores de quadro branco aos professores}
                            @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                            @item{Tabela da Linguagem(veja abaixo)}]
     #:preparation @itemlist[]
     #:prerequisites (list "Intro to Programming" "Contracts")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity[#:forevidence (list "BS-IDE&1&1")]{O que cada uma das seguintes expressões @vocab{retornam} a você? (Se você não tem certeza, você pode digitar e descobrir!)
                              @itemlist[@item{@code{(+ 1 4)}}
                                         @item{@code{(/ 4 2)}}
                                         @item{@code{(circle 10 "solid" "blue")}}
                                         @item{@code{(< 3 4)}}]}}
                        @teacher{}
                        }
                 @point{@student{A última expressão, @code{(< 3 4)},
usa uma nova função que @italic{compara Números}, retornando
@code{verdadeiro} se 3 for menor do que 4. O que você acha que a expressão retornaria se os números forem trocados de lugar?
                                 @activity[#:forevidence (list "BS-IDE&1&1")]{
                                        A função @code{<} testa se o primeiro número é menor que o outro. Você pode pensar em alguns outros testes? 
                                                 Experimente-os na Janela de Interações.}
                         Funções como @code{<}, @code{>} e @code{=} sempre recebem dois números em seu Domínio, e produzem um valor especial chamado 
                         de @vocab{Booleano} como sua Imagem. Booleanos são respostas para perguntas do tipo sim/não, e funções Booleanas são usadas para realizar testes.
                         Em um videogame, você pode testar se um jogador tem caminhado sobre uma parede, ou se sua vida é igual à zero. Uma máquina em um consultório médico 
                         pode usar Booleanos para testar se a frequência cardíaca de um paciente está acima ou abaixo de determinado nível.
                                                @bannerline{Valores Booleanos podem ser apenas @code{verdadeiro} ou @code{falso}.}
                                                @activity[#:forevidence (list "BS-IDE&1&1" "BS-PL.1&1&1")]{Tente digitar um Número na Janela de Interações e aperte Enter. O que você espera receber de volta? E quanto a uma String? Agora tente um Booleano, como @code{false}. Assim como todos estes valores, Booleanos retornam eles mesmos. Círculos de Avaliação podem serem usados com Booleanos: tente converter cada uma das expressões em Círculo de Avaliação, e então converta os Círculos em código:
                                   @itemlist[@item{@math{10 = 16.1}}
                                         @item{@math{-13 \gt 5}}
                                         @item{@math{40-1 \lt 90*2}}
                                         @item{@math{0 = -5 + 10}}]}}
                        @teacher{Dê aos alunos muita prática aqui! Você pode ver um video de demonstração de Introdução em @(video-link (hyperlink "http://www.youtube.com/watch?v=X7gAXxpBhUo" "Video Aula: Intro to Booleans/Introdução a Booleanos"))}
                        }
                 @point{@student{Existem muitas outras funções que produzem Booleanos. Aqui está uma que pode ser usada para comparar duas @vocab{Strings}: @code[#:multi-line #t]{(string=? "bananas" "laranjas")}
                                 @activity[#:forevidence (list "BS-PL.2&1&1" "BS-PL.2&1&3")]{Certifique-se de escrever a @vocab{Assinatura} completa destas quatro funções Booleanas.}}
                         @teacher{Certifique-se de que os alunos estão confortáveis usando Booleanos para comparar subexpressões mais complexas, em vez de apenas comparar dois Números.}
                         }
                 ]}
                 
@lesson/studteach[
     #:title "esta-na-tela? 1.0"
     #:duration "25 minutos"
     #:overview "Alunos usam a Receita de Projeto para escrever uma simples função que produz Booleanos"
     #:learning-objectives @itemlist[@item{Alunos usam Booleanos para determinar quando um elemento do jogo está parcialmente visível na tela}
                                     @item{Alunos escrevem funções que usam outras funções já feitas anteriormente para calcular as respostas}
                                    ]
     #:evidence-statements @itemlist[@item{Alunos podem escrever funções que consomem uma única coordenada de eixo e determinar se ela está dentro do limite de um tamanho fixo na tela}
                                     @item{Alunos podem usar uma função que já escreveram anteriormente para calcular a resposta para outra função}
]
     #:product-outcomes @itemlist[]
     #:standards (list "BS-DR.2" "BS-DR.3" "F-IF.1-3" "F-IF.4-6" "7.EE.3-4" "8.F.1-3")
     #:materials @itemlist[@item{Lápis/canetas aos alunos, e giz/marcadores de quadro branco aos professores}
                            @item{@(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "Apostila do aluno")}
                            @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                            @item{Tabela da Linguagem(veja abaixo)}]
     #:preparation @itemlist[@item{"Gaiola" [Cage.rkt from @(resource-link #:path "source-files.zip" #:label "source-files.zip") | @(hyperlink "http://www.wescheme.org/openEditor?publicId=kXgsH8Hd7f" "WeScheme")] pré-carregado nas máquinas dos alunos.}]
     #:prerequisites (list "Booleans" "The Design Recipe")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{Many students struggle with the idea that "false" means "wrong". When students write EXAMPLEs for these functions, they will often avoid using "unsafe" coordinates, because they don't want to have an expression be "wrong". Remind them that these functions @bold{should} return false sometimes!}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Abra o programa "Gaiola"(Gaiola.rkt de @(resource-link #:path "source-files.zip" #:label "source-files.zip") ou no @editor-link[#:public-id "kXgsH8Hd7f" "WeScheme"]) em seu computador,
                                                                       e clique "Run". A tela que aparece contém uma borboleta, que você pode mover usando as setas do seu teclado. O nome da borboleta é Sam, e a tela em que ela está é seu quintal. Assim como a tela de um videogame, este quintal tem 640 pixels de largura e 480 de altura! Como você pode ver, Sam é livre para andar livre pelo quintal, e suas coordenadas aparecem no topo da tela nos dizem sua localização.}
                        @teacher{Esta pode ser uma boa oportunidade para rever coordenadas, para estudantes que precisam praticar.}
                        }
                 @point{@student{@bitmap{images/buffer.png}A mãe de Sam disse que ela pode sair do quintal, mas por uma curta distância! Especificamente, ela quer ter certeza de que sempre pode vê-la, ao menos uma parte dela. Sam está segura @italic{desde que alguma parte dela esteja na tela}. Isso significa que ela pode ir um pouco além do zero pela esquerda, ou passar um pouco de 640 pela direita - mas quão longe ela @italic{pode} ir?
                                @activity[#:forevidence (list "7.EE.3-4&1&5" "A-CED.1-4&1&1")]{Vá para @worksheet-link[#:page 17 #:name "Protecting-Sam"], e leia a metade superior da página. Usando as setas de direção, veja quanto Sam pode ir para a esquerda @italic{ainda aparecendo na tela}. Você encontrará que Sam está na tela enquanto sua coordenada-x for @italic{maior que} -50, que é exatamente o código que está preenchido no primeiro problema da página.
                                                  @itemlist[@item{Descubra o quão longe Sam pode ir pela direita ainda aparecendo na tela.}
                                                             @item{Preencha o código do segundo problema.}
                                                             @item{Converta as duas expressões em Círculos de Avaliação, usando os círculos vazios na parte de baixo da página.}]}}
                         @teacher{Preste muita atenção nos casos de canto: Sam aparece na tela em 690? E em 680?}
                         }
                 @point{@student{Infelizmente, até agora não existe nada que impeça a Sam de sair do quintal! Olhando para o código encontramos três definições de funções:
                                  @itemlist[@item{@code{esquerda-salvo?}, que recebe a coordenada-x de Sam e verifica se Sam está segura do lado esquerdo da tela. Neste momento a função sempre retornará @code{true}.}
                                             @item{@code{direita-salvo?}, recebe a coordenada-x de Sam e verifica se Sam está segura do lado direito da tela. Neste momento a função sempre retornará @code{true}.}
                                             @item{@code{esta-na-tela?}, recebe a coordenada-x de Sam e verifica se pelo menos uma parte dela está visível na tela. Neste momento, essa função somente @italic{pergunta para @code{esquerda-salvo?} se a coordenada-x recebida é segura.}}]
                                  Até agora, todas as três funções retornam @code{true} não importando qual seja a coordenada-x de Sam!}
                         @teacher{É de grande importância neste momento que três alunos voluntários representem e demonstrem como elas funcionam:
                                  @itemlist[@item{Peça a cada aluno para dizer o Nome, Domínio e Imagem. Se eles se embaraçarem, relembre eles todas as informações escritas na Assinatura!}
                                             @item{Pratique chamando cada função, dizendo seu nome e em seguida dando-lhes uma coordenada-x. Por Exemplo, "esquerda-salvo? vinte" significa que o número @code{20} está sendo passado para @code{esquerda-salvo?}. Que o aluno deve retornar "true", pois o código está retornando atualmente @code{true} para todos os valores de x.}
                                             @item{Faça isso para as três funções, e tenha a prática de chama-las com valores diferentes.}
                                             @item{Nota: no exemplo de @code{esta-na-tela?} deve primero chamar @code{esquerda-salvo?}, antes de responder com o valor.}]}
                         }
                 @point{@student{Neste momento @code{esquerda-salvo?} está ignorando a coordenada-x de Sam, e retornando @code{true} cegamente não importando onde ela esteja. 
                                           O que a função deveria fazer ao invés disso? 
                                           @activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1" "8.F.1-3&1&1" "F-IF.1-3&1&1")]{
                                                 Vá para @worksheet-link[#:page 18 #:name "safe-left?"] em sua apostila. Use a Receita de Projeto para corrigir 
                                                 esta função, de modo a função @code{esquerda-salvo} receba a coordenada-x de Sam e retorne @code{true} ou @code{false}
                                                 dependendo se ela for @italic{maior que -50}.}
                                           Depois de ter digitado Exemplos e a definição para @code{esquerda-salvo?}, clique em "Run" e veja se Sam está impedida
                                           de voar para fora do lado esquerdo da tela. Certifique-se de testar sua função na Janela de interações, por exemplo:
                                  @code[#:multi-line #t]{(esquerda-salvo? 50)
                                                         (esquerda-salvo? -100)
                                                         (esquerda-salvo? 50)
                                                         (esquerda-salvo? -100)}
                                  }
                         @teacher{Lembre os alunos que eles já escreveram o teste para isso na página 19! 
                                 @management{Isto pode ser útil para que os alunos completem a atividade em partes, dando algum tempo para
                                             escreverem a Assinatura e a Declaração de propósito, então um curto tempo para escreverem seu primeiro exemplo, o segundo, etc.
                                             Esclarecendo e revisando a cada passo, é provável que vocẽ descubra mal-entendidos no início do processo.}
                                 Peça aos três voluntários de antes que, representem o código de @code{esquerda-salvo?} para ver se está escrito corretamente. Como antes, assugure-se que os alunos pratiquem chamando cada função individualmente: agora @code{esquerda-salvo?} será capaz de retornar @code{true} ou @code{false}, (como será @code{esta-na-tela?}), enquanto @code{direita-salvo?} ainda retorna apenas @code{true}.}
                         }
                 @point{@student{@activity[#:forevidence (list "7.EE.3-4&1&1" "7.EE.3-4&1&3" "7.EE.3-4&1&4" "7.EE.3-4&1&5" "7.EE.3-4&1&10" "F-IF.4-6&1&1")]{
                                     Vá para @worksheet-link[#:page 19 #:name "safe-right?"] em sua apostila. Use a Receita de Projeto para corrigir esta função, 
                                     para que @code{direita-salvo?} receba a coodernada-x de Sam e retorne @code{true} ou @code{false} dependendo se o valor
                                     for @italic{menor que 690}.
                                     }
                                  }
                         @teacher{Depois de passear por @code{direita-salvo?} seção por seção, os alunos devem ser capazes de completar esta atividade por conta própria. 
                                  Se eles estão se dando bem com a programação, você pode discutir se comparar a coordenada-x com @code{690} ou com 
                                  @code{(+ 640 50), ambos produzem o mesmo resultado, mas o segundo revela onde o 690 vem(comprimento da tela mais 50).}
                                  }
                         }
                 @point{@student{Depois de ter digitado Exemplos e a definição para @code{direita-salvo?}, clique "Run" e veja se Sam está impedida de voar para fora do lado direito. Você pode se surpreender com o que acontece! Tese sua função na Janela de Interações:
                                  @code[#:multi-line #t]{(direita-salvo? 50)
                                                         (direita-salvo? 810)
                                                         (esta-na-tela? 50)
                                                         (esta-na-tela? 810)}
                         A @code{direita-salvo?} está funcionado como esperado? E @code{esta-na-tela?} está funcionando como esperado?
                         A função @code{esta-na-tela} está apenas perguntando para @code{esquerda-salvo?}, isso significa que Sam está protegida apenas do lado esquerdo da tela.
                          @activity{Altere o código de @code{esta-na-tela?} para que ela chame @code{direita-salvo?} ao invés de (esquerda-salvo?). 
                                   Agora Sam será protegida do lado direito da tela, mas não do esquerdo. O que @code{esta-na-tela} deve fazer?}}
                         @teacher{Chame os três voluntários novamente, e repita a atividade. Agora @code{direita-salvo?} e @code{esquerda-salvo?} comportam-se corretamente, mas @code{esta-na-tela?} ainda está perguntando @bold{somente para @code{esquerda-salvo}!}}
                         }
                 ]}
                 

@lesson/studteach[
     #:title "and/or e/ou"
     #:duration "10 minutos"
     #:overview "Estudantes são apresentados a e/ou, duas funções que consomem Booleanos"
     #:learning-objectives @itemlist[@item{Alunos aprendem a combinar valores Booleanos com @code{and} e @code{or}}]
     #:evidence-statements @itemlist[@item{Alunos entendem quando usar @code{and} ou @code{or}}
                                     @item{Alunos escrevem Círculos de Avaliação para expressões que usam @code{and} e @code{or}}
                                     @item{Alunos podem escrever expressões que usam @code{and} e @code{or}}
                                     @item{Alunos podem definir as respostas produzidas por expressões que usam @code{and} e @code{or}}]
     #:product-outcomes @itemlist[]
     #:exercises (list (make-exercise-locator "AndOr" "boolean-coe-to-code1"))
     #:standards (list)
     #:materials @itemlist[@item{Lápis/canetas aos alunos, e giz/marcadores de quadro branco aos professores}
                            @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                            @item{Tabela da Linguagem(veja abaixo)}]
     #:preparation @itemlist[]
     #:prerequisites (list "Booleans" "Contracts")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{Many students struggle with the idea that "false" means "wrong". When students write EXAMPLEs for these functions, they will often avoid using "unsafe" coordinates, because they don't want to have an expression be "wrong". Remind them that these functions @bold{should} return false sometimes!}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
       @points[@point{@student{Você já aprendeu algumas funções que permitem que você crie Booleanos. As funções @code{<} e @code{>}, por exemplo, retornam um booleano cada um quando aplicadas com a entrada adequada. O que acontece quando você quiser @italic{combinar} esses testes, para ver se mais de um coisa é verdade? 
                                @activity{Considere as seguintes afirmações - elas são verdadeiras ou falsas?:
                                           @itemlist[@item{Açucar é doce}
                                                      @item{Gelo é quente}
                                                      @item{Açucar é doce @bold{and/e} Gelo é frio}
                                                      @item{Açucar é doce @bold{and/e} Gelo é quente}
                                                      @item{Açucar é doce @bold{or/ou} Gelo é frio}
                                                      @item{Açucar é doce @bold{or/ou} Gelo é quente}]}
                                }
                       @teacher{Desafiar os alunos em suas respostas aqui - pedir-lhes para explicar porque escolheram "verdadeiro" ou "falso" para as afirmações, especialmente se a estrutura for composta de uma mistura de verdadeiro e falso.}
                       }
                @point{@student{@code{and} e @code{or} são duas novas funções.
                                 @bannerline{@code{and} retornará "true/verdadeiro" apenas se @italic{as duas entradas} são verdadeiras. @code{or} retornará "true/verdadeiro" se @italic{pelo menos uma} entrada for verdadeira.}
                                 @code[#:multi-line #t]{
; and: Booleano Booleano -> Booleano
; Retorna verdadeiro se AMBAS as entradas forem verdadeiras
                                      
; or: Booleano Booleano -> Booleano  
; Retorna verdadeiro se PELO MENOS UMA entrada for verdadeira}
                                 @activity{Complete a @worksheet-link[#:page 20 #:name "AND-and-OR"] em sua apostila.}}
                        @teacher{}
                        }]
        }                                                                                             

@lesson/studteach[
     #:title "esta-na-tela? 2.0"
     #:duration "25 minutos"
     #:overview "Os alunos usam a Receita de Projeto ao lado de seu novo conhecimento de and/or, para escrever a função que realiza dois testes booleanos."
     #:learning-objectives @itemlist[@item{Alunos serão capazes de compor resultados de funções Booleanas usando @code{and} e @code{or}}
                                     @item{Alunos entenderão como Booleanos e funções Booleanas são usadas para controlar o comportamento de elementos do jogo}
                                     @item{Alunos vão começar a apreciar do porque de programas serem compostos de várias funções menores}]
     #:evidence-statements @itemlist[@item{Alunos serão capazes de escrever funções que combinam testes de limite da tela usando @code{and} e @code{or}}
                                     @item{Alunos compreenderão porque @code{and} é necessário para verificar dois limites}
                                     @item{Alunos serão capazes de explicar porque re-usar funções existentes é melhor do que copiar seus cálculos}
                                     @item{Alunos entenderão como usar Booleanos e condicionais para controlar o comportamento dos elementos do jogo dentro dos limites da tela}
]
     #:product-outcomes @itemlist[@item{Estudantes detectam quando elementos do jogo movem-se para fora da tela (então podem reaparecer no outro lado da tela)}]
     #:standards (list "A-CED.1-4" "F-IF.4-6" "A-SSE.1-2" "BS-DR.2")
     #:materials @itemlist[@item{Lápis/canetas aos alunos, e giz/marcadores de quadro branco aos professores}
                            @item{@(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "Apostila do aluno")}
                            @item{Cartazes da turma (Lista de regras, conhecimentos básicos, calendário do curso)}
                            @item{Tabela da Linguagem(veja abaixo)}]
     #:preparation @itemlist[]
     #:prerequisites (list "onscreen? 1.0" "and/or")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
       @points[@point{@student{Agora que você já sabe como combinar testes, como @code{esta-na-tela?} pode combinar ambos os testes para manter Sam na tela?
                               @activity[#:forevidence (list "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&4" "A-CED.1-4&1&1")]{
                                    Vá para @worksheet-link[#:page 21 #:name "onscreen?"] em sua apostila e escreva a função completa de @code{esta-na-tela?}, 
                                    para que ela teste ambos @code{esquerda-salvo?} e @code{direita-salvo?}. Digite os Exemplos e a definição, e quando estiver feito, 
                                    clique em "Run", e veja se Sam está protegida dos dois lados!}
                               }
                       @teacher{Chame os voluntários novamente, e peça para a classe o que @code{esta-na-tela?} @italic{deve} fazer. Devemos usar @code{and} ou @code{or}? Certifique-se de dar exemplos específicos de pontos que estejam na tela, pontos além da esquerda e pontos além da direita, e desafie os alunos a justificarem suas respostas.}
                       }
                @point{@student{Existem duas maneiras de resolver a questão de @code{esta-na-tela?}: 
                                @code[#:multi-line #t]{(define (esta-na-tela? x)
                                                         (and (> x -50) (< x 690)))}
                                e...
                                @code[#:multi-line #t]{(define (esta-na-tela? x)
                                                         (and (esquerda-salvo? x) (direita-salvo? x)))}
                                Tem diferença entre usar uma das duas?}
                       @teacher{}
                       }
                @point{@student{Há mais em ser um escritor do que apenas ter uma boa ortografia e gramática. Há muito mais em ser um arquiteto ou um artista do que apenas construir uma ponte ou pintar uma tela. Todas essas atividades envolvem um elemento de @italic{design}. Da mesma forma, há mais em ser um programador do que apenas escrever código. Você se tornou bom em escrever código, e agora você é capaz de escrever programas sofisticados que incluem várias funções - parabéns! Mas isso também significa que você está pronto para considerar o que significa @italic{projetar} o código que você escreve.}
                       @teacher{}
                       }
                @point{@student{Suponha que você acabou de construir um carro, mas ele não está funcionando direito. O que deve ser feito? O ideal, você gostaria de testar cada parte do carro(o motor, transmissão, etc) @italic{uma de cada vez}, para ver qual está quebrada. O mesmo vale para o código! Se você tem um erro, é mais fácil de encontrar quando cada função é simples e fácil de testar, e as únicas funções complexas serão construídas a partir das funções simples. Neste exemplo, você pode testar a @code{esquerda-salvo?} e @code{direita-salvo?} de forma independente, antes de colocar elas para trabalharem juntas na @code{esta-na-tela?}.}
                       @teacher{}
                       }
                @point{@student{Outra razão de definir várias funções simples, é o fato de que permitem o programador ser preguiçoso. Suponha que você tem alguns personagens em um videogame, todos precisam ser mantidos na tela. Alguns podem precisar apenas de @code{esquerda-salvo?}, outros apenas de @code{direita-salvo?}, e alguns poucos podem precisar de @code{esta-na-tela?}. O que acontece se o jogo precisa ser executado em computadores com monitores de diferentes tamanhos,  onde o limite da tela é 1000 ao invés de 690? Se você tem funções simples e complexas espalhadas pelo código, terá que mudar todas elas. Se sua função complexa apenas usa as funções simples, você só precisará mudá-los em um só lugar!}
                       @teacher{}
                       }
                @point{@student{Programas mau projetados podem funcionar bem, mas são difíceis de ler, difícil de testar, e estragam fácil se as coisas mudam. A medida que você crescer e se desenvolver como programador, você precisará pensar além de "fazer o código funcionar". Não é bom o suficiente se apenas funciona - como os artistas, devemos nos atentar se o código é @italic{bem projetado} também. Isso é o que as funções nos permitem fazer! Todos desde programadores a matemáticos usam funções para dividir problemas complexos em partes mais simples, o que torna possível projetar soluções elegantes para problemas difíceis.
                                @activity{Você pode listar três outros motivos para ter várias funções simples, ao invés de ter uma única função complexa?}}
                       @teacher{}
                       }
                @point{@student{O código de detecção de limites que você escreveu (através de @code{esquerda-salvo?} e @code{direita-salvo?}) é muito usado em videogames. Ele pode ser usado para parar um personagem que iria atravessar uma parede, ou recolocar um personagem na tela quando ele saísse dos limites. @activity{Abra o arquivo do jogo, e role para baixo passando pelas funções @code{atualiza-} até ver as definições de @code{esquerda-salvo?}, @code{direita-salvo?} e @code{esta-na-tela?}. Agora todas elas retornam verdadeiro, desde que sua tela de jogo tenha as mesmas dimensões do quintal de Sam(640x480), você pode usar o mesmo código para cada uma das três funções! Certifique-se de incluir Exemplos, para que seu código possa ser testado separadamente.}}
                       @teacher{}
                       }
                ]}
                  

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
        @points[
           @point{@student{Você aprendeu como usar Booleanos para delimitar onde os elementos do jogo podem se mover. Na próxima aula, vamos ver como usar Booleanos para movimentar elementos do jogo quando o usuário pressionar teclas de movimento.}
                  @teacher{}}]}
}