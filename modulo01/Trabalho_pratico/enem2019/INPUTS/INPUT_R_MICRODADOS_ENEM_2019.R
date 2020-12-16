#--------------------------------------------------------
#  INEP/Daeb-Diretoria de Avaliação da Educação Básica 
#  Coordenação-Geral de Instrumentos e Medidas (CGIM)			
#--------------------------------------------------------

#--------------------------------------------------------
#  PROGRAMA:                                                                                                      
#           INPUT_R_MICRODADOS_ENEM_2019
#--------------------------------------------------------
#  DESCRIÇÃO:
#           PROGRAMA PARA LEITURA DA BASE DE DADOS
#           MICRODADOS_ENEM_2019
#--------------------------------------------------------

#------------------------------------------------------------------------
# Obs:                                                                                                                    
#     Para abrir os microdados é necessário salvar este programa e o arquivo                    
#     MICRODADOS_ENEM_2019.csv no mesmo diretório.	                  
#------------------------------------------------------------------------

#------------------------------------------------------------------------
#                   ATENÇÃO              
#------------------------------------------------------------------------
# Este programa abre a base de dados com os rótulos das variáveis de	                    
# acordo com o dicionário de dados que compõem os microdados. 		  
#------------------------------------------------------------------------

#--------------------
# Intalação do pacote Data.Table
# Se não estiver instalado
#--------------------
if(!require(data.table)){install.packages('data.table')}

#--------------------
# Caso deseje trocar o local do arquivo, 
# edit a função setwd() a seguir informando o local do arquivo.
# Ex. Windows setwd("C:/temp")
#     Linux   setwd("/home")
#--------------------
setwd("C:/")  

#---------------
# Alocação de memória
#---------------
memory.limit(24576)

#------------------
# Carga dos microdados

ENEM_2019 <- data.table::fread(input='microdados_ENEM_2019.csv',
                               integer64='character',
                               skip=0,  #Ler do inicio
                               nrow=-1, #Ler todos os registros
                               na.strings = "", 
                               showProgress = TRUE)

#---------------------------
# A script a seguir formata os rótulos das respostas
# Para formatar um item retire o caracter de comentário (#) no início na linha desejada 
#---------------------------

#ENEM_2019$IN_ESTUDA_CLASSE_HOSPITALAR <- factor(ENEM_2019$IN_ESTUDA_CLASSE_HOSPITALAR, levels = c(1,0),  labels=c('Sim','Não'))
#ENEM_2019$IN_TREINEIRO <- factor(ENEM_2019$IN_TREINEIRO, levels = c(1,0),  labels=c('Sim','Não'))

#ENEM_2019$TP_DEPENDENCIA_ADM_ESC <- factor(ENEM_2019$TP_DEPENDENCIA_ADM_ESC, levels = c(1,2,3,4),
#                                           labels=c('Federal',
#                                                    'Estadual',
#                                                    'Municipal',
#                                                    'Privada'))

#ENEM_2019$TP_LOCALIZACAO_ESC <- factor(ENEM_2019$TP_LOCALIZACAO_ESC, levels = c(1,2), labels=c('Urbana','Rural'))

#ENEM_2019$TP_SIT_FUNC_ESC <- factor(ENEM_2019$TP_SIT_FUNC_ESC, levels = c(1,2,3,4),
#                                    labels=c('Em atividade',
#                                             'Paralisada',
#                                             'Extinta',
#                                             'Escola extinta em anos anteriores'))

#ENEM_2019$TP_SEXO <- factor(ENEM_2019$TP_SEXO, levels = c('M','F'), labels=c('Maculino','Feminino'))

#ENEM_2019$TP_ESTADO_CIVIL <- factor(ENEM_2019$TP_ESTADO_CIVIL, levels = c(0,1,2,3,4),
#                                    labels=c('Não informado',
#                                             'Solteiro(a)',
#                                             'Casado(a)/Mora com um(a) companheiro(a)',
#                                             'Divorciado(a)/Desquitado(a)/Separado(a)',
#                                             'Viúvo(a)'))

#ENEM_2019$TP_COR_RACA <- factor(ENEM_2019$TP_COR_RACA, levels = c(0,1,2,3,4,5,6),
#                                labels=c('Não declarado',
#                                         'Branca','Preta',
#                                         'Parda','Amarela',
#                                         'Indígena',
#                                         'Não dispõe da informação'))

