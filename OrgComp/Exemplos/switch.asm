#
#  switch(k) {
#              case 0:   f = i + j; break;  
#              case 1:   f = g + h; break; 
#              case 2:   f = g - h; break;  
#              case 3:   f = i - j; break; 
#

.text
.globl main
main:
        li    $s0,  0     # f   
        li    $s1, 20     # g 
        li    $s2, 30     # h
        li    $s3, 40     # i 
        li    $s4, 50     # j 
        li    $s5,  1     # valor de k
        li    $t2,  4     # valor limite do case
        
        la    $t4, ixs
        
        slt   $t3, $s5, $zero     # $t3=1 se o k é menor que zero
        bne   $t3, $zero, Exit    # se não for igiual a zero (1) esta abaixo de zero  
        slt   $t3, $s5, $t2       # $t3=1 se o k é menor que 4
        beq   $t3, $zero, Exit

        addu  $t1,$s5, $s5
        addu  $t1,$t1, $t1        # multiplica o índice 'k' por 4
        
         
        addu  $t1,$t1,$t4         # carrega o endereço para o o switch salta
        lw    $t0, 0($t1)
        
        jr    $t0                 # salto para a posição do case

L0:     addu $s0, $s3, $s4
        j    Exit

L1:     addu $s0, $s1, $s2
        j    Exit
        
L2:     subu $s0, $s1, $s2
        j    Exit
        
L3:     subu $s0, $s3, $s4      
        
Exit:
	# The program is finished. Exit.
	li	$v0,10		# system call for exit
	syscall			# Exit!


########################################
# área de dados
########################################
        .data
ixs:    .word   L0 L1 L2 L3       # ponteiros para os rótulos





