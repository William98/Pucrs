# 
# Autor: Ney Calazans
# 
#	O objetivo deste programa � mostrar o uso de instru��es do MIPS
#	para realizar chamadas de subrotinas a partir de um programa.
#	  Trata-se de usar as estruturas e conven��es disponibilizadas
#	para realizar as tarefas de passagem de argumentos e de recep��o de
#	valores de retorno de subrotinas ou fun��es por um programa que a chama.
#	  Estas conven��es s�o o uso dos registradores $a0 a $a3 para 
#	passagem de argumentos para fun��es/subrotinas e retorno de valores
#	atrav�s dos registradores $v0 ou $v1.
#	  Especificamente nesta implementa��o usa-se $a0 para passagem do
#	par�metro (argumento) da subrotina e $v0 para retornar o valor desta.
#	Adicionalmente, usa-se a pilha apontada por $sp apenas para salvar
#	o contexto de controle de execu��o (o valor do $ra).
#	  Al�m disto, introduz-se a forma de programar o uso de estruturas
#	de pilha em mem�ria para armazenar uma  sequ�ncia de endere�os
#	de retorno resultante do uso de chamadas aninhadas de subrotinas
#	ou fun��es. Usa-se o registrador $sp do MIPS para gerenciar a pilha
#
#	  O programa principal corresponde � tradu��o do c�digo C abaixo,
#	que escreve o fatorial de 3 (6) em x e o fatorial de 11 (39.916.800
#	ou 0x02611500) em z.
#
#		main()
#		{
#			int n=3;
#			int x, z;
#	
#			x = fatorial (n);
#			z = fatorial (5+x);
#		}
#		int fatorial (int a)
#		{	if (a<=1) return (1); else return (a*fatorial(a-1)); }
#
		.data
n:		.word	3
x:		.space	4
z:		.space	4

		.text
		.globl	main
main: 	
		li	$sp,0x7fffeffc		# Inicializa��o do apontador de pilha (desnecess�rio no MARS)
		la 	$t0,n

		lw	$a0,0($t0)		# Prepara registrador de argumento ($a0) com valor de n
		addi	$sp,$sp,-4 		# Aloca espa�o na pilha e salva valor de retorno para o SO
		sw	$ra,0($sp)		# Empilha endere�o de retorno para o SO
		jal	fatorial		# Executa chamada de fatorial(n)
		lw	$ra,0($sp) 		# Recupera endere�o de retorno para o SO
		addi 	$sp,$sp,4 		# Desaloca espa�o de pilha n�o mais necess�rio

		la 	$t0, x			# Obt�m endere�o de x
		sw 	$v0,0($t0)		# Escreve fatorial(n) em x

		li 	$a0,5			# Gera a constante 5 em $a0
		la 	$t0,x			# L� valor de x para $t1
		lw 	$t1,0($t0)		#

		add 	$a0,$a0,$t1		# Gera 5+x em $a0
		addi 	$sp,$sp,-4 		# Aloca espa�o na pilha e salva valor de retorno para o SO
		sw	$ra,0($sp)		# Empilha endere�o de retorno para o SO
		jal 	fatorial		# Executa chamada de fatorial(5+x)
		lw 	$ra,0($sp) 		# Recupera endere�o de retorno para o SO
		addi 	$sp,$sp,4 		# Desaloca espa�o de pilha n�o mais necess�rio

		la 	$t0,z			# Obt�m endere�o de z
		sw 	$v0,0($t0)		# Escreve fatorial(5+x) em z

		li 	$v0,10			# Sai do programa principal
		syscall

#
#	Texto em linguagem de montagem para a fun��o fatorial
#
fatorial:
		addi 	$t0,$zero,1		# Gera-se a constante 1 em $t0
		beq 	$a0,$t0,menouig1	# Se argumento da rotina=1, pula
		slt 	$t1,$a0,$t0		# Sen�o, se argumento < 1, pula
		bne 	$t1,$zero,menouig1	#      

		addi 	$a0,$a0,-1		# Sen�o, prepara $a0 com n-1 p/ chamada recursiva
		addi 	$sp,$sp,-4		# Aloca espa�o na pilha e salva
		sw 	$ra,0($sp)		# endere�o de retorno
		jal 	fatorial		# Realiza chamada recursiva 	
		lw 	$ra,0($sp)		# Recupera endere�o de retorno
		addi 	$sp,$sp,4 		# Desaloca espa�o de pilha n�o mais necess�rio

		addi 	$a0,$a0,1		# MUTRETA: Recupera valor do argumento
						# S� funciona porque sabemos que $a0 n�o � alterado
						# durante a recurs�o
						
		mult 	$v0,$a0			# Multiplica a*fatorial(a-1), colocando resultado em Hi & Lo
		mflo 	$v0			# Recupera para $v0 a parte baixa do resultado da multiplica��o
		jr 	$ra			# Retorna para quem chamou
menouig1:
		addi 	$v0,$zero,1		# Folha da recurs�o, retorna constante 1 em $v0
		jr 	$ra			# E retorna para quem chamou
