# Data da �ltima altera��o: 05/05/2017
# Coment�rio: Programa que demonstra o uso de fun��es/subrotinas,
#	sem aninhamento de chamadas, em linguagem de montagem do
#	MIPS.
#	
# Conven��es seguidas:
#	1) Todos os argumentos (par�metros) da subrotina s�o passados
#	via registradores reservados para tal (no MIPS, $a0 a $a3)
#	2) O retorno do resultado de execu��o da fun��o se d� via
#	registradores reservados para tal (no MIPS, $v0 e $v1)
#	3) Entra-se na fun��o usando a instru��o jal e retorna-se
#	da fun��o usando a instru��o jr	$ra.

# C�digo fonte C equivalente ao implementado em linguagem de montagem:
#	main ()
#	{
#		int var_a=10;
#		int var_b=20;
#		int var_c=0;
#		
#		var_c = var_c+func(var_a,var_b);
#		var_c = var_c+func(var_c,var_b);
#	}
#	int func (int a, int b) {return (a+b);}
#
#	Conven��es: os argumentos e o valor de retorno
#	da fun��o func s�o passados por valor atrav�s de
#	registradores do MIPS. Especificamente, $a0 cont�m
#	o valor do argumento a, $a1 o valor do argumento b
#	e $v0 cont�m o valor de retorno da fun��o
#		
	.text
	.globl	main
main:	
#	c = c+func(a,b);
#
	la	$t0,var_a
	lw	$a0,0($t0)	# $a0 � inicializado com valor de var_a
	la	$t1,var_b
	lw	$a1,0($t1)	# $a1 � inicializado com valor de var_b
# Como argumentos est�o definidos, pode-se chamar func 
	jal	func		# pula para func, guarda
				# endere�o da pr�xima instru��o no registrador $ra
# No retorno de func, $v0 cont�m o resultado desta chamada, var_a+var_b=30.

# Agora, realiza-se a soma de var_c com valor retornado
	la	$t2,var_c
	lw	$t3,0($t2)	# $t3 cont�m valor inicial de var_c, 0
	addu	$t3,$t3,$v0	# var_c <-- 0+30 = 30
	sw	$t3,0($t2)	# escreve novo valor de var_c de
				# volta na mem�ria 

# Agora, prepara-se a segunda chamada
#		c = c+func(c,b);
#
	move	$a0,$t3		# pseudo que copia valor de 
				# var_c para $a0, argumento de nova chamada
	la	$t1,var_b
	lw	$a1,0($t1)	# $a1 � inicializado com valor de var_b
					# Note-se: o valor de var_b j�
					# estava em $a1, mas quem "garante" que
					# a chamada da  rotina n�o alterou ele?
					# Assim, repete-se a leitura de var_b, por seguran�a
	jal	func		# segunda chamada
# No retorno de func, $v0, cont�m o resultado desta chamada, 50.
	la	$t2,var_c	# por seguran�a, de novo, l�-se o valor de var_c da mem�ria
					# pois n�o se "sabe" se $t2 e/ou $t3 n�o foram
					# alterados pela chamada de func.
	lw	$t3,0($t2)	# $t3 cont�m valor atual de var_c, que � 30
	addu	$t3,$t3,$v0	# faz var_c <-- 30+50=80
	sw	$t3,0($t2)	# e escreve o novo valor em var_c (na mem�ria, claro!)
		
	li	$v0,10		# prepara fim do programa
	syscall			# fim do programa

#
#	Fun��o func:
#	
func:	addu	$v0,$a0,$a1	# soma argumentos e
				# gera valor de retorno
	jr	$ra		# volta para quem chamou

	.data
var_a:	.word	10
var_b:	.word	20
var_c:	.word	0
