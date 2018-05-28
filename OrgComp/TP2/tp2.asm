##################################################################### 
# Autor: Lucas Ribeiro e Arthur D'Arisbo
# 
#	O objetivo deste programa e criar lista encadeada
#	na chamada da funcao ins_ult_el e tambem mostra a
#	soma dos elementos da lista atraves das funcoes soma_val
#	e imprimir
#
.data
	TEXTO:	.asciiz "\nSomatorio da lista: "
.text   
.globl	main

# Programa principal
main:
	li	$fp, 0x10040000		# Inicializa o topo do heap 
	
	# Adiciona 10 na Lista	
	addiu	$sp, $sp, -12		# Aloca espaco para 3 dados na pilha
	li	$t0, 10			# Carrega 10
	sw	$zero, 0($sp)		# Endereco de retorno no topo da pilha
	sw	$fp, 4($sp)		# Endereco do ponteiro do primeiro elemento
	sw	$t0, 8($sp)		# Inteiro a ser adicionado na lista
	jal	ins_ult_el		# Chamada da funcao insere ultimo elemento
	addiu	$sp, $sp, 12		# Desaloca espaco na pilha
	
	# Somatorio de todos elementos da Lista = 10
	addiu	$sp, $sp, -12		# Aloca espaco para 3 dados na pilha
	sw	$zero, 0($sp)		# Endereco de retorno no topo da pilha
	sw	$fp, 4($sp)		# Endereco do ponteiro do primeiro elemento
	sw	$zero, 8($sp)		# Zera para receber o retorno
	jal	soma_val		# Chamada da funcao insere ultimo elemento
	lw	$t1, 8($sp)		# Recupera resultado do somatorio		
	addiu	$sp, $sp, 12		# Desaloca espaco na pilha	
	
	# Imprimi somatorio = 10
	la	$a0, TEXTO		# Carrega o endereco da string que vai ser exibida 
	li	$a1, 4			# Carrega o syscall para exibicao de string
	jal	imprimir		# Requisita ao usuario 
	move	$a0, $t1		# Carrega o somatorio para exibicao
	li	$a1, 1			# Carrega syscall para exibicao de inteiro
	jal	imprimir		# Imprimi o somatorio
	
	# Adiciona 20 na Lista
	addiu	$sp, $sp, -12		# Aloca espaco para 3 dados na pilha
	li	$t0, 20			# Carrega 20
	sw	$zero, 0($sp)		# Endereco de retorno no topo da pilha
	sw	$fp, 4($sp)		# Endereco do ponteiro do primeiro elemento
	sw	$t0, 8($sp)		# Inteiro a ser adicionado na lista
	jal	ins_ult_el		# Chamada da funcao insere ultimo elemento
	addiu	$sp, $sp, 12		# Desaloca espaco na pilha
	
	# Adiciona 30 na Lista
	addiu	$sp, $sp, -12		# Aloca espaco para 3 dados na pilha
	li	$t0, 30			# Carrega 30
	sw	$zero, 0($sp)		# Endereco de retorno no topo da pilha
	sw	$fp, 4($sp)		# Endereco do ponteiro do primeiro elemento
	sw	$t0, 8($sp)		# Inteiro a ser adicionado na lista
	jal	ins_ult_el		# Chamada da funcao insere ultimo elemento
	addiu	$sp, $sp, 12		# Desaloca espaco na pilha
	
	# Somatorio de todos elementos da Lista = 10 + 20 + 30
	addiu	$sp, $sp, -12		# Aloca espaco para 3 dados na pilha
	sw	$zero, 0($sp)		# Endereco de retorno no topo da pilha
	sw	$fp, 4($sp)		# Endereco do ponteiro do primeiro elemento
	sw	$zero, 8($sp)		# Zera para receber o retorno
	jal	soma_val		# Chamada da funcao insere ultimo elemento
	lw	$t1, 8($sp)		# Recupera resultado do somatorio		
	addiu	$sp, $sp, 12		# Desaloca espaco na pilha	
	
	# Imprimi somatorio = 60
	la	$a0, TEXTO		# Carrega o endereco da string que vai ser exibida 
	li	$a1, 4			# Carrega o syscall para exibicao de string
	jal	imprimir		# Requisita ao usuario 
	move	$a0, $t1		# Carrega o somatorio para exibicao
	li	$a1, 1			# Carrega syscall para exibicao de inteiro
	jal	imprimir		# Imprimi o somatorio
	
	# Adiciona 40 na Lista	
	addiu	$sp, $sp, -12		# Aloca espaco para 3 dados na pilha
	li	$t0, 40			# Carrega 40
	sw	$zero, 0($sp)		# Endereco de retorno no topo da pilha
	sw	$fp, 4($sp)		# Endereco do ponteiro do primeiro elemento
	sw	$t0, 8($sp)		# Inteiro a ser adicionado na lista
	jal	ins_ult_el		# Chamada da funcao insere ultimo elemento
	addiu	$sp, $sp, 12		# Desaloca espaco na pilha
	
	# Adiciona 50 na Lista
	addiu	$sp, $sp, -12		# Aloca espaco para 3 dados na pilha
	li	$t0, 50			# Carrega 50
	sw	$zero, 0($sp)		# Endereco de retorno no topo da pilha
	sw	$fp, 4($sp)		# Endereco do ponteiro do primeiro elemento
	sw	$t0, 8($sp)		# Inteiro a ser adicionado na lista
	jal	ins_ult_el		# Chamada da funcao insere ultimo elemento
	addiu	$sp, $sp, 12		# Desaloca espaco na pilha
	
	# Somatorio de todos elementos da Lista = 10 + 20 + 30 + 40 + 50
	addiu	$sp, $sp, -12		# Aloca espaco para 3 dados na pilha
	sw	$zero, 0($sp)		# Endereco de retorno no topo da pilha
	sw	$fp, 4($sp)		# Endereco do ponteiro do primeiro elemento
	sw	$zero, 8($sp)		# Zera para receber o retorno
	jal	soma_val		# Chamada da funcao insere ultimo elemento
	lw	$t1, 8($sp)		# Recupera resultado do somatorio		
	addiu	$sp, $sp, 12		# Desaloca espaco na pilha
	
	# Imprimi somatorio = 150
	la	$a0, TEXTO		# Carrega o endereco da string que vai ser exibida 
	li	$a1, 4			# Carrega o syscall para exibicao de string
	jal	imprimir		# Requisita ao usuario 
	move	$a0, $t1		# Carrega o somatorio para exibicao
	li	$a1, 1			# Carrega syscall para exibicao de inteiro
	jal	imprimir		# Imprimi o somatorio

	# Adiciona 50 na Lista	
	addiu	$sp, $sp, -12		# Aloca espaco para 3 dados na pilha
	li	$t0, 50			# Carrega 40
	sw	$zero, 0($sp)		# Endereco de retorno no topo da pilha
	sw	$fp, 4($sp)		# Endereco do ponteiro do primeiro elemento
	sw	$t0, 8($sp)		# Inteiro a ser adicionado na lista
	jal	ins_ult_el		# Chamada da funcao insere ultimo elemento
	addiu	$sp, $sp, 12		# Desaloca espaco na pilha
	
	# Adiciona 50 na Lista
	addiu	$sp, $sp, -12		# Aloca espaco para 3 dados na pilha
	li	$t0, 50			# Carrega 50
	sw	$zero, 0($sp)		# Endereco de retorno no topo da pilha
	sw	$fp, 4($sp)		# Endereco do ponteiro do primeiro elemento
	sw	$t0, 8($sp)		# Inteiro a ser adicionado na lista
	jal	ins_ult_el		# Chamada da funcao insere ultimo elemento
	addiu	$sp, $sp, 12		# Desaloca espaco na pilha
	
	# Somatorio de todos elementos da Lista = 10 + 20 + 30 + 40 + 50 + 50 + 50
	addiu	$sp, $sp, -12		# Aloca espaco para 3 dados na pilha
	sw	$zero, 0($sp)		# Endereco de retorno no topo da pilha
	sw	$fp, 4($sp)		# Endereco do ponteiro do primeiro elemento
	sw	$zero, 8($sp)		# Zera para receber o retorno
	jal	soma_val		# Chamada da funcao insere ultimo elemento
	lw	$t1, 8($sp)		# Recupera resultado do somatorio		
	addiu	$sp, $sp, 12		# Desaloca espaco na pilha
	
	# Imprimi somatorio = 250
	la	$a0, TEXTO		# Carrega o endereco da string que vai ser exibida 
	li	$a1, 4			# Carrega o syscall para exibicao de string
	jal	imprimir		# Requisita ao usuario 
	move	$a0, $t1		# Carrega o somatorio para exibicao
	li	$a1, 1			# Carrega syscall para exibicao de inteiro
	jal	imprimir		# Imprimi o somatorio
	