#ENEM_2019$TP_NACIONALIDADE <- factor(ENEM_2019$TP_NACIONALIDADE, levels = c(0,1,2,3,4),
#                                     labels=c('Não informado',
#                                              'Brasileiro(a)',
#                                              'Brasileiro(a) Naturalizado(a)',
#                                              'Estrangeiro(a)',
#                                              'Brasileiro(a) Nato(a), nascido(a) no exterior'))

#ENEM_2019$TP_ST_CONCLUSAO <- factor(ENEM_2019$TP_ST_CONCLUSAO, levels = c(1,2,3,4), 
#                                    labels=c('Já concluí o Ensino Médio',
#                                             'Estou cursando e concluirei o Ensino Médio em 2019',
#                                             'Estou cursando e concluirei o Ensino Médio após 2019',
#                                             'Não concluí e não estou cursando o Ensino Médio'))

#ENEM_2019$TP_ANO_CONCLUIU <- factor(ENEM_2019$TP_ANO_CONCLUIU, levels = c(0,1,2,3,4,5,6,7,8,9,10,11,12,13),
#                                    labels=c('Não informado','2018','2017','2016',
#                                             '2015','2014','2013',
#                                             '2012','2011','2010',
#                                             '2009','2008','2007',
#                                             'Anterior a 2007'))

#ENEM_2019$TP_ESCOLA <- factor(ENEM_2019$TP_ESCOLA, levels = c(1,2,3,4),
#                              labels=c('Não respondeu',
#                                       'Pública',
#                                       'Privada',
#                                       'Exterior'))

#ENEM_2019$TP_ENSINO <- factor(ENEM_2019$TP_ENSINO, levels = c(1,2,3),
#                              labels=c('Ensino Regular',
#                                       'Educação Especial - Modalidade Substitutiva',
#                                       'Educação de Jovens e Adultos'))

#ENEM_2019$IN_DEFICIENCIA_AUDITIVA <- factor(ENEM_2019$IN_DEFICIENCIA_AUDITIVA, levels = c(1,0),
#                                             labels=c('Sim','Não'))

#ENEM_2019$IN_BAIXA_VISAO <- factor(ENEM_2019$IN_BAIXA_VISAO, levels = c(1,0),
#                                  labels=c('Sim','Não'))

#ENEM_2019$IN_CEGUEIRA <- factor(ENEM_2019$IN_CEGUEIRA, levels = c(1,0),
#                                  labels=c('Sim','Não'))

#ENEM_2019$IN_SURDEZ <- factor(ENEM_2019$IN_SURDEZ, levels = c(1,0),
#                               labels=c('Sim','Não'))

#ENEM_2019$IN_SURDO_CEGUEIRA <- factor(ENEM_2019$IN_SURDO_CEGUEIRA, levels = c(1,0),
#                                       labels=c('Sim','Não'))

#ENEM_2019$IN_DEFICIENCIA_FISICA <- factor(ENEM_2019$IN_DEFICIENCIA_FISICA, levels = c(1,0),
#                                           labels=c('Sim','Não'))

#ENEM_2019$IN_DEFICIENCIA_MENTAL <- factor(ENEM_2019$IN_DEFICIENCIA_MENTAL, levels = c(1,0),
#                                           labels=c('Sim','Não'))

#ENEM_2019$IN_DEFICIT_ATENCAO <- factor(ENEM_2019$IN_DEFICIT_ATENCAO, levels = c(1,0),
#                                        labels=c('Sim','Não'))

#ENEM_2019$IN_DISLEXIA <- factor(ENEM_2019$IN_DISLEXIA, levels = c(1,0),
#                                 labels=c('Sim','Não'))

#ENEM_2019$IN_GESTANTE <- factor(ENEM_2019$IN_GESTANTE, levels = c(1,0),
#                                 labels=c('Sim','Não'))

#ENEM_2019$IN_LACTANTE <- factor(ENEM_2019$IN_LACTANTE, levels = c(1,0),
#                                 labels=c('Sim','Não'))

#ENEM_2019$IN_IDOSO <- factor(ENEM_2019$IN_IDOSO, levels = c(1,0),
#                              labels=c('Sim','Não'))

#ENEM_2019$IN_DISCALCULIA <- factor(ENEM_2019$IN_DISCALCULIA, levels = c(1,0),
#                                    labels=c('Sim','Não'))

#ENEM_2019$IN_AUTISMO <- factor(ENEM_2019$IN_AUTISMO, levels = c(1,0),
#                                labels=c('Sim','Não'))

