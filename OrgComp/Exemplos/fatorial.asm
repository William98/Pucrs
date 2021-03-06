#
# MORAES - 23/agosto/2006
#
# Programa que calcula o fatorial de um n�mero inteiro sem sinal.
#	Chama a fun��o fact, que faz todo o trabalho
#	O argumento para fact � passado via o registrador de argumento
#	$a0. fact � uma fun��o recursiva. Ela retorna o resultado de
#	seu processamento no registrador de valor $v0.
#
# main()
# {
#		int num=3;
#		int result=0;
#		result = fact(num);
# }
#
# int fact (int n)
# {
#		if(n<1)
#		return 1;
#		return (n * fact (n - 1));
# }
#
#

.data
  num: 		.word 0x0a
  result:	.word 0

.text

  .globl main

main:	la	$t0,num
		lw	$a0,0($t0)	# $a0 cont�m o n�mero cujo fatorial deve ser calculado 
      
		addiu	$sp,$sp,-4	# Aloca espa�o na pilha para 1 palavra (4 bytes)
		sw	$ra,0($sp)	# Salva o $ra no topo da pilha
     
		jal	fact		# Chama a fun��o recursiva fact(num)
					# RESULTADO do fatorial deve retornar em $v0 
		lw	$ra,0($sp)	# Recupera o endere�o de retorno
		addiu	$sp,$sp, 4

		la	$t0,result	# escreve resultado na vari�vel
		sw	$v0,0($t0)	# result
		
		# The program is finished. Exit.
		li 	$v0, 10		# system call for exit
		syscall			# Exit!
		


fact:	addiu 	$sp,$sp,-8		# In�cio da fun��o fact. Aloca 8 bytes na pilha
		sw	$ra,0($sp)	# Salva o endere�o de retorno na pilha
		sw	$a0,4($sp)	# Salva o n�mero cujo fatorial se quer calcular na pilha
 		
		sltiu	$t0,$a0, 1	# $t0=1 se num<1 
		beq	$t0,$zero,rec	# Se num>=1 ($t0=0), continua recurs�o

		addiu	$v0,$zero,1	# Se est� no fim da recurs�o retorne fact(1)=1
		lw	$ra, 0($sp)	# Recupera o endere�o de retorno
		addiu	$sp,$sp,8	# esvazia a pilha
		jr	$ra		# RETORNA por aqui na folha da recurs�o.

rec:	addiu	$a0 $a0,-1		# Se n�o est� na folha da recurs�o, decrementa n
		jal	fact		# chama fact(num-1), RECURSIVAMENTE
		lw	$a0,4($sp)	# Na volta da recurs�o, recupera num
		lw	$ra,0($sp)	# recupera endere�o de retorno 
		addiu	$sp,$sp,8	# restaura a pilha
		multu	$v0, $a0	# multiplica  fact(num-1) ($v0) por num ($a0)
					# lembrar que resultado da multiplica��o vai para
					# registradores hi e lo. Aqui, despreza-se parte alta
		mflo	$v0		# Assume-se que hi=0 e usa-se apena lo como resultado
					# Assim, $v0 e lo cont�m fact(num)
		jr	$ra		# Retorna ao programa que chamou

