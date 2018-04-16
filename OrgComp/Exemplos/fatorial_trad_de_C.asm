# 
# Autor: Ney Calazans
# 
#	O objetivo deste programa é mostrar o uso de instruções do MIPS
#	para realizar chamadas de subrotinas a partir de um programa.
#	  Trata-se de usar as estruturas e convenções disponibilizadas
#	para realizar as tarefas de passagem de argumentos e de recepção de
#	valores de retorno de subrotinas ou funções por um programa que a chama.
#	  Estas convenções são o uso dos registradores $a0 a $a3 para 
#	passagem de argumentos para funções/subrotinas e retorno de valores
#	através dos registradores $v0 ou $v1.
#	  Especificamente nesta implementação usa-se $a0 para passagem do
#	parâmetro (argumento) da subrotina e $v0 para retornar o valor desta.
#	Adicionalmente, usa-se a pilha apontada por $sp apenas para salvar
#	o contexto de controle de execução (o valor do $ra).
#	  Além disto, introduz-se a forma de programar o uso de estruturas
#	de pilha em memória para armazenar uma  sequência de endereços
#	de retorno resultante do uso de chamadas aninhadas de subrotinas
#	ou funções. Usa-se o registrador $sp do MIPS para gerenciar a pilha
#
#	  O programa principal corresponde à tradução do código C abaixo,
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
		li	$sp,0x7fffeffc		# Inicialização do apontador de pilha (desnecessário no MARS)
		la 	$t0,n

		lw	$a0,0($t0)		# Prepara registrador de argumento ($a0) com valor de n
		addi	$sp,$sp,-4 		# Aloca espaço na pilha e salva valor de retorno para o SO
		sw	$ra,0($sp)		# Empilha endereço de retorno para o SO
		jal	fatorial		# Executa chamada de fatorial(n)
		lw	$ra,0($sp) 		# Recupera endereço de retorno para o SO
		addi 	$sp,$sp,4 		# Desaloca espaço de pilha não mais necessário

		la 	$t0, x			# Obtém endereço de x
		sw 	$v0,0($t0)		# Escreve fatorial(n) em x

		li 	$a0,5			# Gera a constante 5 em $a0
		la 	$t0,x			# Lê valor de x para $t1
		lw 	$t1,0($t0)		#

		add 	$a0,$a0,$t1		# Gera 5+x em $a0
		addi 	$sp,$sp,-4 		# Aloca espaço na pilha e salva valor de retorno para o SO
		sw	$ra,0($sp)		# Empilha endereço de retorno para o SO
		jal 	fatorial		# Executa chamada de fatorial(5+x)
		lw 	$ra,0($sp) 		# Recupera endereço de retorno para o SO
		addi 	$sp,$sp,4 		# Desaloca espaço de pilha não mais necessário

		la 	$t0,z			# Obtém endereço de z
		sw 	$v0,0($t0)		# Escreve fatorial(5+x) em z

		li 	$v0,10			# Sai do programa principal
		syscall

#
#	Texto em linguagem de montagem para a função fatorial
#
fatorial:
		addi 	$t0,$zero,1		# Gera-se a constante 1 em $t0
		beq 	$a0,$t0,menouig1	# Se argumento da rotina=1, pula
		slt 	$t1,$a0,$t0		# Senão, se argumento < 1, pula
		bne 	$t1,$zero,menouig1	#      

		addi 	$a0,$a0,-1		# Senão, prepara $a0 com n-1 p/ chamada recursiva
		addi 	$sp,$sp,-4		# Aloca espaço na pilha e salva
		sw 	$ra,0($sp)		# endereço de retorno
		jal 	fatorial		# Realiza chamada recursiva 	
		lw 	$ra,0($sp)		# Recupera endereço de retorno
		addi 	$sp,$sp,4 		# Desaloca espaço de pilha não mais necessário

		addi 	$a0,$a0,1		# MUTRETA: Recupera valor do argumento
						# Só funciona porque sabemos que $a0 não é alterado
						# durante a recursão
						
		mult 	$v0,$a0			# Multiplica a*fatorial(a-1), colocando resultado em Hi & Lo
		mflo 	$v0			# Recupera para $v0 a parte baixa do resultado da multiplicação
		jr 	$ra			# Retorna para quem chamou
menouig1:
		addi 	$v0,$zero,1		# Folha da recursão, retorna constante 1 em $v0
		jr 	$ra			# E retorna para quem chamou