# Finaliza o programa
exit:
	li	$v0, 10
	syscall

##################################################################### 
# Funcao imprimir	$a0 - Mensagem | $a1 - Syscall 
##################################################################### 
imprimir:
	move	$v0, $a1		# Carrega o Syscall passado pelo $a1
	syscall
	jr	$ra

##################################################################### 
# Funcao ins_ult_el	0($sp) - $ra | 4($sp) - apontador do elemento | 8($sp) - dado 
##################################################################### 
ins_ult_el:
	lw	$s0, 0($sp)		# Carrega o endereco do RA
	beq	$s0, $zero, cap_ra_ins	# Caso RA nao tenha sido capturado salta para capturar

# Verifica se o apontador do elemento ja possui dado associado ao endereco
main_ins:
	lw	$s1, 4($sp)		# Carrega o endereco do apontador da lista
	lw	$s2, 0($s1)		# Carrega o dado na posicao
	beq	$s2, $zero, ins_el	# Verifica se exite dado na posicao : salta para inserir 
	addiu	$s1, $s1, 4		# Incrementa o apontador para o proximo item
	sw	$s1, 4($sp)		# Atualiza o endereco do proximo elemento na pilha
	
	jal	ins_ult_el		# Chama a funcao novamente

# Insere o elemento e gera endereco para o proximo
ins_el:
	lw	$s4, 8($sp)		# Carrega o dado a ser inserido
	sw	$s4, 0($s1)		# Adiciona o dado na lista
	addiu	$s1, $s1, 4		# Endereco para o proximo elemento
	addiu	$s2, $s1, 4		# Gera o endereco do proximo elemento
	sw	$s2, 0($s1)		# Salva o endereco para proximo elemento
	j	end_ins			# Salta finalizar a funcao
	
