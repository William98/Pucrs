# --------------------------
# Alunos: Arthur D'Arisbo e Lucas Ribeiro
# --------------------------
.data
	ANOS:	.word 	2018 2016 2014 2012 2010	# 00 04 08 12 16
			1980 1979 1978 1977 1976	# 20 24 28 32 36
			1968 1966 1964 1962 1960	# 40 44 48 52 56
			1948 1946 1944 1942 1940	# 60 64 68 72 76
	LINHA:  	.word 4
	COLUNA:		.word 5
	COPA_CNT:	.word 0
	COPA_ANOS:	.word 0 0 0 0 0
	OLIM_CNT:	.word 0
	OLIM_ANOS:	.word 0 0 0 0 0
	TEXTO_1:	.asciiz "Qual linha deseja verificar?"
	TEXTO_2:	.asciiz "Total de Copas do Mundo: "
	TEXTO_3:	.asciiz "\nOs anos das Copas do Mundo foram: "
	TEXTO_4:	.asciiz "\nTotal de Olimpiadas: "
	TEXTO_5:	.asciiz "\nOs anos das Olimpiadas foram: "
	TEXTO_6:	.asciiz ","

.text
.globl  main

main:
	la	$t0, ANOS		# Carrega o endereço para "vetor" ANOS
	la	$t1, LINHA		# Carrega o endereço para LINHA
	la	$t2, COLUNA		# Carrega o endereço para COLUNA
	la	$s0, COPA_CNT		# Carrega o endereço para COPA_CNT
	la	$s1, COPA_ANOS		# Carrega o endereço para vetor COPA_ANOS 
	la	$s2, OLIM_CNT		# Carrega o endereço para OLIM_CNT
	la	$s3, OLIM_ANOS		# Carrega o endereço para vetor OLIM_ANOS
	lw	$s6, 0($s0)		# Carrega a Quantidade de Copas
	lw	$s7, 0($s2)		# Carrega a Quantidade de Olimpiadas

linha:
######################################################################### @TODO Verificar porque o intervalo começa em zero 
	la	$a0, TEXTO_1		# Carrega o texto a ser exibido
	li	$a1, 4			# Parametro Syscall
	jal	imprimir		# Chamada da funcao imprimir TEXTO_1
	li	$v0, 5			# Preparo programa para capturar valor
	syscall				# Chamada do sistema para receber inteiro
	lw	$t1, 0($t1)		# Carrega o valor da LINHA
	lw	$t2, 0($t2)		# Carrega o valor da COLUNA
	bltz	$v0, linha		# if valor informado < 0 salta para main
	bge	$v0, $t1, linha		# if valor informado >= LINHA salta para main
	move	$t3, $v0		# Carrega o valor da linha desejada
	li	$t4, 4			# Distancia entre cada endereço de memoria
	mul	$t4, $t4, $t2		# Calcula quantos bits é acrescentado para o endereço de memoria da linha desejada
	mul	$t4, $t4, $t3		# Calcula o endereço do primeiro ano a ser manipulado
	add	$t0, $t0, $t4		# Recebe primeiro ano a ser calculado
#########################################################################
#		Loop que executa as Funcoes				#
#########################################################################
loop1:
	blez	$t2, final		# Verifica se o indice coluna é igual ou menor que zero
	lw	$a2, 0($t0)		# Carrega o ano em $a2 para chamada de funções
	jal	f_copa			# Chamada da função copa
	bne	$v1, $zero, add_copa	# Verifica se a função retornou ano : Salta para adicionar ano
	jal	f_olimpiada		# Chamada da função olimpiada
	bne	$v1, $zero, add_olim	# Verifica se a função retornou ano: Salta para adiocinar ano
	j	loop2			# Caso não haja ocorrencia segue loop		
add_copa:
	# Adicionar ano na Copa
	addiu	$s6, $s6, 1		# Adiciona uma ocorrencia no contador Copa
	sw	$v1, 0($s1)		# Armazena no vetor ANOS_COPA
	add	$s1, $s1, 4		# Aponta o endereço para proxima posição do Vetor Copa
	j	loop2			# Continua loop
	
add_olim:
	# Adicionar ano na Olimpiada
	addiu	$s7, $s7, 1		# Adiciona uma ocorrencia no contador Olimpiadas
	sw	$v1, 0($s3)		# Armazena no vetor ANOS_OLIMPIADAS
	add	$s3, $s3, 4		# Aponta o endereço para proxima posição do Vetor Olimpiadas
	j	loop2			# Continua loop
	
loop2:
	add	$t0, $t0, 4		# Passa para a proxima posicao da linha
	addiu	$t2, $t2, -1		# Decrementa o indice da coluna
	j	loop1			# Salta sempre para o loop

