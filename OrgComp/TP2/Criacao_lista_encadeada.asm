##################################################################### 
# Autor: Ney Calazans
# 
#	O objetivo deste programa � criar uma lista encadeada
#	com conte�dos aleatoriamente distribu�dos, retirados de um
#	vetor linear (Vetor) com uma determinada quantidade de 
#	elementos (Size), que definir� o tamanho inicial da lista.
#
        .text   
        .globl	main            
##################################################################### 
# Programa principal - chama cria��o de lista e tentativa(s) de
# remo��o de elementos desta
#####################################################################
main:	li	$fp,0x10040000	# inicializa $fp - apontador de heap

# Processo de gera��o da lista encadeada
	la	$t0,Vetor	# Carrega endere�o do vetor em $t0
	la	$t1,Size
	lw	$t1,0($t1)	# $t1 tem tamanho do vetor
	addiu	$sp,$sp,-12	# aloca espa�o para tr�s dados na pilha
	sw	$ra,0($sp)	# Endere�o de retorno no topo da pilha
	sw	$t0,4($sp)	# Ponteiro para vetor abaixo do topo
	sw	$t1,8($sp)	# Tamanho duas posi��es abaixo do topo

	jal	gera_lista	# gera lista encadeada no heap

	lw	$ra,0($sp)	# recupera endere�o de retorno
	addiu	$sp,$sp,12	# desaloca espa�o na pilha
	la	$t5,cabeca	# gera ponteiro para cabe�a da lista
	sw	$v0,0($t5) 	# salva ponteiro para cabe�a da lista

				# inserir c�digo

	li	$v0,10		# carrega cod. syscall para finalizar programa
	syscall

##################################################################### 
# Rotina geradora da lista encadeada no heap
# Na entrada a pilha possui 
#	topo: $ra de retorno (no topo)
#	topo+1: ponteiro para o vetor linear a partir do qual 
#		ser� criada a lista encadeada, usando escolhas 
#		aleat�rias de posi��es do vetor
#	topo+2: tamanho do vetor linear
# Na sa�da, a rotina retorna em $v0 o endere�o da cabe�a da lista
#	encadeada criada aqui
##################################################################### 
gera_lista:
	lw	$t0,4($sp)		# Busca para $t0 ponteiro para vetor linear 
	lw	$t1,8($sp)		# Busca para $t1 tamanho do vetor
	li	$t2,0			# Gera valor de ponteiro nulo em $t2 (0)
	addiu	$a1,$zero,117		# Produz semente (117) de gerador de n�meros
					# 	aleat�rios e coloca em $a0
	addiu	$v0,$zero,40		# Gera c�digo de syscall para definir 
					# 	semente de gerador aleat�rio (40)
	syscall				# Define a semente de gera��o (100)

l_gera:	beq	$t1,$zero,end_gera	# Se tratou todos os elementos, fim da gera��o
#
# Processo de gera��o de novo conte�do aleat�rio de elemento para a lista encadeada
#
	lw	$a1,8($sp)		# Sen�o, busca para $a1 tamanho do vetor
	addiu	$a1,$a1,-1		# Decrementa para gerar limite superior de 
					# 	gera��o de valores aleat�rios
	addiu	$v0,$zero,42		# Gera c�digo de syscall para gera��o
					# 	aleat�rio limitada (42)
	syscall				# Gera novo �ndice em $a0
	sll	$a0,$a0,2		# Multiplica �ndice por 4
	addu	$a0,$a0,$t0		# Produz em $a0 endere�o de novo elemento
	lw	$t3,0($a0)		# Pega campo de dados do novo elemento
# Fim da gera��o do novo elemento

#
# Inser��o na lista encadeada do novo elemento
#
	li	$t4,0			# Gera ponteiro nulo (0) em $t4
	beq	$t2,$zero,prim		# Se primeiro da lista, trata diferente
	sw	$fp,-4($fp)		# Gera ponteiro para novo elemento e
					# 	atualiza link do elemento pr�vio
cont:	addiu	$fp,$fp,8		# Aloca novo elemento no heap
	sw	$t3,-8($fp)		# Preenche campo de dados do novo elemento
	sw	$t4,-4($fp)		# Preenche campo de link do novo elemento
	addiu	$t1,$t1,-1		# Decrementa contador
	j	l_gera			# Repete la�o

# O primeiro elemento da lista precisa ter seu endere�o guardado para o retorno
prim:	move	$v1,$fp			# Guarda ponteiro para cabe�a da lista em $v1
	li	$t2,1			# 	temporariamente (para retornar) 
	j	cont			# Volta a processar
	
end_gera:	
	move	$v0,$v1			# Recupera endere�o da cabe�a da lista
	jr	$ra			# E retorna

	.data
Vetor:	.word	1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
Size:	.word	20
cabeca:	.word	0

       


