.data
	# 20 itens
	ANOS:	.word 	2018 2016 2014 2012 2010
			1980 1979 1978 1977 1976
			1968 1966 1964 1962 1960
			1948 1946 1944 1942 1940
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
	la	$t0, ANOS		# Carrega o ponteiro para matriz ANOS
	la	$t1, LINHA		# Carrega o ponteiro para LINHA
	la	$t2, COLUNA		# Carrega o ponteiro para COLUNA
	######################################################################
	la	$a0, TEXTO_1		# Carrega o texto a ser exibido
	jal	imprimir		# Chamada da funcao imprimir TEXTO_1
	li	$v0, 5			# Preparo programa para capturar valor
	syscall				# Chamada do sistema para receber inteiro
	######################################################################
	lw	$t4, 0($t1)		# Carrega o valor da LINHA no $t4
	lw	$t5, 0($t2)		# Carrega o valor da COLUNA em $t5
	bltz	$v0, main		# if valor informado < 0 salta para main
	bge	$v0, $t4, main		# if valor informado >= LINHA salta para main
	######################################################################
	li	$s0, 14			# Carrega 14 em $s0
	move	$t6, $v0		# Carrega o valor da linha desejada em $t6
	mul	$s0, $s0, $t6		# Multiplica linha desejada * 14 
	add	$t0, $t0, $s0		# Incrementa o endereço até o primeiro ANO da LINHA
	######################################################################
	lw	$t3, 0($t0)		# @TODO apresenta erro quando linha informada é 1 e 3
	
		
	
	
	

	j	exit

exit:
	li	$v0, 10
	syscall

imprimir:
	li	$v0, 4
	syscall
	jr	$ra
