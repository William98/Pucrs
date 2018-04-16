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
#		printf ("O resultado da soma �: %d",C);	
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
texto:	.asciiz "O resultado da soma �: "

		.text
main:	la		$t0,A		# Coloca em $t0 o endere�o de A
		lw		$a0,0($t0)	# Coloca em $a0 (argumento de chamada) o valor de A
		la		$t1,B		# Coloca em $t1 o endere�o de B
		lw		$a1,0($t1)	# Coloca em $a1 (argumento de chamada) o valor de B

		la		$t1,soma	# Coloca endere�o da subrotina em $t1
		jalr	$t0,$t1		# Salta para subrotina, salvando endere�o da pr�xima
							# instru��o em $t0
# Op��es para a linha acima seriam
#1)
#		jal		soma		# Salta para subrotina, salvando endere�o da pr�xima
#							# instru��o em $ra (implicitamente referenciado)
#2)
#		jalr	$t1			# Salta para subrotina, salvando endere�o da pr�xima
#							# instru��o em $ra (implicitamente referenciado)
# Em ambos os casos, a instru��o de retorno da subrotina deve ser trocada de
#		jr $t0	para jr $ra
# No caso da primeira op��o a instru��o "la $t1,soma" n�o � necess�ria. 

		li		$v0,4		# Carrega c�digo de servi�o impress�o de cadeia no 
							# registrador de controle de syscall ($v0)
		la		$a0,texto	# Carrega endere�o da cadeia no 
							# par�metro de dados de syscall ($a0)
		syscall				# Chamada do Sistema em si
	
		li		$v0,1		# Carrega c�digo de servi�o impress�o de inteiro no
							# registrador de controle de syscall ($v0)
		move	$a0,$v1		# Carrega valor a ser impresso no 
							# par�metro de dados de syscall ($a0)
		syscall     		# Chamada do Sistema em si
                    
		li		$v0,10		# Carrega c�digo de servi�o sai do programa no
							# registrador de controle de syscall ($v0)
		syscall				# Chamada do Sistema em si

# 
#	C�digo da subrotina folha soma
# 	Author: Ney Laert Vilar Calazans
#
soma:	addu	$v1,$a0,$a1	# Realiza a soma dos argumentos e coloca resultado
							# no registrador de retorno de valor $v1
		jr		$t0			# Retorna para quem chamou. Se chamada foi
							# com jal ou jalr com uma argumento s�, deve-se 
							# trocar "jr $t0" por "jr $ra"
