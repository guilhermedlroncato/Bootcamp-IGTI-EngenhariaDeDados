
/**************************************************************************/
/*  INEP/Daeb-Diretoria de Avaliação da Educação Básica              	  */      
/*                                   									  */	
/*  Coordenação-Geral de Instrumentos e Medidas (CGIM)					  */
/*------------------------------------------------------------------------*/
/*  PROGRAMA:                                                             */
/*           INPUT_SAS_MICRODADOS_ENEM_2018.sas                        	  */
/*------------------------------------------------------------------------*/
/*  DESCRICAO: PROGRAMA PARA LEITURA DOS MICRODADOS DO ENEM DE 2019       */    
/*                                                                        */
/**************************************************************************/
/**************************************************************************/
/* Obs:                                                                   */
/* 		                                                                  */
/* Para abrir os microdados é necessário salvar este programa e o arquivo */
/* MICRODADOS_ENEM_2019.CSV no diretório C:\ do computador.			      */
/*															 			  */                                           
/* Ao terminar esses procedimentos execute o programa salvo utilizando    */
/* as variáveis de interesse.                                             */
/**************************************************************************/
/*				                  ATENÇÃO                                 */  
/**************************************************************************/
/* Este programa abre a base de dados com os rótulos das variáveis de	  */
/* acordo com o dicionário de dados que compõem os microdados. Para abrir */
/* os dados sem os rótulos basta importar diretamente no SAS.			  */
/* 																	      */ 																          
/**************************************************************************/

