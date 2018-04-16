# 
# Autor: Ney Calazans e sua Turma de OrgComp EC
# 
#	Este programa ilustra a manipula��o de bits usando instru��es do MIPS.
#	A fun��o dele � contar quantas palavras de um vetor (Vetor) possuem os
#	bits 5-8 simultaneamente iguais a 1, escrevendo o n�mero de tais palavras
#	em uma vari�vel (ct_5_8_em1)
#

        .text   
        .globl	main            
        
main:	li	 $t0,0x01E0		# $t0 armazena a m�scara
						# para testar se bits 5-8=1111
					# em bin�rio a m�scara �:
					#	0000 0000 0000 0000 0000 0001 1110 0000
					# em hexa a m�scara �:
					#0x       0    0    1    0    0    1    E    0     
	la	$t1,Vetor		# $t1 cont�m ponteiro
						# para pr�ximo elemento do vetor
	la	$t2,tamvet		# $t2 cont�m n�mero
	lw	$t2,0($t2)			# de elementos ainda n�o tratados
	add	$t3,$zero,$zero		# $t3 � contador interno de elementos
						# com bits 5-8=1111		
loop:	beq	$t2,$zero,fim		# Testa se fim do tratamento (quando $t2=0)
	lw	$t4,0($t1)		# L� pr�ximo elemento do Vetor
	and	$t4,$t0,$t4		# Aplica a m�scara
	bne	$t4,$t0,nao_achei	# Se n�o achou 4 bits em 1, salta
	addiu	$t3,$t3,1		# Se achou, incrementa contador e continua
nao_achei:
	addi	$t1,$t1,4		# Aponta para pr�ximo elemento do Vetor
	addi	$t2,$t2,-1		# Decrementa o n�mero elementos a tratar
	j	loop			# Vai mais uma volta do la�o

fim:	la	$t5,ct_5_8_em1		# Ao final, escreve na mem�ria o 
	sw	$t3,0($t5)			# valor do contador, que est� em $t3
	
	li	$v0,10
	syscall				# E termina o programa
		
		.data
Vetor:			.word	1 35 899 2024 32767 0xccfffeaa -325
tamvet:			.word	7
ct_5_8_em1:		.word	0
       