#ENEM_2019$IN_VISAO_MONOCULAR <- factor(ENEM_2019$IN_VISAO_MONOCULAR, levels = c(1,0),
#                                        labels=c('Sim','Não'))

#ENEM_2019$IN_OUTRA_DEF <- factor(ENEM_2019$IN_OUTRA_DEF, levels = c(1,0),
#                                  labels=c('Sim','Não'))

#ENEM_2019$IN_SEM_RECURSO <- factor(ENEM_2019$IN_SEM_RECURSO, levels = c(1,0),
#                                    labels=c('Sim','Não'))

#ENEM_2019$IN_NOME_SOCIAL <- factor(ENEM_2019$IN_NOME_SOCIAL, levels = c(1,0),
#                                    labels=c('Sim','Não'))

#ENEM_2019$IN_BRAILLE <- factor(ENEM_2019$IN_BRAILLE, levels = c(1,0),
#                                labels=c('Sim','Não'))

#ENEM_2019$IN_AMPLIADA_24 <- factor(ENEM_2019$IN_AMPLIADA_24, levels = c(1,0),
#                                    labels=c('Sim','Não'))

#ENEM_2019$IN_AMPLIADA_18 <- factor(ENEM_2019$IN_AMPLIADA_18, levels = c(1,0),
#                                    labels=c('Sim','Não'))

#ENEM_2019$IN_LEDOR <- factor(ENEM_2019$IN_LEDOR, levels = c(1,0),
#                              labels=c('Sim','Não'))

#ENEM_2019$IN_ACESSO <- factor(ENEM_2019$IN_ACESSO, levels = c(1,0),
#                               labels=c('Sim','Não'))

#ENEM_2019$IN_TRANSCRICAO <- factor(ENEM_2019$IN_TRANSCRICAO, levels = c(1,0),
#                                    labels=c('Sim','Não'))
 
#ENEM_2019$IN_LIBRAS <- factor(ENEM_2019$IN_LIBRAS, levels = c(1,0),
#                               labels=c('Sim','Não'))

#ENEM_2019$IN_TEMPO_ADICIONAL <- factor(ENEM_2019$IN_TEMPO_ADICIONAL, levels = c(1,0),
#                                       labels = c('Sim', 'Não'))

#ENEM_2019$IN_LEITURA_LABIAL <- factor(ENEM_2019$IN_LEITURA_LABIAL, levels = c(1,0),
#                                       labels=c('Sim','Não'))

#ENEM_2019$IN_MESA_CADEIRA_RODAS <- factor(ENEM_2019$IN_MESA_CADEIRA_RODAS, levels = c(1,0),
#                                           labels=c('Sim','Não'))

#ENEM_2019$IN_MESA_CADEIRA_SEPARADA <- factor(ENEM_2019$IN_MESA_CADEIRA_SEPARADA, levels = c(1,0),
#                                              labels=c('Sim','Não'))

#ENEM_2019$IN_APOIO_PERNA <- factor(ENEM_2019$IN_APOIO_PERNA, levels = c(1,0),
#                                    labels=c('Sim','Não'))

#ENEM_2019$IN_GUIA_INTERPRETE <- factor(ENEM_2019$IN_GUIA_INTERPRETE, levels = c(1,0),
#                                        labels=c('Sim','Não'))

#ENEM_2019$IN_COMPUTADOR <- factor(ENEM_2019$IN_COMPUTADOR, levels = c(1,0),
#                                   labels=c('Sim','Não'))

#ENEM_2019$IN_CADEIRA_ESPECIAL <- factor(ENEM_2019$IN_CADEIRA_ESPECIAL, levels = c(1,0),
#                                         labels=c('Sim','Não'))

#ENEM_2019$IN_CADEIRA_CANHOTO <- factor(ENEM_2019$IN_CADEIRA_CANHOTO, levels = c(1,0),
#                                        labels=c('Sim','Não'))

#ENEM_2019$IN_CADEIRA_ACOLCHOADA <- factor(ENEM_2019$IN_CADEIRA_ACOLCHOADA, levels = c(1,0),
#                                           labels=c('Sim','Não'))

#ENEM_2019$IN_PROVA_DEITADO  <- factor(ENEM_2019$IN_PROVA_DEITADO , levels = c(1,0),
#                                       labels=c('Sim','Não'))

#ENEM_2019$IN_MOBILIARIO_OBESO  <- factor(ENEM_2019$IN_MOBILIARIO_OBESO , levels = c(1,0),
#                                          labels=c('Sim','Não'))

