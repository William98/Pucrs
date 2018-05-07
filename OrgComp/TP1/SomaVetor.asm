;<sum-vector.asm>
; Este programa soma o valor de uma constante (const) ao valor de cada elemento do vetor array (Vet)
; Gerando um novo vetor array (VetS)
; Autores: Arthur D'Arisbo e Lucas Ribeiro

jmp start

;data
Vet:	DB	19h, 20h, 2Dh, 12h	; Define Vetor de quatro posições com os valores <25, 32, 45, 18>
VetS:	DS	4h			; Define Vetor-Soma de quatro posições
const:	EQU	10			; Define a constante a ser somada
cont:	EQU	4			; Define a constante com o tamanho do Vetor

;code
start:	mvi	E, cont		; Carrega o valor da constante cont no Reg E
				; Cada end. mem. possui 16 bits assim ocupando dois registradores 
	lxi	H, Vet		; Carrega o end. mem. de Vet no Reg HL
	lxi	B, VetS		; Carrega o end. mem. de VetS no Reg BC
				

loop:	mvi	A, 0h		; Zera o Acumulador
	mov	D, m		; Move um elemento de Vet para o Reg D
	
	adi	const		; Adiciona a constante const ao Acumulador
	add	D		; Adiciona o valor de Vet  
	
	stax	B		; Armazena o valor do Acumulador no VetS
	dcr	E		; Decrementa o contador cont 
	jz	done		; if E = 0 então salta para done

	inx	H		; Incrementa Vet
	inx	B		; Incrementa VetS	
	jmp	loop		; Salta para loop

done:	hlt			; parada do programa