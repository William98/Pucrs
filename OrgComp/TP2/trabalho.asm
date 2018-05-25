##################################################################### 
# Autor: Lucas Ribeiro

.data
	head:		.word	0

.text   
.globl	main

main:
	li	$fp, 0x10040000		# Inicializa o topo do heap 
	
	addiu	$sp, $sp, -12		# Aloca espaco para 3 dados na pilha
	
	li	$t0, 10			# Carrega 10
	sw	$zero, 0($sp)		# Endereco de retorno no topo da pilha
	sw	$fp, 4($sp)		# Endereco do ponteiro do primeiro elemento
	sw	$t0, 8($sp)		# Inteiro a ser adicionado na lista
	
	jal	ins_ult_el		# Chamada da funcao insere ultimo elemento
		
	addiu	$sp, $sp, 12		# Desaloca espaco na pilha
	

# Finaliza o programa
exit:
	li	$v0, 10
	syscall
	
# Funcao ins_ult_el
ins_ult_el:
	lw	$s0, 0($sp)		# Carrega o RA
	beq	$s0, $zero, cap_ra_ins	# Caso RA nao tenha sido capturado salta para capturar

main_ins:
	lw	$s1, 4($sp)		# Carrega o endereco do apontador da lista
	lw	$s2, 0($s1)		# Carrega o dado na posicao
	beq	$s2, $zero, ins_el	# Verifica se exite dado na posicao : salta para inserir 
	addiu	$s1, $s1, 4		# Incrementa o apontador para o proximo item
	sw	$s1, 4($sp)		# Atualiza o endereco do proximo elemento na pilha
	
	jal	ins_ult_el		# Chama a funcao novamente

ins_el:
	lw	$s4, 8($sp)		# Carrega o dado a ser inserido
	sw	$s4, 0($s1)		# Adiciona o dado na lista
	addiu	$s1, $s1, 4		# Endereco para o proximo elemento
	addiu	$s2, $s1, 4		# Gera o endereco do proximo elemento
	sw	$s1, 0($s2)		# Salva o endereco para proximo elemento
	j	end_ins			# Salta finalizar a funcao
	
# Captura o RA	
cap_ra_ins:
	sw	$ra, 0($sp)
	j	main_ins	

# Finaliza a chamada da funcao
end_ins:
	lw	$ra, 0($sp)
	jr	$ra