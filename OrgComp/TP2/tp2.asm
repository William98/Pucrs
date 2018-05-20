##################################################################### 
# Autor: Lucas Ribeiro
# 
#	O objetivo deste programa é criar uma lista encadeada
#	com conteúdos requisitados, retirados de um
#	vetor linear (Vetor) com uma determinada quantidade de 
#	elementos (Size), que definirá o tamanho inicial da lista.
#

.data
somatorio:	.word	0
TEXTO_1:	.asciiz "Informe o numero que deseja inserir na lista? "
TEXTO_2:	.asciiz "Somatorio da lista: "
        
.text   
.globl	main            

main:
	la	$a0, TEXTO_1
	li	$a1, 4
	jal	f_imprimir		# Requisita ao usuário 
	li	$v0, 5			# Preparo programa para capturar valor
	syscall				# Chamada do sistema para receber inteiro
	

        
        
  
        

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

##########################################################################
# Recebe         
soma_val:				# funcao que realiza o somatorio de elemento da lista
                        



