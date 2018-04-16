# MIPS assembly language example: Arithmetic operations
# Author:  Ney Calazans
# Function: This program applies an algorithm of successive subtractions
#		to perform the integer division of two positive numbers.
#
#   Examplo de divisão de 10 por 3 com subtrações successivas:
#   [Dividendo] [Divisor]  [Dividendo-Divisor]  Contador 
#	10	3		7		1 
#	7	3		4		2 
#	4	3		1		3 
#	d1	d2		resto		quociente
#
#       quociente:   3
#       resto: 1
#
	.text
		.globl main

main:	la	$t0,divisor	# 
	lw	$t0,0($t0)	# coloca valor do divisor em $t0
	la	$t1,dividendo	#
	lw	$t1,0($t1)	# coloca valor do dividendo em $t1
	li	$t2,0		# $t2 conterá o quociente da divisão

laco:	subu	$t1,$t1, $t0	# subtrai divisor do dividendo
	bltz	$t1,end		# se menor que 0, acabou, vai desfazer última subtração
	addiu	$t2,$t2, 1	# senão, incrementa quociente 
	j	laco		# 	e continua a subtrair

end:	addu	$t1,$t1,$t0	# recupera o valor correto do resto,
				# pois só quando negativo o laco termina
	la	$t3,quociente	#
	sw	$t2,0($t3)	# escreve valor do quociente na memória
	la	$t3,resto	#
	sw	$t1,0($t3)	# escreve valor do resto na memória

# Fim de trabalhos, retorna do programa
	li	$v0,10
	syscall	

		.data
        
dividendo:	.word	0xFAAA	# Base 10: 64170 
divisor:	.word	0x83	# Base 10: 131

quociente:	.word	0	# resposta deve ser: 489 (0x1E9)
resto:		.word	0	# resposta deve ser: 111 (0x6f)