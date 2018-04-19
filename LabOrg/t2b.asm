# --------------------------
# Alunos: Arthur D'Arisbo e Lucas Ribeiro
# --------------------------
.data
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
	la		$a0, TEXTO_1		# Qual linha deseja verificar?
	jal		imprimir
	li		$v0, 5	
	syscall						# leitura integer em $v0
	bltz	$v0, main 			# if inteiro lido < 0 salto para main
	bgtu	$v0, LINHA, main 	# if inteiro lido > LINHA salto para main
	move	$a1, $v0			# $a1 guarda linha
	li		$a2, 0				# $a2 contador coluna = 0
	
copa:
	jal		f_copa				# Verifica se teve copa na posicao [$a1][$a2]
	beq		$v0, $zero,	olim	# Caso não haja ocorrencia salta para olimpiadas
	addu	$t0, $t0, $v0		# $t0 add ocorrencia copa
	move	$t1, $v1			# Move o ano copa para $t1
	j		incr				# Salto para incrementar coluna
olim:
	jal		f_olimpiada			# Verifica se teve olimpiada na posicao [$a1][$a2]
	beq		$v0, $zero, incr	# Caso não haja ocorrencia salta para incrementar coluna
	addu	$t2, $t2, $v0		# $t2 add ocorrencia olimpiada
	move	$t3, $v1			# Move o ano olimpiada para $t3
	j		incr				# Salto para incrementar contadores e ocorrencias
incr:
	addiu	$a1, $a1, 1			# Incremeta coluna
	beq		$a1, COLUNA, exit	# if contador coluna == COLUNA
	# incrementa copa_ano
	# incrementa olimpiada_ano
	j		copa				# Salta para copa
  
exit:
	la		$a0, TEXTO_2		
	jal		imprimir			# Total de Copas do Mundo:
	la		$a0, COPA_CNT		
	jal		imprimir			# Ocorrencia de copa		
	la		$a0, COPA_ANOS
	jal		imprimir			# Os anos das Copas do Mundo foram:
	la		$a0, OLIM_CNT
	jal		imprimir			# Total de Olimpiadas:
	la		$a0, OLIM_ANOS
	jal		imprimir			# Os anos de Olimpiadas foram:
	
	li		$v0, 10
	syscall
	jr		$ra

# Funcoes imprimir, f_copa e f_olimpiada
imprimir:
  li		$v0, 4	# print string $a0
  syscall  
  jr    	$ra		# retorna o PC durante a chamada

f_copa:
  # Colocar aqui o seu codigo!
  jr   $ra

f_olimpiada:
	# Colocar aqui o seu codigo!
	jr   $ra
