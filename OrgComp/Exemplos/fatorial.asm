#
# MORAES - 23/agosto/2006
#
# Programa que calcula o fatorial de um número inteiro sem sinal.
#	Chama a função fact, que faz todo o trabalho
#	O argumento para fact é passado via o registrador de argumento
#	$a0. fact é uma função recursiva. Ela retorna o resultado de
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
		lw	$a0,0($t0)	# $a0 contém o número cujo fatorial deve ser calculado 
      
		addiu	$sp,$sp,-4	# Aloca espaço na pilha para 1 palavra (4 bytes)
		sw	$ra,0($sp)	# Salva o $ra no topo da pilha
     
		jal	fact		# Chama a função recursiva fact(num)
					# RESULTADO do fatorial deve retornar em $v0 
		lw	$ra,0($sp)	# Recupera o endereço de retorno
		addiu	$sp,$sp, 4

		la	$t0,result	# escreve resultado na variável
		sw	$v0,0($t0)	# result
		
		# The program is finished. Exit.
		li 	$v0, 10		# system call for exit
		syscall			# Exit!
		


fact:	addiu 	$sp,$sp,-8		# Início da função fact. Aloca 8 bytes na pilha
		sw	$ra,0($sp)	# Salva o endereço de retorno na pilha
		sw	$a0,4($sp)	# Salva o número cujo fatorial se quer calcular na pilha
 		
		sltiu	$t0,$a0, 1	# $t0=1 se num<1 
		beq	$t0,$zero,rec	# Se num>=1 ($t0=0), continua recursão

		addiu	$v0,$zero,1	# Se está no fim da recursão retorne fact(1)=1
		lw	$ra, 0($sp)	# Recupera o endereço de retorno
		addiu	$sp,$sp,8	# esvazia a pilha
		jr	$ra		# RETORNA por aqui na folha da recursão.

rec:	addiu	$a0 $a0,-1		# Se não está na folha da recursão, decrementa n
		jal	fact		# chama fact(num-1), RECURSIVAMENTE
		lw	$a0,4($sp)	# Na volta da recursão, recupera num
		lw	$ra,0($sp)	# recupera endereço de retorno 
		addiu	$sp,$sp,8	# restaura a pilha
		multu	$v0, $a0	# multiplica  fact(num-1) ($v0) por num ($a0)
					# lembrar que resultado da multiplicação vai para
					# registradores hi e lo. Aqui, despreza-se parte alta
		mflo	$v0		# Assume-se que hi=0 e usa-se apena lo como resultado
					# Assim, $v0 e lo contêm fact(num)
		jr	$ra		# Retorna ao programa que chamou

