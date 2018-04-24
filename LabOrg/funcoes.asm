.data
	ANOS:	.word 	2018 2016 2014 2012 2010	# 00 04 08 12 16
			1980 1979 1978 1977 1976	# 20 24 28 32 36
			1968 1966 1964 1962 1960	# 40 44 48 52 56
			1948 1946 1944 1942 1940	# 60 64 68 72 76
.text
.globl  main

main:
	li	$t1, 2018		# Ultimo ano de Copa do Mundo 
	li	$t2, 2020		# Ultimo ano de Olimpiadas

	la	$t0, ANOS		# Carrega endereço de ANOS
	lw	$t3, 0($t0)		# Carrega o primeiro ANO
	
	addiu	$t3, $t3, -2020
	#sub	$t4, $t1, $t3		# Copa - ANO
	
exit:
	li	$v0, 10
	syscall