proc format;

    value  $IN_ESTUDA_CLASSE_HOSPITALAR
        0='Não'
		1='Sim';

	value $IN_TREINEIRO
		0='Não'
		1='Sim';

	value $TP_DEPENDENCIA_ADM
       1= 'Federal'
	   2= 'Estadual'
	   3= 'Municipal'
	   4= 'Privada';

	value $TP_LOCALIZACAO
       1= 'Urbana'
	   2= 'Rural';

	value $TP_SIT_FUNC_ESC
	   1='Em atividade'
	   2='Paralisada'
	   3='Extinta';

	value  $TP_SEXO
		M ='Masculino'
		F ='Feminino';

	value $TP_NACIONAL
	   0= 'Não informado'
	   1= 'Brasileiro(a)'
	   2= 'Brasileiro(a) Naturalizado(a)'
	   3= 'Estrangeiro(a)'
	   4= 'Brasileiro(a) Nato(a), nascido(a) no exterior';

	value  $TP_ST_CONCLUSAO
		1='Já concluí o Ensino Médio'
		2='Estou cursando e concluirei o Ensino Médio em 2017'	
		3='Estou cursando e concluirei o Ensino Médio após 2017'
		4='Não concluí e não estou cursando o Ensino Médio';

	value $TP_ANO_CONCLUIU
		0=	'Não informado'
		1=  '2018'
		2=  '2017'
		3=	'2016'
		4=	'2015'
		5=	'2014'
		6=	'2013'
		7=	'2012'
		8=	'2011'
		9=	'2010'
		10=	'2009'
		11=	'2008'
		12=	'2007'
		13= 'Anterior a 2007';

	value  $TP_ESCOLA
		1='Não respondeu'
		2='Pública'
		3='Privada'
		4='Exterior';

	value  $TP_ENSINO
		1='Ensino Regular'
		2='Educação Especial - Modalidade Substitutiva'
		3='Educação de Jovens e Adultos';

	value  $TP_ESTADO_CIVIL
		0=	'Não informado'
		1='Solteiro(a)'
		2='Casado(a)/Mora com um(a) companheiro(a)'
		3='Divorciado(a)/Desquitado(a)/Separado(a)'
		4='Viúvo(a)';

	value  $TP_COR_RACA
		0='Não declarado'
		1='Branca'
		2='Preta'
		3='Parda'
		4='Amarela'
		5='Indígena';

	value  $IN_BAIXA_VISAO
		1='Sim'
		0='Não';

	value  $IN_CEGUEIRA
		1='Sim'
		0='Não';

	value  $IN_SURDEZ
		1='Sim'
		0='Não';

	value  $IN_DEFICIENCIA_AUDITIVA
		1='Sim'
		0='Não';

	value  $IN_SURDO_CEGUEIRA
		1='Sim'
		0='Não';

	value  $IN_DEFICIENCIA_FISICA
		1='Sim'
		0='Não';

	value  $IN_DEFICIENCIA_MENTAL
		1='Sim'
		0='Não';

	value  $IN_DEFICIT_ATENCAO
		1='Sim'
		0='Não';

	value  $IN_DISLEXIA
		1='Sim'
		0='Não';

	value  $IN_GESTANTE
		1='Sim'
		0='Não';

	value  $IN_LACTANTE
		1='Sim'
		0='Não';

	value  $IN_IDOSO
		1='Sim'
		0='Não';

	value $IN_DISCALCULIA
		1='Sim'
		0='Não';

	value  $IN_AUTISMO
		1='Sim'
		0='Não';

	value $IN_VISAO_MONOCULAR
		1='Sim'
		0='Não';

	value $IN_OUTRA_DEF
		1='Sim'
		0='Não';
	
	value $IN_SEM_RECURSO
		1='Sim'
		0='Não';

	value $IN_NOME_SOCIAL
		1='Sim'
		0='Não';

	value  $IN_BRAILLE
		1='Sim'
		0='Não';

	value  $IN_AMPLIADA
		1='Sim'
		0='Não';

	value  $IN_LEDOR
		1='Sim'
		0='Não';

	value  $IN_ACESSO
		1='Sim'
		0='Não';

	value  $IN_TRANSCRICAO
		1='Sim'
		0='Não';

	value  $IN_LIBRAS
		1='Sim'
		0='Não';

	value  $IN_TEMPO_ADICIONAL
		1='Sim'
		0='Não';

	value  $IN_LEITURA_LABIAL
		1='Sim'
		0='Não';

	value  $IN_MESA_CADEIRA_RODAS
		1='Sim'
		0='Não';

	value  $IN_MESA_CADEIRA_SEPARADA
		1='Sim'
		0='Não';

	value  $IN_APOIO_PERNA
		1='Sim'
		0='Não';

	value  $IN_GUIA_INTERPRETE
		1='Sim'
		0='Não';

	value $IN_COMPUTADOR
		1='Sim'
		0='Não';

	value $IN_CADEIRA_ESPECIAL
		1='Sim'
		0='Não';

	value $IN_CADEIRA_CANHOTO
		1='Sim'
		0='Não';

	value $IN_CADEIRA_ACOLCHOADA
		1='Sim'
		0='Não';

	value $IN_PROVA_DEITADO
		1='Sim'
		0='Não';

	value $IN_MOBILIARIO_OBESO
		1='Sim'
		0='Não';

	value $IN_LAMINA_OVERLAY
		1='Sim'
		0='Não';

	value $IN_PROTETOR_AURICULAR
		1='Sim'
		0='Não';

	value $IN_MEDIDOR_GLICOSE
		1='Sim'
		0='Não';

	value $IN_MAQUINA_BRAILE
		1='Sim'
		0='Não';

	value $IN_SOROBAN
		1='Sim'
		0='Não';

	value $IN_MARCA_PASSO
		1='Sim'
		0='Não';

	value $IN_SONDA
		1='Sim'
		0='Não';

	value $IN_MEDICAMENTOS
		1='Sim'
		0='Não';

	value $IN_SALA_INDIVIDUAL
		1='Sim'
		0='Não';

	value $IN_SALA_ESPECIAL
		1='Sim'
		0='Não';

	value $IN_SALA_ACOMPANHANTE
		1='Sim'
		0='Não';

	value $IN_MOBILIARIO_ESPECIFICO
		1='Sim'
		0='Não';

	value $IN_MATERIAL_ESPECIFICO
		1='Sim'
		0='Não';

	value  $TP_PRESENCA_CN
		0='Faltou à prova'
		1='Presente na prova'
		2='Eliminado na prova';

	value  $TP_PRESENCA_CH
		0='Faltou à prova'
		1='Presente na prova'
		2='Eliminado na prova';

	value  $TP_PRESENCA_LC
		0='Faltou à prova'
		1='Presente na prova'
		2='Eliminado na prova';

	value  $TP_PRESENCA_MT
		0='Faltou à prova'
		1='Presente na prova'
		2='Eliminado na prova';

	value  $CO_PROVA_CN
		503='Azul'
		504='Amarela'
		505='Cinza'
		506='Rosa'
		519='Laranja - Adaptada Ledor'
		523='Verde - Videoprova - Libras'
		543='Amarela (Reaplicação)'
		544='Cinza (Reaplicação)'
		545='Azul (Reaplicação)'
		546='Rosa (Reaplicação)';

	value  $CO_PROVA_CH
		507='Azul'
		508='Amarela'
		509='Branca'
		510='Rosa'
		520='Laranja - Adaptada Ledor'
		524='Verde - Videoprova - Libras'
		547='Azul (Reaplicação)'
		548='Amarelo (Reaplicação)'
		549='Branco (Reaplicação)'
		550='Rosa (Reaplicação)'
		564='Laranja - Adaptada Ledor (Reaplicação)';

	value  $CO_PROVA_LC
		511='Azul'
		512='Amarela'
		513='Rosa'
		514='Branca'
		521='Laranja - Adaptada Ledor'
		525='Verde - Videoprova - Libras'
		551='Azul (Reaplicação)'
		552='Amarelo (Reaplicação)'
		553='Branco (Reaplicação)'
		554='Rosa (Reaplicação)'
		565='Laranja - Adaptada Ledor (Reaplicação)';

	value  $CO_PROVA_MT
		515='Azul'
		516='Amarela'
		517='Rosa'
		518='Cinza'
		522='Laranja - Adaptada Ledor'
		526='Verde - Videoprova - Libras'
		555='Amarela (Reaplicação)'
		556='Cinza (Reaplicação)'
		557='Azul (Reaplicação)'
		558='Rosa (Reaplicação)';

	value  $TP_LINGUA
		0='Inglês'
		1='Espanhol';

	value  $TP_STATUS_REDACAO
		1='Sem problemas'
		2='Anulada'
		3='Cópia Texto Motivador'
        4='Em Branco'
		6='Fuga ao tema'
        7='Não atendimento ao tipo'
		8='Texto insuficiente'
        9='Parte desconectada';
				
	value $Qum
		A='Nunca estudou'
		B='Não completou a 4ª série/5º ano do ensino fundamental'
		C='Completou a 4ª série/5º ano, mas não completou a 8ª série/9º ano do ensino fundamental'
		D='Completou a 8ª série/9º ano do ensino fundamental, mas não completou o Ensino Médio'
		E='Completou o Ensino Médio, mas não completou a Faculdade'
		F='Completou a Faculdade, mas não completou a Pós-graduação'
		G='Completou a Pós-graduação'
		H='Não sei';

	value $Qdois
		A='Nunca estudou'
		B='Não completou a 4ª série/5º ano do ensino fundamental'
		C='Completou a 4ª série/5º ano, mas não completou a 8ª série/9º ano do ensino fundamental'
		D='Completou a 8ª série/9º ano do ensino fundamental, mas não completou o Ensino Médio'
		E='Completou o Ensino Médio, mas não completou a Faculdade'
		F='Completou a Faculdade, mas não completou a Pós-graduação'
		G='Completou a Pós-graduação'
		H='Não sei';

	value $Qtres
		A='Grupo 1: Lavrador, agricultor sem empregados, bóia fria, criador de animais (gado, porcos, galinhas, ovelhas, cavalos etc.), apicultor, pescador, lenhador, seringueiro, extrativista'
		B='Grupo 2: Diarista, empregado doméstico, cuidador de idosos, babá, cozinheiro (em casas particulares), motorista particular, jardineiro, faxineiro de empresas e prédios, vigilante, porteiro, carteiro, office-boy, vendedor, caixa, atendente de loja, auxiliar administrativo, recepcionista, servente de pedreiro, repositor de mercadoria'
		C='Grupo 3: Padeiro, cozinheiro industrial ou em restaurantes, sapateiro, costureiro, joalheiro, torneiro mecânico, operador de máquinas, soldador, operário de fábrica, trabalhador da mineração, pedreiro, pintor, eletricista, encanador, motorista, caminhoneiro, taxista'
		D='Grupo 4: Professor (de ensino fundamental ou médio, idioma, música, artes etc.), técnico (de enfermagem, contabilidade, eletrônica etc.), policial, militar de baixa patente (soldado, cabo, sargento), corretor de imóveis, supervisor e gerente, mestre de obras, pastor, microempresário (proprietário de empresa com menos de 10 empregados), pequeno comerciante, pequeno proprietário de terras, trabalhador autônomo ou por conta própria'
		E='Grupo 5: Médico, engenheiro, dentista, psicólogo, economista, advogado, juiz, promotor, defensor, delegado, tenente, capitão, coronel, professor universitário, diretor em empresas públicas e privadas, político, proprietário de empresas com mais de 10 empregados'
		F='Não Sei';
		
	value $Qquatro
		A='Grupo 1: Lavradora, agricultora sem empregados, bóia fria, criadora de animais (gado, porcos, galinhas, ovelhas, cavalos etc.), apicultora, pescadora, lenhadora, seringueira, extrativista'
		B='Grupo 2: Diarista, empregada doméstica, cuidadora de idosos, babá, cozinheira (em casas particulares), motorista particular, jardineira, faxineira de empresas e prédios, vigilante, porteira, carteira, office-boy, vendedora, caixa, atendente de loja, auxiliar administrativa, recepcionista, servente de pedreiro, repositora de mercadoria'
		C='Grupo 3: Padeira, cozinheira industrial ou em restaurantes, sapateira, costureira, joalheira, torneira mecânica, operadora de máquinas, soldadora, operária de fábrica, trabalhadora da mineração, pedreira, pintora, eletricista, encanadora, motorista, caminhoneira, taxista'
		D='Grupo 4: Professora (de ensino fundamental ou médio, idioma, música, artes etc.), técnica (de enfermagem, contabilidade, eletrônica etc.), policial, militar de baixa patente (soldado, cabo, sargento), corretora de imóveis, supervisora e gerente, mestre de obras, pastora, microempresária (proprietária de empresa com menos de 10 empregados), pequena comerciante, pequena proprietária de terras, trabalhadora autônoma ou por conta própria'
		E='Grupo 5: Médica, engenheira, dentista, psicóloga, economista, advogada, juíza, promotora, defensora, delegada, tenente, capitã, coronel, professora universitária, diretora em empresas públicas e privadas, política, proprietária de empresas com mais de 10 empregados'
		F='Não Sei';

	value $Qcinco
		1='1'
		2='2'
		3='3'
		4='4'
		5='5'
		6='6'
		7='7'
		8='8'
		9='9'
		10='10'
		11='11'
		12='12'
		13='13'
		14='14'
		15='15'
		16='16'
		17='17'
		18='18'
		19='19'
		20='20';

	value $Qseis
		A= "Nenhuma renda"
		B= "Até R$ 998,00"
		C= "De R$ 998,01 até R$ 1.497,00"
		D= "De R$ 1.497,01 até R$ 1.996,00"
		E= "De R$ 1.996,01 até R$ 2.495,00"
		F= "De R$ 2.495,01 até R$ 2.994,00"
		G= "De R$ 2.994,01 até R$ 3.992,00"
		H= "De R$ 3.992,01 até R$ 4.990,00"
		I= "De R$ 4.990,01 até R$ 5.988,00"
		J= "De R$ 5.988,01 até R$ 6.986,00"
		K= "De R$ 6.986,01 até R$ 7.984,00"
		L= "De R$ 7.984,01 até R$ 8.982,00"
		M= "De R$ 8.982,01 até R$ 9.980,00"
		N= "De R$ 9.980,01 até R$ 11.976,00"
		O= "11.976,01 até R$ 14.970,00"
		P= "14.970,01 até R$ 19.960,00"
		Q= "Mais de R$ 19.960,00";

	value $Qsete
		A='Não'
		B='Sim, um ou dois dias por semana'
		C='Sim, três ou quatro dias por semana'
		D='Sim, pelo menos cinco dias por semana';

	value $Qoito
		A='Não'
		B='Sim, um'
		C='Sim, dois'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qnove
		A='Não'
		B='Sim, um'
		C='Sim, dois'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qdez
		A='Não'
		B='Sim, um'
		C='Sim, dois'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qonze
		A='Não'
		B='Sim, uma'
		C='Sim, duas'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qdoze
		A='Não'
		B='Sim, uma'
		C='Sim, duas'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qtreze
		A='Não'
		B='Sim, um'
		C='Sim, dois'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qcatorze
		A='Não'
		B='Sim, uma'
		C='Sim, duas'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qquinze
		A='Não'
		B='Sim, uma'
		C='Sim, duas'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qdezesseis
		A='Não'
		B='Sim, um'
		C='Sim, dois'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qdezessete
		A='Não'
		B='Sim, uma'
		C='Sim, duas'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qdezoito
		A='Não'
		B='Sim';

	value $Qdezenove
		A='Não'
		B='Sim, uma'
		C='Sim, duas'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qvinte
		A='Não'
		B='Sim';

	value $Qvinteum
		A='Não'
		B='Sim';

	value $Qvintedois
		A='Não'
		B='Sim, um'
		C='Sim, dois'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qvintetres
		A='Não'
		B='Sim';

	value $Qvintequatro
		A='Não'
		B='Sim, um'
		C='Sim, dois'
		D='Sim, três'
		E='Sim, quatro ou mais';

	value $Qvintecinco
		A='Não'
		B='Sim';	
