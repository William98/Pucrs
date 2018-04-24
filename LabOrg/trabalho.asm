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
	######################################################################
linha:
	######################################################################
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
	######################################################################
loop:
	######################################################################
	blez	$t2, exit		# Verifica se o indice coluna é igual ou menor que zero
	lw	$s4, 0($t0)		# Carrega o ano em $s4
	# Chamadas de funcoes f_copa e f_olimpiada
	######################################################################
	# Imprime os anos
	move	$a0, $s4
	li	$a1, 1
	jal	imprimir
	######################################################################
	add	$t0, $t0, 4
	addiu	$t2, $t2, -1		# Decrementa o indice da coluna
	j	loop			# Salta sempre para o loop
	######################################################################
exit:
	li	$v0, 10
	syscall

# Recebe a mensagem em $a0 e o tipo de Syscall em $a1
imprimir:
	move	$v0, $a1
	syscall
	jr	$ra
	
f_copa:
	# Colocar aqui o seu codigo!
	jr   $ra

f_olimpiada:
	# Colocar aqui o seu codigo!
	jr   $ra
