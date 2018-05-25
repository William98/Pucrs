##################################################################### 
# Autor: Lucas Ribeiro
# 
#	O objetivo deste programa � criar uma lista encadeada
#	com conte�dos requisitados, retirados de um
#	vetor linear (Vetor) com uma determinada quantidade de 
#	elementos (Size), que definir� o tamanho inicial da lista.
#

.data
head:		.word	0
texto_1:	.asciiz "Informe o numero que deseja inserir na lista?"
texto_2:	.asciiz "Somatorio da lista:"
        
.text   
.globl	main            

main:
	la	$t0, head
	li	$fp, 0x10040000		# Inicializa o topo de heap
		
	la	$a0, texto_1		# Carrega o endere�o da string que vai ser exibida 
	li	$a1, 4			# Carrega o syscall para exibi��o de string
	jal	f_imprimir		# Requisita ao usu�rio 
	li	$v0, 5			# Preparo programa para capturar valor
	syscall				# Chamada do sistema para receber inteiro
	addiu	$sp, $sp, -12		# Aloca 3 posi��es na pilha para guardar [head, dado, retorno]
	sw	$t0, 0($sp)		# Endere�o do primeiro elemento da fila
	sw	$v0, 4($sp)		# Valor capturado a ser inserido
	sw	$zero, 8($sp)		# Endere�o de retorno da func�o
	jal	ins_ult_el		# Chamada da fun��o insere ultimo elemento
	# recuperar dados
	
	addiu	$sp, $sp, 12		# Desaloca espa�o na pilha	
	la	$a0, texto_1		# Carrega o endere�o da string que vai ser exibida 
	li	$a1, 4			# Carrega o syscall para exibi��o de string
	jal	f_imprimir		# Requisita ao usu�rio 
	li	$v0, 5			# Preparo programa para capturar valor
	syscall				# Chamada do sistema para receber inteiro
	addiu	$sp, $sp, -12		# Aloca 3 posi��es na pilha para guardar [head, dado, retorno]
	sw	$t0, 0($sp)		# Endere�o do primeiro elemento da fila
	sw	$v0, 4($sp)		# Valor capturado a ser inserido
	sw	$zero, 8($sp)		# Endere�o de retorno da fun��o
	jal	ins_ult_el		# Chamada da fun��o insere ultimo elemento
	# recupera dados
	
	addiu	$sp, $sp, 12		# Desaloca espa�o na pilha
	la	$a0, texto_1		# Carrega o endere�o da string que vai ser exibida 
	li	$a1, 4			# Carrega o syscall para exibi��o de string
	jal	f_imprimir		# Requisita ao usu�rio 
	li	$v0, 5			# Preparo programa para capturar valor
	syscall				# Chamada do sistema para receber inteiro
	addiu	$sp, $sp, -12		# Aloca 3 posi��es na pilha para guardar [head, dado, retorno]
	sw	$t0, 0($sp)		# Endere�o do primeiro elemento da fila
	sw	$v0, 4($sp)		# Valor capturado a ser inserido
	sw	$zero, 8($sp)		# Endere�o de retorno da func�o
	jal	ins_ult_el		# Chamada da fun��o insere ultimo elemento
	# recuperar dados
	
	addiu	$sp, $sp, 12		# Desaloca espa�o na pilha
	la	$a0, texto_2		# Carrega o endere�o da string que vai ser exibida 
	li	$a1, 4			# Carrega o syscall para exibi��o de string
	jal	f_imprimir		# Requisita ao usu�rio 
	addiu	$sp, $sp, -12		# Aloca 3 posi��es na pilha para guardar [head, soma, retorno]
	sw	$t0, 0($sp)		# Endere�o do primeiro elemento da fila
	sw	$zero, 8($sp)		# Endere�o de retorno da fun��o
	jal	soma_val		# Chamada da fun��o soma valores
	lw	$a0, 4($sp)		# Carrega o somatorio para exibi��o
	li	$a1, 1			# Carrega syscall para exibi��o de inteiro
	jal	f_imprimir		# Imprimi o somat�rio
	
	addiu	$sp, $sp, 12		# Desaloca espa�o na pilha       
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
	# Codigo 
	lw	$s0, 8($sp)		# Obtenho o valor do RA
	blez	$s0, cap_ra_ins		# Caso seja primeira chamada da fun��o ele salta para capturar o RA
main_ins:
	lw	$s1, 0($sp)		# Capturo o endere�o do Head da lista
	lw	$s2, 4($sp)		# Capturo o valor a ser inserido
	beq	$s1, $zero, prim_el	# Verifica se existe um valor na primeira posi��o
loop:	
	move	$s3, $s1		# Carrego endereço do apontador
	lw	$s4, 0($s3)		# Carrego o dado do endereço
	beq	$s4, $zero, ins_el	# Se o valor na posicao for zero insere elemento
	addiu	$s3, $s3, 4		# Incrementa 4 o endereço do apontador
	sw	$s3, 0($sp)		# Carrego na pilha o endereço do proximo item 
	jal	ins_ult_el		# Salto para o inicio da fila
ins_el:
	addiu	$s3, $s3, 4		# Incrementa a posicao do apontador 
	addiu	$s4, $s3, 4		# Incrementa a posicao do dado
	sw	$s3, 0($s4)		# Cria o apontador para o proximo
	sw	$s2, 0($s3)		# Armazeno o valor
	
	j	end_ins
prim_el:
	move	$t0, $fp		# Armazena o endere�o no HEAD
	sw	$s2, 0($t0)		# Salvo o elemento na primeira posi��o
	addiu	$s3, $fp, 4		# Obtem o endereço do apontador	
	addiu	$s4, $fp, 8		# Obtem o endereço do dado
	sw	$s4, 0($s3)		# Salva o endereço do dado no apontador
	j	end_ins			# Ap�s inserir finaliza a fun��o

cap_ra_ins:
	sw	$ra, 8($sp)		# Capturo o $ra
	j	main_ins		# Retorno para a fun��o
	
end_ins:
	lw	$ra, 8($sp)		# Carrega o endere�o da proxima instru��o depois da fun��o
	jr	$ra			# Retorna para o programa principal

##########################################################################
# Recebe         
soma_val:				# funcao que realiza o somatorio de elemento da lista
        # C�digo       
        lw	$s0, 8($sp)		# Obtenho o valor do RA
        blez	$s0, cap_ra_soma	# Caso seja primeira chamada da fun��o ele salta para capturar o RA
main_soma:
	# C�digo
cap_ra_soma:
	sw	$ra, 8($sp)		# Capturo o $ra
	j	main_soma		# Retorno para a fun��o

end_soma:
	#sw	$reg_soma, 4($sp)	# Salva o somatorio na pilha
	lw	$ra, 8($sp)		# Carrega o endere�o da proxima instru��o depois da fun��o
	jr	$ra			# Retorna para o programa principal
