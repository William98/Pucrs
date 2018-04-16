# Data da �ltima altera��o: 05/05/2017
# Subrotinas aninhadas
# Author: Fernando Gehm Moraes
# Modified by: Ney Calazans
#
# Coment�rio: Trata-se de uma implementa��o em linguagem de montagem do
#	MIPS do programa C abaixo. Serve como exemplo de estrutura��o de
#	programas em linguagem de montagem do MIPS para dar suporte a
#	chamadas aninhadas de subrotina.
#
# Conven��es seguidas:
#	1) Todos os argumentos (par�metros) das subrotinas envolvidas
#	s�o passados via pilha apontada pelo registrador $sp.
#	2) No topo da pilha sempre encontra-se salvo o endere�o de
#	retorno para quem chamou a entidade que alocou espa�o por �ltimo
#	nesta.
#	3) O retorno de resultados de execu��o de fun��es sempre ser� 
#	colocado na posi��o imediatamente abaixo do topo da pilha,
#	sobrescrevendo o primeiro argumento que a fun��o/programa 
#	recebeu.
#
# C�digo fonte C equivalente ao implementado em linguagem de montagem:
#    main()
#    {
#		int var_a=0x00AA0000;
#		int var_b=0x0000BB00;
#		int var_c=0x000000CC;
#		int var_x=0;
#
#		x = soma3(var_a,var_b,var_c);
#    }
#
#    int soma3(int x, int y, int z)
#    {
#      return(soma(z,soma(x,y)));
#    }
#
#    int soma(int x1, int x2)
#    {
#      return(x1+x2);
#    }
#
        .text   
        .globl  main            # Declara r�tulo main como ponto de entrada
main:   
        la      $t1, var_a      # inicializa as vari�veis
        lw      $t1, 0($t1)	# $t1 cont�m a
        la      $t2, var_b
        lw      $t2, 0($t2)	# $t2 cont�m b
        la      $t3, var_c
        lw      $t3, 0($t3)	# $t3 cont�m c

        addiu   $sp,$sp,-16     # aloca 4 posi��es na pilha
        sw      $t3,12($sp)     # empilha c
        sw      $t1, 4($sp)	# empilha a
        sw      $t2, 8($sp)	# empilha b
        sw      $ra, 0($sp)	# empilha o endere�o de retorno par ao SO

        jal     soma3		# pula para subrotina soma3, guardando em $ra o endere�o da linha abaixo

        lw      $ra,0($sp)      # ao voltar, recupera endere�o de retorno da pilha
        lw      $v1,4($sp)      # resultado da soma3 � recuperado da pilha e colocado em $v1
        addiu   $sp,$sp,16      # libera as 4 posi��es alocadas
        
	la	$t0,var_x	# recupera endere�o de x
	sw	$v1,0($t0)	# escreve resultado na mem�ria
		
		# Acabou o programa. 
end:	li	$v0,10		# Chamada do sistema para sair do programa
		syscall		# Sai do programa!

#
#    int soma3(int x, int y, int z)
#    {
#      return(soma(z,soma(x,y)));
#    }
#
soma3:  lw      $t0, 4($sp)
        lw      $t1, 8($sp)     # l� da pilha dois par�metros
        
        addiu $sp,$sp,-12       # aloca 3 posi��es na pilha
        sw      $t1, 8($sp)	# empilha y
        sw      $t0, 4($sp)	# empilha x
        sw      $ra, 0($sp)	# empilha o endere�o de retorno para quem chamou
        
        jal     soma		# pula para subrotina soma (chamada soma(x, y)),
        				# guardando em $ra o endere�o da linha abaixo
        lw      $ra,0($sp)      # ao voltar, recupera endere�o de retorno da pilha
        lw      $t0,4($sp)      # *** resultado de soma(x, y) � recuperado da pilha
        addiu   $sp,$sp,12      # libera as 3 posi��es alocadas para a pilha
        
        lw      $t1, 12($sp)    # ***  pega o antigo terceiro par�metro
        
        addiu   $sp,$sp,-12     # aloca 3 posi��es na pilha
        sw      $t0,8($sp)	# empilha resultado de soma(x, y)
        sw      $t1,4($sp)      # empilha z
        sw      $ra,0($sp)	# empilha o endere�o de retorno para quem chamou
        
        jal     soma		# pula para subrotina soma (chamada soma(z, soma(x, y))),
        				# guardando em $ra o endere�o da linha abaixo
        lw      $ra,0($sp)      # ao voltar, recupera endere�o de retorno da pilha
        lw      $t0,4($sp)      # *** resultado de soma(z, soma(x, y)) � recuperado da pilha
        addiu   $sp,$sp,12      # libera as 3 posi��es alocadas        

        sw      $t0,4($sp)      # coloca resposta na pilha e
	
	jr	$ra		# fim da subrotina soma3

#
#    int soma(int x1, int x2)
#    {
#      return(x1+x2);
#    }
#
soma:   lw      $t7,4($sp)
        lw      $t8,8($sp)	# l� da pilha dois par�metros, x1 e x2
        
        addu    $t7,$t7,$t8	# faz a soma
        
        sw      $t7,4($sp) 	# coloca resposta na pilha,
        jr      $ra		# e volta. Notar que esta subrotina, 
        				# por ser folha, n�o salva o $ra na pilha
        
        .data                   
var_a:  .word   0x00AA0000      
var_b:  .word   0x0000BB00           
var_c:  .word   0x000000CC           
var_x:	.word	0














