; Código Assembler gerado; Não é editável.
; Gerado por: GNUSim8085: http://www.gnusim8085.org/
 	 ;<sum-vector.asm>
 	 ; Este programa soma o valor de uma constante (const) ao valor de cada elemento do vetor array (Vet)
 	 ; Gerando um novo vetor array (VetS)
 	 ; Autores: Arthur D'Arisbo e Lucas Ribeiro
 	 
4200 C3 0B 042	 jmp start
 	 
 	 ;data
4203   19 20 2D 12 (4 bytes)	     Vet:	DB	19h, 20h, 2Dh, 12h	; Define Vetor de quatro posições com os valores <25, 32, 45, 18>
4207 <4 bytes>	 VetS:	DS	4h			; Define Vetor-Soma de quatro posições
 	 const:	EQU	10			; Define a constante a ser somada
 	 cont:	EQU	4			; Define a constante com o tamanho do Vetor
 	 
 	 ;code
420B 1E 04	 start:	mvi	E, cont		; Carrega o valor da constante cont no Reg E
 	 				; Cada end. mem. possui 16 bits assim ocupando dois registradores 
420D 21 03 042	 	lxi	H, Vet		; Carrega o end. mem. de Vet no Reg HL
4210 01 07 042	 	lxi	B, VetS		; Carrega o end. mem. de VetS no Reg BC
 	 				
 	 
4213 3E 00	 loop:	mvi	A, 0h		; Zera o Acumulador
4215 56	 	mov	D, m		; Move um elemento de Vet para o Reg D
 	 	
4216 C6 0A	 	adi	const		; Adiciona a constante const ao Acumulador
4218 82	 	add	D		; Adiciona o valor de Vet  
 	 	
4219 02	 	stax	B		; Armazena o valor do Acumulador no VetS
421A 1D	 	dcr	E		; Decrementa o contador cont 
421B CA 23 42	 	jz	done		; if E = 0 então salta para done
 	 
421E 23	 	inx	H		; Incrementa Vet
421F 03	 	inx	B		; Incrementa VetS	
4220 C3 13 42	 	jmp	loop		; Salta para loop
 	 
4223 76	 done:	hlt			; parada do programa