run;


DATA WORK.DADOS_ENEM_2019;
INFILE 'C:\MICRODADOS_ENEM_2019.csv' /*local do arquivo*/
        LRECL=963
        FIRSTOBS=2
        DLM=';'
        MISSOVER
        DSD ;
INPUT
        NU_INSCRICAO       : BEST21.
        NU_ANO           : BEST4.
        CO_MUNICIPIO_RESIDENCIA : BEST7.
        NO_MUNICIPIO_RESIDENCIA : $CHAR32.
        CO_UF_RESIDENCIA : BEST2.
        SG_UF_RESIDENCIA    : $CHAR2.
		NU_IDADE            : BEST2.
        TP_SEXO          : $CHAR1.
        TP_ESTADO_CIVIL  :  $CHAR1.
        TP_COR_RACA      :  $CHAR1.
        TP_NACIONALIDADE    : $CHAR2.
        CO_MUNICIPIO_NASCIMENTO : BEST7.
        NO_MUNICIPIO_NASCIMENTO : $CHAR32.
        CO_UF_NASCIMENTO : BEST2.
        SG_UF_NASCIMENTO    : $CHAR2.
        TP_ST_CONCLUSAO     :  $CHAR1.
        TP_ANO_CONCLUIU     :  $CHAR2.
        TP_ESCOLA        :  $CHAR1.
        TP_ENSINO     :  $CHAR1.
		IN_TREINEIRO	:$CHAR1.
        CO_ESCOLA       : BEST8.
        CO_MUNICIPIO_ESC : BEST7.
        NO_MUNICIPIO_ESC : $CHAR32.
        CO_UF_ESC       : BEST2.
        SG_UF_ESC           : $CHAR2.
        TP_DEPENDENCIA_ADM_ESC : $CHAR1.
        TP_LOCALIZACAO_ESC : $CHAR1.
        TP_SIT_FUNC_ESC     : $CHAR1.
        IN_BAIXA_VISAO   :  $CHAR1.
        IN_CEGUEIRA      :  $CHAR1.
        IN_SURDEZ        :  $CHAR1.
        IN_DEFICIENCIA_AUDITIVA : $CHAR1.
        IN_SURDO_CEGUEIRA : $CHAR1.
        IN_DEFICIENCIA_FISICA : $CHAR1.
        IN_DEFICIENCIA_MENTAL : $CHAR1.
        IN_DEFICIT_ATENCAO : $CHAR1.
        IN_DISLEXIA      : $CHAR1.
		IN_DISCALCULIA	 : $CHAR1.
        IN_AUTISMO       : $CHAR1.
		IN_VISAO_MONOCULAR : $CHAR1.
		IN_OUTRA_DEF	 : $CHAR1.
        IN_GESTANTE      : $CHAR1.
        IN_LACTANTE      : $CHAR1.
        IN_IDOSO         : $CHAR1.
     	IN_ESTUDA_CLASSE_HOSPITALAR : $CHAR1.
		IN_SEM_RECURSO	 : $CHAR1.
        IN_BRAILLE       : $CHAR1.
        IN_AMPLIADA_24   : $CHAR1.
        IN_AMPLIADA_18   : $CHAR1.
        IN_LEDOR         : $CHAR1.
        IN_ACESSO        : $CHAR1.
        IN_TRANSCRICAO   : $CHAR1.
        IN_LIBRAS        : $CHAR1.
		IN_TEMPO_ADICIONAL: $CHAR1.
        IN_LEITURA_LABIAL : $CHAR1.
        IN_MESA_CADEIRA_RODAS : $CHAR1.
        IN_MESA_CADEIRA_SEPARADA : $CHAR1.
        IN_APOIO_PERNA   : $CHAR1.
        IN_GUIA_INTERPRETE : $CHAR1.
		IN_COMPUTADOR 	:	$CHAR1.	
		IN_CADEIRA_ESPECIAL 	: $CHAR1.
		IN_CADEIRA_CANHOTO 		: $CHAR1.	
		IN_CADEIRA_ACOLCHOADA 	: $CHAR1.
		IN_PROVA_DEITADO 		: $CHAR1.
		IN_MOBILIARIO_OBESO 	: $CHAR1.	
		IN_LAMINA_OVERLAY 		: $CHAR1.
		IN_PROTETOR_AURICULAR 	: $CHAR1.
		IN_MEDIDOR_GLICOSE 		: $CHAR1.
		IN_MAQUINA_BRAILE 		: $CHAR1.
		IN_SOROBAN 				: $CHAR1.
		IN_MARCA_PASSO 			: $CHAR1.
		IN_SONDA 				: $CHAR1.
		IN_MEDICAMENTOS 		: $CHAR1.	
		IN_SALA_INDIVIDUAL 		: $CHAR1.
		IN_SALA_ESPECIAL 		: $CHAR1.
		IN_SALA_ACOMPANHANTE 	: $CHAR1.
		IN_MOBILIARIO_ESPECIFICO : $CHAR1.
		IN_MATERIAL_ESPECIFICO 	: $CHAR1.
  		IN_NOME_SOCIAL	 : $CHAR1.
        CO_MUNICIPIO_PROVA : BEST7.
        NO_MUNICIPIO_PROVA : $CHAR27.
        CO_UF_PROVA     : BEST2.
        SG_UF_PROVA         : $CHAR2.
        TP_PRESENCA_CN   : $CHAR1.
        TP_PRESENCA_CH   : $CHAR1.
        TP_PRESENCA_LC   : $CHAR1.
        TP_PRESENCA_MT   : $CHAR1.
        CO_PROVA_CN      : $CHAR3.
        CO_PROVA_CH      : $CHAR3.
        CO_PROVA_LC      : $CHAR3.
        CO_PROVA_MT      : $CHAR3.
        NU_NOTA_CN          : BEST8.
        NU_NOTA_CH          : BEST8.
        NU_NOTA_LC          : BEST8.
        NU_NOTA_MT          : BEST8.
        TX_RESPOSTAS_CN  : $CHAR45.
        TX_RESPOSTAS_CH  : $CHAR45.
        TX_RESPOSTAS_LC  : $CHAR50.
        TX_RESPOSTAS_MT  : $CHAR45.
        TP_LINGUA        : $CHAR1.
        TX_GABARITO_CN      : $CHAR45.
        TX_GABARITO_CH      : $CHAR45.
        TX_GABARITO_LC      : $CHAR50.
        TX_GABARITO_MT      : $CHAR45.
        TP_STATUS_REDACAO :$CHAR2.
        NU_NOTA_COMP1    : BEST3.
        NU_NOTA_COMP2    : BEST3.
        NU_NOTA_COMP3    : BEST3.
        NU_NOTA_COMP4    : BEST3.
        NU_NOTA_COMP5    : BEST3.
        NU_NOTA_REDACAO  : BEST4.
        Q001             : $CHAR1.
        Q002             : $CHAR1.
        Q003             : $CHAR1.
        Q004             : $CHAR1.
        Q005             : $CHAR2.
        Q006             : $CHAR1.
        Q007             : $CHAR1.
        Q008             : $CHAR1.
        Q009             : $CHAR1.
        Q010             : $CHAR1.
        Q011             : $CHAR1.
        Q012             : $CHAR1.
        Q013             : $CHAR1.
        Q014             : $CHAR1.
        Q015             : $CHAR1.
        Q016             : $CHAR1.
        Q017             : $CHAR1.
        Q018             : $CHAR1.
        Q019             : $CHAR1.
        Q020             : $CHAR1.
        Q021             : $CHAR1.
        Q022             : $CHAR1.
        Q023             : $CHAR1.
        Q024             : $CHAR1.
        Q025             : $CHAR1.;

