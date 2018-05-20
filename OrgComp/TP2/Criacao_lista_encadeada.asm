##################################################################### 
# Autor: Ney Calazans
# 
#	O objetivo deste programa é criar uma lista encadeada
#	com conteúdos aleatoriamente distribuídos, retirados de um
#	vetor linear (Vetor) com uma determinada quantidade de 
#	elementos (Size), que definirá o tamanho inicial da lista.
#
        .text   
        .globl	main            
##################################################################### 
# Programa principal - chama criação de lista e tentativa(s) de
# remoção de elementos desta
#####################################################################
main:	li	$fp,0x10040000	# inicializa $fp - apontador de heap

# Processo de geração da lista encadeada
	la	$t0,Vetor	# Carrega endereço do vetor em $t0
	la	$t1,Size
	lw	$t1,0($t1)	# $t1 tem tamanho do vetor
	addiu	$sp,$sp,-12	# aloca espaço para três dados na pilha
	sw	$ra,0($sp)	# Endereço de retorno no topo da pilha
	sw	$t0,4($sp)	# Ponteiro para vetor abaixo do topo
	sw	$t1,8($sp)	# Tamanho duas posições abaixo do topo

	jal	gera_lista	# gera lista encadeada no heap

	lw	$ra,0($sp)	# recupera endereço de retorno
	addiu	$sp,$sp,12	# desaloca espaço na pilha
	la	$t5,cabeça	# gera ponteiro para cabeça da lista
	sw	$v0,0($t5) 	# salva ponteiro para cabeça da lista

				# inserir código

	li	$v0,10		# carrega cod. syscall para finalizar programa
	syscall

##################################################################### 
# Rotina geradora da lista encadeada no heap
# Na entrada a pilha possui 
#	topo: $ra de retorno (no topo)
#	topo+1: ponteiro para o vetor linear a partir do qual 
#		será criada a lista encadeada, usando escolhas 
#		aleatórias de posições do vetor
#	topo+2: tamanho do vetor linear
# Na saída, a rotina retorna em $v0 o endereço da cabeça da lista
#	encadeada criada aqui
##################################################################### 
gera_lista:
	lw	$t0,4($sp)		# Busca para $t0 ponteiro para vetor linear 
	lw	$t1,8($sp)		# Busca para $t1 tamanho do vetor
	li	$t2,0			# Gera valor de ponteiro nulo em $t2 (0)
	addiu	$a1,$zero,117		# Produz semente (117) de gerador de números
					# 	aleatórios e coloca em $a0
	addiu	$v0,$zero,40		# Gera código de syscall para definir 
					# 	semente de gerador aleatório (40)
	syscall				# Define a semente de geração (100)

l_gera:	beq	$t1,$zero,end_gera	# Se tratou todos os elementos, fim da geração
#
# Processo de geração de novo conteúdo aleatório de elemento para a lista encadeada
#
	lw	$a1,8($sp)		# Senão, busca para $a1 tamanho do vetor
	addiu	$a1,$a1,-1		# Decrementa para gerar limite superior de 
					# 	geração de valores aleatórios
	addiu	$v0,$zero,42		# Gera código de syscall para geração
					# 	aleatório limitada (42)
	syscall				# Gera novo índice em $a0
	sll	$a0,$a0,2		# Multiplica índice por 4
	addu	$a0,$a0,$t0		# Produz em $a0 endereço de novo elemento
	lw	$t3,0($a0)		# Pega campo de dados do novo elemento
# Fim da geração do novo elemento

#
# Inserção na lista encadeada do novo elemento
#
	li	$t4,0			# Gera ponteiro nulo (0) em $t4
	beq	$t2,$zero,prim		# Se primeiro da lista, trata diferente
	sw	$fp,-4($fp)		# Gera ponteiro para novo elemento e
					# 	atualiza link do elemento prévio
cont:	addiu	$fp,$fp,8		# Aloca novo elemento no heap
	sw	$t3,-8($fp)		# Preenche campo de dados do novo elemento
	sw	$t4,-4($fp)		# Preenche campo de link do novo elemento
	addiu	$t1,$t1,-1		# Decrementa contador
	j	l_gera			# Repete laço

# O primeiro elemento da lista precisa ter seu endereço guardado para o retorno
prim:	move	$v1,$fp			# Guarda ponteiro para cabeça da lista em $v1
	li	$t2,1			# 	temporariamente (para retornar) 
	j	cont			# Volta a processar
	
end_gera:	
	move	$v0,$v1			# Recupera endereço da cabeça da lista
	jr	$ra			# E retorna

	.data
Vetor:	.word	1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
Size:	.word	20
cabeça:	.word	0

       