#ENEM_2019$IN_LAMINA_OVERLAY  <- factor(ENEM_2019$IN_LAMINA_OVERLAY , levels = c(1,0),
#                                        labels=c('Sim','Não'))

#ENEM_2019$IN_PROTETOR_AURICULAR <- factor(ENEM_2019$IN_PROTETOR_AURICULAR, levels = c(1,0),
#                                           labels=c('Sim','Não'))

#ENEM_2019$IN_MEDIDOR_GLICOSE  <- factor(ENEM_2019$IN_MEDIDOR_GLICOSE , levels = c(1,0),
#                                         labels=c('Sim','Não'))

#ENEM_2019$IN_MAQUINA_BRAILE  <- factor(ENEM_2019$IN_MAQUINA_BRAILE , levels = c(1,0),
#                                        labels=c('Sim','Não'))

#ENEM_2019$IN_SOROBAN  <- factor(ENEM_2019$IN_SOROBAN , levels = c(1,0),
#                                 labels=c('Sim','Não'))

#ENEM_2019$IN_MARCA_PASSO <- factor(ENEM_2019$IN_MARCA_PASSO, levels = c(1,0),
#                                    labels=c('Sim','Não'))

#ENEM_2019$IN_SONDA  <- factor(ENEM_2019$IN_SONDA , levels = c(1,0),
#                               labels=c('Sim','Não'))

#ENEM_2019$IN_MEDICAMENTOS  <- factor(ENEM_2019$IN_MEDICAMENTOS , levels = c(1,0),
#                                      labels=c('Sim','Não'))

#ENEM_2019$IN_SALA_INDIVIDUAL <- factor(ENEM_2019$IN_SALA_INDIVIDUAL, levels = c(1,0),
#                                        labels=c('Sim','Não'))

#ENEM_2019$IN_SALA_ESPECIAL  <- factor(ENEM_2019$IN_SALA_ESPECIAL , levels = c(1,0),
#                                       labels=c('Sim','Não'))

#ENEM_2019$IN_SALA_ACOMPANHANTE <- factor(ENEM_2019$IN_SALA_ACOMPANHANTE, levels = c(1,0),
#                                          labels=c('Sim','Não'))

#ENEM_2019$IN_MOBILIARIO_ESPECIFICO <- factor(ENEM_2019$IN_MOBILIARIO_ESPECIFICO, levels = c(1,0),
#                                              labels=c('Sim','Não'))

#ENEM_2019$IN_MATERIAL_ESPECIFICO <- factor(ENEM_2019$IN_MATERIAL_ESPECIFICO, levels = c(1,0),
#                                            labels=c('Sim','Não'))

#ENEM_2019$TP_PRESENCA_CN <- factor(ENEM_2019$TP_PRESENCA_CN, levels = c(0,1,2),
#                                    labels=c('Faltou à prova',
#                                            'Presente na prova',
#                                            'Eliminado na prova'))

#ENEM_2019$TP_PRESENCA_CH <- factor(ENEM_2019$TP_PRESENCA_CH, levels = c(0,1,2),
#                                   labels=c('Faltou à prova',
#                                            'Presente na prova',
#                                            'Eliminado na prova'))

#ENEM_2019$TP_PRESENCA_LC <- factor(ENEM_2019$TP_PRESENCA_LC, levels = c(0,1,2),
#                                   labels=c('Faltou à prova',
#                                            'Presente na prova',
#                                            'Eliminado na prova'))

#ENEM_2019$TP_PRESENCA_MT <- factor(ENEM_2019$TP_PRESENCA_MT, levels = c(0,1,2),
#                                   labels=c('Faltou à prova',
#                                            'Presente na prova',
#                                            'Eliminado na prova'))

#ENEM_2019$CO_PROVA_CN <- factor(ENEM_2019$CO_PROVA_CN, levels = c(503,504,505,506,519,523,543,544,545,546),
#                                labels=c('Azul','Amarela','Cinza',
#                                         'Rosa','Laranja - Adaptada Ledor',
#                                         'Verde - Videoprova - Libras)',
#                                         'Amarela (Reaplicação)',
#                                         'Cinza (Reaplicação)',
#                                         'Azul (Reaplicação)',
#                                         'Rosa (Reaplicação)'))

