# 
#	Um programa que chama uma subrotina folha
# 	Author: Ney Laert Vilar Calazans
#
#    main()
#    {
#		int A=21;
#		int B=48;
#		int C;
#		
#		C = soma(A, B);
#		printf ("O resultado da soma é: %d",C);	
#    }
#
#    soma (int X, int Y)
#    {
#      return(X+Y);
#    }
		.data
A:		.word	21
B:		.word	48
C:		.word	0
texto:	.asciiz "O resultado da soma é: "

		.text
main:	la		$t0,A		# Coloca em $t0 o endereço de A
		lw		$a0,0($t0)	# Coloca em $a0 (argumento de chamada) o valor de A
		la		$t1,B		# Coloca em $t1 o endereço de B
		lw		$a1,0($t1)	# Coloca em $a1 (argumento de chamada) o valor de B

		la		$t1,soma	# Coloca endereço da subrotina em $t1
		jalr	$t0,$t1		# Salta para subrotina, salvando endereço da próxima
							# instrução em $t0
# Opções para a linha acima seriam
#1)
#		jal		soma		# Salta para subrotina, salvando endereço da próxima
#							# instrução em $ra (implicitamente referenciado)
#2)
#		jalr	$t1			# Salta para subrotina, salvando endereço da próxima
#							# instrução em $ra (implicitamente referenciado)
# Em ambos os casos, a instrução de retorno da subrotina deve ser trocada de
#		jr $t0	para jr $ra
# No caso da primeira opção a instrução "la $t1,soma" não é necessária. 

		li		$v0,4		# Carrega código de serviço impressão de cadeia no 
							# registrador de controle de syscall ($v0)
		la		$a0,texto	# Carrega endereço da cadeia no 
							# parâmetro de dados de syscall ($a0)
		syscall				# Chamada do Sistema em si
	
		li		$v0,1		# Carrega código de serviço impressão de inteiro no
							# registrador de controle de syscall ($v0)
		move	$a0,$v1		# Carrega valor a ser impresso no 
							# parâmetro de dados de syscall ($a0)
		syscall     		# Chamada do Sistema em si
                    
		li		$v0,10		# Carrega código de serviço sai do programa no
							# registrador de controle de syscall ($v0)
		syscall				# Chamada do Sistema em si

# 
#	Código da subrotina folha soma
# 	Author: Ney Laert Vilar Calazans
#
soma:	addu	$v1,$a0,$a1	# Realiza a soma dos argumentos e coloca resultado
							# no registrador de retorno de valor $v1
		jr		$t0			# Retorna para quem chamou. Se chamada foi
							# com jal ou jalr com uma argumento só, deve-se 
							# trocar "jr $t0" por "jr $ra"