ATTRIB IN_ESTUDA_CLASSE_HOSPITALAR	FORMAT=$IN_ESTUDA_CLASSE_HOSPITALAR3.;
ATTRIB IN_TREINEIRO					FORMAT=$IN_TREINEIRO3.;
ATTRIB TP_DEPENDENCIA_ADM_ESC 		FORMAT=$TP_DEPENDENCIA_ADM10.;
ATTRIB TP_LOCALIZACAO_ESC 			FORMAT=$TP_LOCALIZACAO10.;
ATTRIB TP_SIT_FUNC_ESC 				FORMAT=$TP_SIT_FUNC_ESC40.;
ATTRIB TP_SEXO 						FORMAT=$TP_SEXO10.;
ATTRIB TP_NACIONALIDADE 			FORMAT=$TP_NACIONAL.;
ATTRIB TP_ST_CONCLUSAO 				FORMAT=$TP_ST_CONCLUSAO52.;
ATTRIB TP_ANO_CONCLUIU				FORMAT=$TP_ANO_CONCLUIU15.;
ATTRIB TP_ESCOLA					FORMAT=$TP_ESCOLA13.;
ATTRIB TP_ENSINO 					FORMAT=$TP_ENSINO40.;
ATTRIB TP_ESTADO_CIVIL 				FORMAT=$TP_ESTADO_CIVIL40.;
ATTRIB TP_COR_RACA 					FORMAT=$TP_COR_RACA30.;
ATTRIB IN_BAIXA_VISAO 				FORMAT=$IN_BAIXA_VISAO3.;
ATTRIB IN_CEGUEIRA 					FORMAT=$IN_CEGUEIRA3.;
ATTRIB IN_SURDEZ 					FORMAT=$IN_SURDEZ3.;
ATTRIB IN_DEFICIENCIA_AUDITIVA 		FORMAT=$IN_DEFICIENCIA_AUDITIVA3.;
ATTRIB IN_SURDO_CEGUEIRA 			FORMAT=$IN_SURDO_CEGUEIRA3.;
ATTRIB IN_DEFICIENCIA_FISICA 		FORMAT=$IN_DEFICIENCIA_FISICA3.;
ATTRIB IN_DEFICIENCIA_MENTAL 		FORMAT=$IN_DEFICIENCIA_MENTAL3.;
ATTRIB IN_DEFICIT_ATENCAO 			FORMAT=$IN_DEFICIT_ATENCAO3.;
ATTRIB IN_DISLEXIA 					FORMAT=$IN_DISLEXIA3.;
ATTRIB IN_GESTANTE 					FORMAT=$IN_GESTANTE3.;
ATTRIB IN_LACTANTE 					FORMAT=$IN_LACTANTE3.;
ATTRIB IN_IDOSO 					FORMAT=$IN_IDOSO3.;
ATTRIB IN_DISCALCULIA				FORMAT=$IN_DISCALCULIA3.;
ATTRIB IN_AUTISMO 					FORMAT=$IN_AUTISMO3.;
ATTRIB IN_VISAO_MONOCULAR			FORMAT=$IN_VISAO_MONOCULAR3.;
ATTRIB IN_OUTRA_DEF					FORMAT=$IN_OUTRA_DEF3.;
ATTRIB IN_SEM_RECURSO				FORMAT=$IN_SEM_RECURSO3.;
ATTRIB IN_NOME_SOCIAL				FORMAT=$IN_NOME_SOCIAL3.;
ATTRIB IN_BRAILLE 					FORMAT=$IN_BRAILLE3.;
ATTRIB IN_AMPLIADA_24 				FORMAT=$IN_AMPLIADA3.;
ATTRIB IN_AMPLIADA_18 				FORMAT=$IN_AMPLIADA3.;
ATTRIB IN_LEDOR 					FORMAT=$IN_LEDOR3.;
ATTRIB IN_ACESSO 					FORMAT=$IN_ACESSO3.;
ATTRIB IN_TRANSCRICAO 				FORMAT=$IN_TRANSCRICAO3.;
ATTRIB IN_LIBRAS 					FORMAT=$IN_LIBRAS3.;
ATTRIB IN_TEMPO_ADICIONAL			FORMAT=$IN_TEMPO_ADICIONAL3.;
ATTRIB IN_LEITURA_LABIAL 			FORMAT=$IN_LEITURA_LABIAL3.;
ATTRIB IN_MESA_CADEIRA_RODAS 		FORMAT=$IN_MESA_CADEIRA_RODAS3.;
ATTRIB IN_MESA_CADEIRA_SEPARADA 	FORMAT=$IN_MESA_CADEIRA_SEPARADA3.;
ATTRIB IN_APOIO_PERNA 				FORMAT=$IN_APOIO_PERNA3.;
ATTRIB IN_GUIA_INTERPRETE 			FORMAT=$IN_GUIA_INTERPRETE3.;
ATTRIB IN_COMPUTADOR 				FORMAT=$IN_COMPUTADOR3.;
ATTRIB IN_CADEIRA_ESPECIAL 			FORMAT=$IN_CADEIRA_ESPECIAL3.;
ATTRIB IN_CADEIRA_CANHOTO 			FORMAT=$IN_CADEIRA_CANHOTO3.;
ATTRIB IN_CADEIRA_ACOLCHOADA 		FORMAT=$IN_CADEIRA_ACOLCHOADA3.;
ATTRIB IN_PROVA_DEITADO 			FORMAT=$IN_PROVA_DEITADO3.;
ATTRIB IN_MOBILIARIO_OBESO 			FORMAT=$IN_MOBILIARIO_OBESO3.;
ATTRIB IN_LAMINA_OVERLAY 			FORMAT=$IN_LAMINA_OVERLAY3.;
ATTRIB IN_PROTETOR_AURICULAR 		FORMAT=$IN_PROTETOR_AURICULAR3.;
ATTRIB IN_MEDIDOR_GLICOSE 			FORMAT=$IN_MEDIDOR_GLICOSE3.;
ATTRIB IN_MAQUINA_BRAILE 			FORMAT=$IN_MAQUINA_BRAILE3.;
ATTRIB IN_SOROBAN 					FORMAT=$IN_SOROBAN3.;
ATTRIB IN_MARCA_PASSO 				FORMAT=$IN_MARCA_PASSO3.;
ATTRIB IN_SONDA 					FORMAT=$IN_SONDA3.;
ATTRIB IN_MEDICAMENTOS 				FORMAT=$IN_MEDICAMENTOS3.;
ATTRIB IN_SALA_INDIVIDUAL 			FORMAT=$IN_SALA_INDIVIDUAL3.;
ATTRIB IN_SALA_ESPECIAL 			FORMAT=$IN_SALA_ESPECIAL3.;
ATTRIB IN_SALA_ACOMPANHANTE 		FORMAT=$IN_SALA_ACOMPANHANTE3.;
ATTRIB IN_MOBILIARIO_ESPECIFICO 	FORMAT=$IN_MOBILIARIO_ESPECIFICO3.;
ATTRIB IN_MATERIAL_ESPECIFICO 		FORMAT=$IN_MATERIAL_ESPECIFICO3.;
ATTRIB TP_PRESENCA_CN 				FORMAT=$TP_PRESENCA_CN20.;
ATTRIB TP_PRESENCA_CH 				FORMAT=$TP_PRESENCA_CH20.;
ATTRIB TP_PRESENCA_LC 				FORMAT=$TP_PRESENCA_LC20.;
ATTRIB TP_PRESENCA_MT 				FORMAT=$TP_PRESENCA_MT20.;
ATTRIB CO_PROVA_CN 					FORMAT=$CO_PROVA_CN40.;
ATTRIB CO_PROVA_CH 					FORMAT=$CO_PROVA_CH40.;
ATTRIB CO_PROVA_LC 					FORMAT=$CO_PROVA_LC40.;
ATTRIB CO_PROVA_MT 					FORMAT=$CO_PROVA_MT40.;
ATTRIB TP_LINGUA 					FORMAT=$TP_LINGUA10.;
ATTRIB TP_STATUS_REDACAO 			FORMAT=$TP_STATUS_REDACAO35.;
ATTRIB NU_INSCRICAO FORMAT = 21.;
ATTRIB NU_NOTA_CN   FORMAT = 8.2;
ATTRIB NU_NOTA_CH   FORMAT = 8.2;
ATTRIB NU_NOTA_LC   FORMAT = 8.2;
ATTRIB NU_NOTA_MT   FORMAT = 8.2;
ATTRIB NU_NOTA_COMP1    FORMAT = 8.2;
ATTRIB NU_NOTA_COMP2    FORMAT = 8.2;
ATTRIB NU_NOTA_COMP3    FORMAT = 8.2;
ATTRIB NU_NOTA_COMP4    FORMAT = 8.2;
ATTRIB NU_NOTA_COMP5    FORMAT = 8.2;
ATTRIB NU_NOTA_REDACAO  FORMAT = 8.2;
ATTRIB Q001  FORMAT=$Qum.;
ATTRIB Q002  FORMAT=$Qdois.;
ATTRIB Q003  FORMAT=$Qtres.;
ATTRIB Q004  FORMAT=$Qquatro.;
ATTRIB Q005  FORMAT=$Qcinco.;
ATTRIB Q006  FORMAT=$Qseis.;
ATTRIB Q007  FORMAT=$Qsete.;
ATTRIB Q008  FORMAT=$Qoito.;
ATTRIB Q009  FORMAT=$Qnove.;
ATTRIB Q010 FORMAT=$Qdez.;
ATTRIB Q011 FORMAT=$Qonze.;
ATTRIB Q012 FORMAT=$Qdoze.;
ATTRIB Q013 FORMAT=$Qtreze.;
ATTRIB Q014 FORMAT=$Qcatorze.;
ATTRIB Q015 FORMAT=$Qquinze.;
ATTRIB Q016 FORMAT=$Qdezesseis.;
ATTRIB Q017 FORMAT=$Qdezessete.;
ATTRIB Q018 FORMAT=$Qdezoito.;
ATTRIB Q019 FORMAT=$Qdezenove.;
ATTRIB Q020 FORMAT=$Qvinte.;
ATTRIB Q021 FORMAT=$Qvinteum.;
ATTRIB Q022 FORMAT=$Qvintedois.;
ATTRIB Q023 FORMAT=$Qvintetres.;
ATTRIB Q024 FORMAT=$Qvintequatro.;
ATTRIB Q025 FORMAT=$Qvintecinco.;