#ENEM_2019$CO_PROVA_CH <- factor(ENEM_2019$CO_PROVA_CH, levels = c(507,508,509,510,520,524,547,548,549,550,564),
#                                labels=c('Azul','Amarela','Branca',
#                                        'Rosa','Laranja - Adaptada Ledor',
#                                        'Verde - Videoprova - Libras)',
#                                        'Azul (Replicação)',
#                                        'Amarela (Reaplicação)',
#                                        'Branca (Reaplicação)',
#                                        'Rosa (Reaplicação)',
#                                        'Laranja - Adaptada Ledor (Reaplicação)'))

#ENEM_2019$CO_PROVA_LC <- factor(ENEM_2019$CO_PROVA_LC, levels = c(511,512,513,514,521,525,551,552,553,554,565),
#                                labels=c('Azul','Amarela','Rosa','Branca',
#                                         'Laranja - Adaptada Ledor',
#                                         'Verde - Videoprova - Libras)',
#                                         'Azul (Replicação)',
#                                         'Amarela (Reaplicação)',
#                                         'Branca (Reaplicação)',
#                                         'Rosa (Reaplicação)',
#                                         'Laranja - Adaptada Ledor (Reaplicação)'))

#ENEM_2019$CO_PROVA_MT <- factor(ENEM_2019$CO_PROVA_MT, levels = c(515,516,517,518,522,526,555,556,557,558),
#                                 labels=c('Azul','Amarela','Rosa',
#                                          'Cinza',
#                                          'Laranja - Adaptada Ledor',
#                                          'Verde - Videoprova - Libras)',
#                                          'Amarela (Reaplicação)',
#                                          'Cinza (Reaplicação)',
#                                          'Azul (Reaplicação)',
#                                          'Rosa (Reaplicação)'))

#ENEM_2019$ TP_LINGUA <- factor(ENEM_2019$ TP_LINGUA, levels = c(0,1),
#                                labels=c('Inglês','Espanhol'))

#ENEM_2019$TP_STATUS_REDACAO <- factor(ENEM_2019$TP_STATUS_REDACAO, levels = c(1,2,3,4,5,6,7,8,9),
#                                      labels=c('Sem problemas',
#                                               'Anulada','Cópia Texto Motivador',
#                                               'Em Branco','Fere Direitos Humanos',
#                                               'Fuga ao tema',
#                                               'Não atendimento ao tipo',
#                                               'Texto insuficiente',
#                                               'Parte desconectada'))

#ENEM_2019$Q001 <- factor(ENEM_2019$Q001, levels = c('A','B','C','D','E','F','G','H'),
#                         labels=c('Nunca estudou',
#                                  'Não completou a 4ª série/5º ano do ensino fundamental',
#                                  'Completou a 4ª série/5º ano, mas não completou a 8ª série/9º ano do ensino fundamental',
#                                  'Completou a 8ª série/9º ano do ensino fundamental, mas não completou o Ensino Médio',
#                                  'Completou o Ensino Médio, mas não completou a Faculdade',
#                                  'Completou a Faculdade, mas não completou a Pós-graduação',
#                                  'Completou a Pós-graduação','Não sei'))

#ENEM_2019$Q002 <- factor(ENEM_2019$Q002, levels = c('A','B','C','D','E','F','G','H'),
#                         labels=c('Nunca estudou',
#                                  'Não completou a 4ª série/5º ano do ensino fundamental',
#                                  'Completou a 4ª série/5º ano, mas não completou a 8ª série/9º ano do ensino fundamental',
#                                  'Completou a 8ª série/9º ano do ensino fundamental, mas não completou o Ensino Médio',
#                                  'Completou o Ensino Médio, mas não completou a Faculdade',
#                                  'Completou a Faculdade, mas não completou a Pós-graduação',
#                                  'Completou a Pós-graduação','Não sei'))

#ENEM_2019$Q003 <- factor(ENEM_2019$Q003, levels =  c('A','B','C','D','E','F'),
#                         labels=c('Grupo 1 (Verificar a definição no dicionário de dados)',
#                                  'Grupo 2 (Verificar a definição no dicionário de dados)',
#                                  'Grupo 3 (Verificar a definição no dicionário de dados)',
#                                  'Grupo 4 (Verificar a definição no dicionário de dados)',
#                                  'Grupo 5 (Verificar a definição no dicionário de dados)',
#                                  'Não Sei'))

#ENEM_2019$Q004 <- factor(ENEM_2019$Q004, levels =  c('A','B','C','D','E','F'),
#                         labels=c('Grupo 1 (Verificar a definição no dicionário de dados)',
#                                  'Grupo 2 (Verificar a definição no dicionário de dados)',
#                                  'Grupo 3 (Verificar a definição no dicionário de dados)',
#                                  'Grupo 4 (Verificar a definição no dicionário de dados)',
#                                  'Grupo 5 (Verificar a definição no dicionário de dados)',
#                                  'Não Sei'))