# Captura o RA	
cap_ra_ins:
	sw	$ra, 0($sp)		# Salva o RA para retornar
	j	main_ins		# Retorna para a funcao

# Finaliza a chamada da funcao
end_ins:
	lw	$ra, 0($sp)		# Recupera o endereco da proxima instrucao
	jr	$ra			# Retorna para o programa principal


##################################################################### 
# Funcao soma_val	0($sp) - $ra | 4($sp) - apontador do elemento | 8($sp) - retorno 
##################################################################### 
soma_val:
	lw	$s0, 0($sp)		# Carrega o endereco do RA
	beq	$s0, $zero, cap_ra_soma	# Caso RA nao tenha sido capturado salta para capturar
	
# Verifica se existe elemento e adiciona ao retorno
main_soma:
	lw	$s1, 4($sp)		# Carrega o endereco do apontador da lista
	lw	$s2, 0($s1)		# Carrega o dado na posicao
	lw	$s3, 8($sp)		# Carrega o endereco do somatorio
	addu	$s3, $s3, $s2		# Soma o dado carregado com o somatorio
	beq	$s2, $zero, end_soma	# Verifica se exite dado na posicao : salta para finalizar
	sw	$s3, 8($sp)		# Armazena o somatorio na pilha
	addiu	$s1, $s1, 8		# Incrementa o apontador para o proximo item
	sw	$s1, 4($sp)		# Atualiza o endereco do proximo elemento na pilha
	
	jal	soma_val		# Chama a funcao novamente

# Captura o RA	
cap_ra_soma:
	sw	$ra, 0($sp)		# Salva o endereco da proxima instrucao
	j	main_soma		# Retorna para a funcao

# Finaliza a chamada da funcao
end_soma:
	lw	$ra, 0($sp)		# Recupera o endereco da proxima instrucao
	jr	$ra			# Retorna para o programa principal
