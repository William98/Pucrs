##################################################################### 
# Autor: Lucas Ribeiro
# 
#	O objetivo deste programa é criar uma lista encadeada
#	com conteúdos requisitados, retirados de um
#	vetor linear (Vetor) com uma determinada quantidade de 
#	elementos (Size), que definirá o tamanho inicial da lista.
#

.data
head:		.word	0
texto_1:	.asciiz "Informe o numero que deseja inserir na lista?"
texto_2:	.asciiz "Somatorio da lista:"
        
.text   
.globl	main            

main:
	la	$t0, head
	lw	$t0, 0($t0)
	li	$fp, 0x10040000		# Inicializa o topo de heap
		
	la	$a0, texto_1		# Carrega o endereço da string que vai ser exibida 
	li	$a1, 4			# Carrega o syscall para exibição de string
	jal	f_imprimir		# Requisita ao usuário 
	li	$v0, 5			# Preparo programa para capturar valor
	syscall				# Chamada do sistema para receber inteiro
	addiu	$sp, $sp, -12		# Aloca 3 posições na pilha para guardar [head, dado, retorno]
	sw	$t0, 0($sp)		# Endereço do primeiro elemento da fila
	sw	$v0, 4($sp)		# Valor capturado a ser inserido
	sw	$zero, 8($sp)		# Endereço de retorno da funcão
	jal	ins_ult_el		# Chamada da função insere ultimo elemento
	# recuperar dados
	
	addiu	$sp, $sp, 12		# Desaloca espaço na pilha	
	la	$a0, texto_1		# Carrega o endereço da string que vai ser exibida 
	li	$a1, 4			# Carrega o syscall para exibição de string
	jal	f_imprimir		# Requisita ao usuário 
	li	$v0, 5			# Preparo programa para capturar valor
	syscall				# Chamada do sistema para receber inteiro
	addiu	$sp, $sp, -12		# Aloca 3 posições na pilha para guardar [head, dado, retorno]
	sw	$t0, 0($sp)		# Endereço do primeiro elemento da fila
	sw	$v0, 4($sp)		# Valor capturado a ser inserido
	sw	$zero, 8($sp)		# Endereço de retorno da função
	jal	ins_ult_el		# Chamada da função insere ultimo elemento
	# recupera dados
	
	addiu	$sp, $sp, 12		# Desaloca espaço na pilha	

	la	$a0, texto_2		# Carrega o endereço da string que vai ser exibida 
	li	$a1, 4			# Carrega o syscall para exibição de string
	jal	f_imprimir		# Requisita ao usuário 
	addiu	$sp, $sp, -12		# Aloca 3 posições na pilha para guardar [head, soma, retorno]
	sw	$t0, 0($sp)		# Endereço do primeiro elemento da fila
	sw	$zero, 8($sp)		# Endereço de retorno da função
	jal	soma_val		# Chamada da função soma valores
	lw	$a0, 4($sp)		# Carrega o somatorio para exibição
	li	$a1, 1			# Carrega syscall para exibição de inteiro
	jal	f_imprimir		# Imprimi o somatório
	
	addiu	$sp, $sp, 12		# Desaloca espaço na pilha       
exit:
	li	$v0, 10			# Finaliza o programa
	syscall
                    
#########################################################################
# Recebe a mensagem em $a0 e o tipo de Syscall em $a1
f_imprimir:
	move	$v0, $a1		# Carrega o Syscall passado pelo $a1
	syscall
	jr	$ra	
       
##########################################################################
# Recebe         
ins_ult_el:				# funcao que adiciona um elemento ao final da lista
	# Código 
	lw	$s0, 8($sp)		# Obtenho o valor do RA
	blez	$s1, cap_ra_ins		# Caso seja primeira chamada da função ele salta para capturar o RA
main_ins:
	lw	$s1, 0($sp)		# Capturo o endereço do Head da lista
	blez	$s1, prim		# Verifica se existe um valor na primeira posição
	

cap_ra_ins:
	sw	$ra, 8($sp)		# Capturo o $ra
	j	main_ins		# Retorno para a função

prim:
	# Código
	move	$t0, $fp		# Armazena o endereço no HEAD
	lw	$s0, 4($sp)		# Obtem o elemento a ser inserido
	sw	$s0, 0($t0)		# Salvo o elemento na primeira posição
	# Adicionar mais 8 para criar referencia para o proximo
	j	end_ins			# Após inserir finaliza a função

end_ins:
	lw	$ra, 8($sp)		# Carrega o endereço da proxima instrução depois da função
	jr	$ra			# Retorna para o programa principal

##########################################################################
# Recebe         
soma_val:				# funcao que realiza o somatorio de elemento da lista
        # Código       
        lw	$s0, 8($sp)		# Obtenho o valor do RA
        blez	$s0, cap_ra_soma	# Caso seja primeira chamada da função ele salta para capturar o RA
main_soma:
	# Código
cap_ra_soma:
	sw	$ra, 8($sp)		# Capturo o $ra
	j	main_soma		# Retorno para a função

end_soma:
	#sw	$reg_soma, 4($sp)	# Salva o somatorio na pilha
	lw	$ra, 8($sp)		# Carrega o endereço da proxima instrução depois da função
	jr	$ra			# Retorna para o programa principal