final:
	#@TODO armazenar quantidade de copas e olimpiadas 
	la	$a0, TEXTO_2		# Carrega o texto a ser exibido
	li	$a1, 4			# Parametro Syscall
	jal	imprimir		# Imprimi o TEXTO_2
	
	move	$a0, $s6		# Carrega a quantida de copas
	li	$a1, 1			# Parametro do Syscall
	jal	imprimir		# Imprimi a quantidade de copas
	
	la	$a0, TEXTO_3		# Carrega o texto a ser exibido
	li	$a1, 4			# Parametro do Syscall
	jal	imprimir		# Imprimi o TEXTO_3
	
	la	$s1, COPA_ANOS
	la	$s3, OLIM_ANOS 
loop3:
	blez	$s6, final2
	lw	$t3, 0($s1)
	move	$a0, $t3
	li	$a1, 1
	jal	imprimir
	
	addiu	$s6, $s6, -1
	blez	$s6, final2
	
	la	$a0, TEXTO_6
	li	$a1, 4
	jal	imprimir
		
	add	$s1, $s1, 4
	j	loop3	
	
final2:
	la	$a0, TEXTO_4		# Carrega o texto a ser exibido
	li	$a1, 4			# Parametro Syscall
	jal	imprimir		# Imprimi o TEXTO_4
	
	move	$a0, $s7		# Carrega a quantida de copas
	li	$a1, 1			# Parametro do Syscall
	jal	imprimir		# Imprimi a quantidade de copas
	
	la	$a0, TEXTO_5		# Carrega o texto a ser exibido
	li	$a1, 4			# Parametro do Syscall
	jal	imprimir		# Imprimi o TEXTO_5
loop4:
	blez	$s7, exit
	lw	$t4, 0($s3)
	move	$a0, $t4
	li	$a1, 1
	jal	imprimir
	
	addiu	$s7, $s7, -1
	blez	$s7, exit
	
	la	$a0, TEXTO_6
	li	$a1, 4
	jal	imprimir
	
	add	$s3, $s3, 4
	j	loop4

exit:		
	li	$v0, 10			# Finaliza o programa
	syscall



#########################################################################
# 				FUNCOES				    	#
#########################################################################
# Recebe a mensagem em $a0 e o tipo de Syscall em $a1
imprimir:
	move	$v0, $a1
	syscall
	jr	$ra
	
#########################################################################
# Recebe o ano a ser verificado em $a2 e retorna o ano em  $v1	caso haja ocorrencia
f_copa:
	li	$s4, 1930		# Carrega o inicio do intervalo
	blt	$a2, $s4, copa_false	# Verifica se o ano é menor que 1930 : Salta para não armazenar
	li	$s4, 2018		# Carrega o final do intervalo
	bgt	$a2, $s4, copa_false	# Verifica se o ano é maior que 2018 : Salta para não armazenar
	subu	$s4, $s4, $a2		# 2018 - Ano
copa_loop:
	beq	$s4, $zero, copa_true	# Se resto for igual a 0 passa
	subu 	$s4, $s4, 4		# Subtrai 4
	bltz	$s4, copa_false		# Se resto for menor que 0 não passa
	j	copa_loop		# Continua testando
	
copa_true:
	move	$v1, $a2		# Armazena o ano em $v1
	j	copa_fim		# Segue para fim da funcao
copa_false:
	move	$v1, $zero		# Armazena zero em $v1
	j	copa_fim		# Segue para fim da funcao
copa_fim:
	jr	$ra

#########################################################################
# Recebe o ano a ser verificado em $a2 e retorna o ano em $v1 caso haja ocorrencia
f_olimpiada:
	li	$s4, 1906		# Carrega a exceção 1906
	beq	$a2, $s4, olim_true	# Verifica se o ano é igual a 1906 : Salta para armazenar ano
	li	$s4, 1916		# Carrega a excessão 1916
	beq	$a2, $s4, olim_false	# Verifica se o ano é igual a 1916 : Salta para não armazenar 
	li	$s4, 1940		# Carrega a excessão 1940
	beq	$a2, $s4, olim_false	# Verifica se o ano é igual a 1940 : Salta para não armazenar
	li	$s4, 1944		# Carrega a excessão 1944
	beq	$a2, $s4, olim_false 	# Verifica se o ano é igual a 1944 : Salta para não armazenar
	li	$s4, 1896		# Carrega o inicio do intervalo
	blt	$a2, $s4, olim_false	# Verifica se o ano é menor que 1896 : Salta para não armazenar
	li	$s4, 2016		# Carrega o final do intervalo
	bgt	$a2, $s4, olim_false	# Verifica se o ano é maior que 2016 : Salta para não armazenar
	subu	$s4, $s4, $a2		# 2016 - Ano
olim_loop:
	beq	$s4, $zero, olim_true	# Se resto for igual a 0 passa
	subu 	$s4, $s4, 4		# Subtrai 4
	bltz	$s4, olim_false		# Se resto for menor que 0 não passa
	j	copa_loop		# Continua testando

olim_true:
	move	$v1, $a2		# Armazena o ano em $v1
	j	olim_fim		# Segue para o fim da funcao
olim_false:
	move	$v1, $zero		# Armazena zero em $v1
	j	olim_fim		# Segue para o final da funcao
olim_fim:
	jr   $ra