LABEL

NU_INSCRICAO    =   'Número de inscrição'
NU_ANO    =   'Ano do Enem'
CO_MUNICIPIO_RESIDENCIA   =   'Código do município de residência'
NO_MUNICIPIO_RESIDENCIA   =   'Nome do município de residência'
CO_UF_RESIDENCIA   =   'Código da Unidade da Federação de residência'
SG_UF_RESIDENCIA   =   'Sigla da Unidade da Federação de residência'
IN_ESTUDA_CLASSE_HOSPITALAR   =   'Indicador de inscrição em Unidade Hospitalar'
IN_TREINEIRO = 'Indica se o inscrito fez a prova com intuito de apenas treinar seus conhecimentos'
CO_ESCOLA   =   'Código da Escola'
CO_MUNICIPIO_ESC   =   'Código do município da escola' 
NO_MUNICIPIO_ESC   =   'Nome do município da escola'
CO_UF_ESC   =   'Código da Unidade da Federação da escola'
SG_UF_ESC   =   'Sigla da Unidade da Federação da escola'
TP_DEPENDENCIA_ADM_ESC   =   'Dependência administrativa (Escola)'
TP_LOCALIZACAO_ESC   =   'Localização (Escola)'
TP_SIT_FUNC_ESC   =   'Situação de funcionamento (Escola)'
NU_IDADE    =   'Idade'
TP_SEXO    =   'Sexo'
TP_NACIONALIDADE   =   'Nacionalidade'
CO_MUNICIPIO_NASCIMENTO   =   'Código do município de nascimento'
NO_MUNICIPIO_NASCIMENTO   =   'Nome do município de nascimento'
CO_UF_NASCIMENTO   =   'Código da Unidade da Federação de nascimento'
SG_UF_NASCIMENTO   =   'Sigla da Unidade da Federação de nascimento'
TP_ST_CONCLUSAO    =   'Situação de conclusão do Ensino Médio'
TP_ANO_CONCLUIU    =   'Ano de Conclusão do Ensino Médio'
TP_ESCOLA    =   'Tipo de escola do Ensino Médio'
TP_ENSINO    =   'Tipo de instituição que concluiu ou concluirá o Ensino Médio'
TP_ESTADO_CIVIL    =   'Estado Civil' 
TP_COR_RACA    =   'Cor/raça'
IN_BAIXA_VISAO    =   'Indicador de baixa visão'
IN_CEGUEIRA    =   'Indicador de cegueira'
IN_SURDEZ    =   'Indicador de surdez'
IN_DEFICIENCIA_AUDITIVA    =   'Indicador de deficiência auditiva'
IN_SURDO_CEGUEIRA    =   'Indicador de surdo-cegueira'
IN_DEFICIENCIA_FISICA    =   'Indicador de deficiência física'
IN_DEFICIENCIA_MENTAL    =   'Indicador de deficiência mental'
IN_DEFICIT_ATENCAO    =   'Indicador de déficit de atenção'
IN_DISLEXIA    =   'Indicador de dislexia'
IN_GESTANTE    =   'Indicador de gestante'
IN_LACTANTE    =   'Indicador de lactante'
IN_IDOSO    =   'Indicador de inscrito idoso'
IN_DISCALCULIA =	'Indicador de discalculia'
IN_AUTISMO   =   'Indicador de autismo'
IN_VISAO_MONOCULAR = 'Indicador de visão monocular'
IN_OUTRA_DEF	=	'Indicador de outra deficiência ou condição especial'
IN_SEM_RECURSO	=	'Indicador de inscrito que não requisitou nenhum recurso'
IN_BRAILLE    =   'Indicador de solicitação de prova em braille'
IN_AMPLIADA_24    =   'Indicador de solicitação de prova super ampliada com fonte tamanho 24'
IN_AMPLIADA_18    =   'Indicador de solicitação de prova super ampliada com fonte tamanho 18'
IN_LEDOR    =   'Indicador de solicitação de auxílio de ledor'
IN_ACESSO    =   'Indicador de solicitação de sala de fácil acesso'
IN_TRANSCRICAO    =   'Indicador de solicitação para transcrição'
IN_LIBRAS    =   'Indicador de solicitação de Tradutor-Intérprete Libras'
IN_TEMPO_ADICIONAL  =   'Indicador de solicitação de Tempo Adicional'
IN_LEITURA_LABIAL   =   'Indicador de solicitação de leitura labial'
IN_MESA_CADEIRA_RODAS    =   'Indicador de solicitação de mesa para cadeira de rodas'
IN_MESA_CADEIRA_SEPARADA    =   'Indicador de solicitação de mesa e cadeira separadas'
IN_APOIO_PERNA    =   'Indicador de solicitação de apoio de perna e pé'
IN_GUIA_INTERPRETE    =   'Indicador de solicitação de guia intérprete'
IN_COMPUTADOR 			= 'Indicador de solicitação de computador'
IN_CADEIRA_ESPECIAL 	= 'Indicador de solicitação de cadeira especial'
IN_CADEIRA_CANHOTO 		= 'Indicador de solicitação de cadeira para canhoto'
IN_CADEIRA_ACOLCHOADA 	= 'Indicador de solicitação de cadeira acolchoada'
IN_PROVA_DEITADO 		= 'Indicador de solicitação para fazer prova deitado em maca ou mobiliário similar'
IN_MOBILIARIO_OBESO 	= 'Indicador de solicitação de mobiliário adequado para obeso' 
IN_LAMINA_OVERLAY 		= 'Indicador de solicitação de lâmina overlay'
IN_PROTETOR_AURICULAR 	= 'Indicador de solicitação de protetor auricular'
IN_MEDIDOR_GLICOSE 		= 'Indicador de solicitação de medidor de glicose e/ou aplicação de insulina'
IN_MAQUINA_BRAILE 		= 'Indicador de solicitação de máquina Braile e/ou Reglete e Punção'
IN_SOROBAN 				= 'Indicador de solicitação de soroban'
IN_MARCA_PASSO 			= 'Indicador de solicitação de marca-passo (impeditivo de uso de detector de metais)'
IN_SONDA				= 'Indicador de solicitação de sonda com troca periódica'
IN_MEDICAMENTOS 		= 'Indicador de solicitação de medicamentos'
IN_SALA_INDIVIDUAL 		= 'Indicador de solicitação de sala especial individual'
IN_SALA_ESPECIAL 		= 'Indicador de solicitação de sala especial até 20 participantes'
IN_SALA_ACOMPANHANTE 	= 'Indicador de solicitação de sala reservada para acompanhantes'
IN_MOBILIARIO_ESPECIFICO = 'Indicador de solicitação de mobiliário específico'
IN_MATERIAL_ESPECIFICO	= 'Indicador de solicitação de material específico'
IN_NOME_SOCIAL	=	'Indicador de inscrito que se declarou travesti, transexual ou transgênero e solicitou atendimento pelo Nome Social, conforme é reconhecido socialmente em consonância com sua identidade de gênero'
CO_MUNICIPIO_PROVA    =   'Código do município da aplicação da prova'
NO_MUNICIPIO_PROVA   =   'Nome do município da aplicação da prova'
CO_UF_PROVA    =   'Código da Unidade da Federação da aplicação da prova'
SG_UF_PROVA    =   'Sigla da Unidade da Federação da aplicação da prova'
TP_PRESENCA_CN    =   'Presença na prova objetiva de Ciências da Natureza'
TP_PRESENCA_CH    =   'Presença na prova objetiva de Ciências Humanas'
TP_PRESENCA_LC    =   'Presença na prova objetiva de Linguagens e Códigos'
TP_PRESENCA_MT    =   'Presença na prova objetiva de Matemática'
NU_NOTA_CN   =   'Nota da prova de Ciências da Natureza'
NU_NOTA_CH   =   'Nota da prova de Ciências Humanas'
NU_NOTA_LC   =   'Nota da prova de Linguagens e Códigos'
NU_NOTA_MT   =   'Nota da prova de Matemática'
TX_RESPOSTAS_CN    =   'Vetor com as respostas da parte objetiva da prova de Ciências da Natureza'
TX_RESPOSTAS_CH    =   'Vetor com as respostas da parte objetiva da prova de Ciências Humanas' 
TX_RESPOSTAS_LC    =   'Vetor com as respostas da parte objetiva da prova de Linguagens e Códigos' 
TX_RESPOSTAS_MT    =   'Vetor com as respostas da parte objetiva da prova de Matemática' 
CO_PROVA_CN    =   'Código do tipo de prova de Ciências da Natureza'
CO_PROVA_CH    =   'Código do tipo de prova de Ciências Humanas'
CO_PROVA_LC    =   'Código do tipo de prova de Linguagens e Códigos'
CO_PROVA_MT    =   'Código do tipo de prova de Matemática'
TP_LINGUA   =   'Tipo de Língua Estrangeira'
TX_GABARITO_CN   =   'Vetor com o gabarito da parte objetiva da prova de Ciências da Natureza'
TX_GABARITO_CH   =   'Vetor com o gabarito da parte objetiva da prova de Ciências Humanas'
TX_GABARITO_LC   =   'Vetor com o gabarito da parte objetiva da prova de Linguagens e Códigos'
TX_GABARITO_MT   =   'Vetor com o gabarito da parte objetiva da prova de Matemática'
TP_STATUS_REDACAO  =   'Situação da redação do participante'
NU_NOTA_COMP1   =   'Nota da competência 1'
NU_NOTA_COMP2   =   'Nota da competência 2'
NU_NOTA_COMP3   =   'Nota da competência 3'
NU_NOTA_COMP4   =   'Nota da competência 4'
NU_NOTA_COMP5   =   'Nota da competência 5'
NU_NOTA_REDACAO   =   'Nota da prova de redação'
Q001    =   'Até que série seu pai, ou o homem responsável por você, estudou?'
Q002    =   'Até que série sua mãe, ou a mulher responsável por você, estudou?'
Q003    =   'Indique o grupo que contempla a ocupação mais próxima da ocupação do seu pai ou do homem responsável por você'
Q004    =   'Indique o grupo que contempla a ocupação mais próxima da ocupação da sua mãe ou da mulher responsável por você'
Q005    =   'Incluindo você, quantas pessoas moram atualmente em sua residência?'
Q006    =   'Qual é a renda mensal de sua família? (Some a sua renda com a dos seus familiares.)'
Q007    =   'Em sua residência trabalha empregado(a) doméstico(a)?'
Q008    =   'Na sua residência tem banheiro?'
Q009    =   'Na sua residência tem quartos para dormir?'
Q010   =    'Na sua residência tem carro?'
Q011   =    'Na sua residência tem motocicleta?'
Q012   =    'Na sua residência tem geladeira?'
Q013   =    'Na sua residência tem freezer (independente ou segunda porta da geladeira)?'
Q014   =    'Na sua residência tem máquina de lavar roupa (o tanquinho NÃO deve ser considerado)?'
Q015   =    'Na sua residência tem máquina de secar roupa (independente ou em conjunto com a máquina de lavar roupa)?'
Q016   =    'Na sua residência tem forno micro-ondas?'
Q017   =    'Na sua residência tem máquina de lavar louça?'
Q018   =    'Na sua residência tem aspirador de pó?'
Q019   =    'Na sua residência tem televisão em cores?'
Q020   =    'Na sua residência tem aparelho de DVD?'
Q021   =    'Na sua residência tem TV por assinatura?'
Q022   =    'Na sua residência tem telefone celular?'
Q023   =    'Na sua residência tem telefone fixo?'
Q024   =    'Na sua residência tem computador?'
Q025   =    'Na sua residência tem acesso à Internet?';

IF NU_INSCRICAO = . THEN DELETE;

RUN;