#ENEM_2019$Q005 <- factor(ENEM_2019$Q005, levels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20), 
#                         labels=c('1','2','3','4','5','6','7','8','9','10',
#                                  '11','12','13','14','15','16','17','18','19','20'))

#ENEM_2019$Q006 <- factor(ENEM_2019$Q006,levels =  c('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q'),
#                         labels=c('Nenhuma renda.',
#                                  'Até R$ 998,00',
#                                  'De R$ 998,01 até R$ 1.497,00',
#                                  'De R$ 1.497,01 até R$ 1.996,00',
#                                  'De R$ 1.996,01 até R$ 2.495,00',
#                                  'De R$ 2.495,01 até R$ 2.994,00',
#                                  'De R$ 2.994,01 até R$ 3.992,00',
#                                  'De R$ 3.992,01 até R$ 4.990,00',
#                                  'De R$ 4.990,01 até R$ 5.988,00',
#                                  'De R$ 5.988,01 até R$ 6.986,00',
#                                  'De R$ 6.986,01 até R$ 7.984,00',
#                                  'De R$ 7.984,01 até R$ 8.982,00',
#                                  'De R$ 8.982,01 até R$ 9.980,00',
#                                  'De R$ 9.980,01 até R$ 11.976,00',
#                                  'De R$ 11.976,01 até R$ 14.970,00',
#                                  'De R$ 14.970,01 até R$ 19.960,00',
#                                  'Mais de R$ 19.960,00'))


#ENEM_2019$Q007 <- factor(ENEM_2019$Q007, levels = c('A','B','C','D'),
#                         labels=c('Não','Sim, um ou dois dias por semana',
#                                  'Sim, três ou quatro dias por semana',
#                                  'Sim, pelo menos cinco dias por semana'))

#ENEM_2019$Q008 <- factor(ENEM_2019$Q008, levels = c('A','B','C','D','E'),
#                         labels=c('Não',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, três',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q009 <- factor(ENEM_2019$Q009, levels = c('A','B','C','D','E'),
#                         labels=c('Não',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, três',
#                                  'Sim, quatro ou mais'))


#ENEM_2019$Q010 <- factor(ENEM_2019$Q010, levels = c('A','B','C','D','E'),
#                         labels=c('Não',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, três',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q011 <- factor(ENEM_2019$Q011, levels = c('A','B','C','D','E'),
#                         labels=c('Não',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, três',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q012 <- factor(ENEM_2019$Q012, levels = c('A','B','C','D','E'),
#                         labels=c('Não',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, três',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q013 <- factor(ENEM_2019$Q013, levels = c('A','B','C','D','E'),
#                         labels=c('Não',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, três',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q014 <- factor(ENEM_2019$Q014, levels = c('A','B','C','D','E'),
#                         labels=c('Não',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, três',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q015 <- factor(ENEM_2019$Q015, levels = c('A','B','C','D','E'),
#                         labels=c('Não',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, três',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q016 <- factor(ENEM_2019$Q016, levels = c('A','B','C','D','E'),
#                         labels=c('Não',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, três',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q017 <- factor(ENEM_2019$Q017, levels = c('A','B','C','D','E'),
#                         labels=c('Não',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, três',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q018 <- factor(ENEM_2019$Q018, levels = c('A','B'), labels=c('Não','Sim'))

#ENEM_2019$Q019 <- factor(ENEM_2019$Q019, levels = c('A','B','C','D','E'),
#                         labels=c('Não',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, três',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q020 <- factor(ENEM_2019$Q020, levels = c('A','B'), labels=c('Não','Sim'))
#ENEM_2019$Q021 <- factor(ENEM_2019$Q021, levels = c('A','B'), labels=c('Não','Sim'))

#ENEM_2019$Q022 <- factor(ENEM_2019$Q022, levels = c('A','B','C','D','E'),
#                         labels=c('Não',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, três',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q023 <- factor(ENEM_2019$Q023, levels = c('A','B'), labels=c('Não','Sim'))

#ENEM_2019$Q024 <- factor(ENEM_2019$Q024, levels = c('A','B','C','D','E'),
#                         labels=c('Não',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, três',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q025 <- factor(ENEM_2019$Q025, levels = c('A','B'), labels=c('Não','Sim'))
