# --------------------------
# Alunos:
# --------------------------
.data
  ANOS:      .word 2018 2016 2014 2012 2010
	                 1980 1979 1978 1977 1976
							     1968 1966 1964 1962 1960
							     1948 1946 1944 1942 1940
  LINHA:     .word 4
  COLUNA:    .word 5
	COPA_CNT:  .word 0
	COPA_ANOS: .word 0 0 0 0 0
	OLIM_CNT:  .word 0
	OLIM_ANOS: .word 0 0 0 0 0
  TEXTO_1:   .asciiz "Qual linha deseja verificar?"
	TEXTO_2:   .asciiz "Total de Copas do Mundo: "
	TEXTO_3:   .asciiz "\nOs anos das Copas do Mundo foram: "
	TEXTO_4:   .asciiz "\nTotal de Olimpiadas: "
	TEXTO_5:   .asciiz "\nOs anos das Olimpiadas foram: "
	TEXTO_6:   .asciiz ","

.text
.globl  main

main:
  # Colocar aqui o seu codigo!
	li	  $v0, 10
	syscall
  jr    $ra

imprimir:
  # Colocar aqui o seu codigo!
  jr    $ra

f_copa:
  # Colocar aqui o seu codigo!
  jr   $ra

f_olimpiada:
	# Colocar aqui o seu codigo!
	jr   $ra
