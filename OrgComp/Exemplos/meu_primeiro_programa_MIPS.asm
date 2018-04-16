# 
# Autor: Ney Calazans
# 
#	O objetivo deste programa � mostrar o uso mais b�sico da linguagem
#	de montagem do MIPS, atrav�s de um programa trivial que soma dois
#	n�meros quaisquer de 32 bits (A e B no programa) armazenados em 
#	mem�ria e coloca o resultado em uma terceira posi��o de mem�ria
#	(C no programa). 
#
#	Note-se que este programa extremamente simples j� serve para 
#	demonstrar v�rias das idiossincrasias de arquiteturas RISC, das quais
#	o MIPS � um exemplo cl�ssico. Entre estas, cita-se:
#
#	1) A obten��o de um endere�o de um dado em mem�ria n�o pode ser
#	feita de forma simples por uma instru��o. O montador SPIM supera 
#	esta limita��o provendo uma pseudo-instru��o (la, abreviatura de 
# 	"load address") que ser� por ele traduzida durante a gera��o do
#	c�digo objeto para instru��es da arquitetura MIPS que desempenham
#	este papel (em geral uma seq��ncia de duas instru��es, lui e ori)
#
#	2) O uso de endere�amento base-deslocamento para fazer acesso a
#	qualquer dado em mem�ria. N�o existem instru��es no MIPS que usem 
#	endere�amento direto para acesso a mem�ria, sendo necess�rio partir
#	de um endere�o base e especificar um deslocamento sobre este, que pode
#	obviamente simular endere�amento direto, se o deslocamento for 0.
#
#	3) O uso da instru��o syscall (chamada do sistema) para retornar
#	do programa. Syscall l� o conte�do do registrador $v0 e
#	dependendo do valor armazenado realiza alguma fun��o espec�fica. 
#	O valor 10 carregado em $v0 � um c�digo de servi�o que dita
#	que o programa deve ser finalizado.
#

        .text   
        .globl	main            
        
main:	la	$t0,A		# Carrega endere�o de A em $t0 - PSEUDO-INSTRU��O
	lw	$t0,0($t0)	# L� valor de A para $t0
	la	$t1,B		# Carrega endere�o de B em $t1 - PSEUDO-INSTRU��O
	lw	$t1,0($t1)	# L� valor de B para $t1
	addu	$t0,$t0,$t1	# $t0 recebe A+B
	la	$t2,C		# Carrega endere�o de C em $t2 - PSEUDO-INSTRU��O
	sw	$t0,0($t2)	# C recebe A+B

	li	$v0,10		# Gera c�digo (10) de fim de execu��o
	syscall			# Chamada do sistema para finalizar execu��o
		
	.data
A:	.word	32
B:	.word	0xffab3400
C:	.word	0
       


