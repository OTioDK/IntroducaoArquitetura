 
section .bss
vetA resb 10 
vetB resb 10
vetC resb 10
enter: resb 1
posicao : resb 1

section .data
msg1 db 'Digite a valor do vetA na posicao [ '
msg1Len equ $ - msg1
msg2  db ']= '
msg2Len equ $ - msg2

msg3 db 'Digite a valor do vetB na posicao [ '
msg3Len equ $ - msg3

msg4 db 'Este eh o valor do vetC na posicao['
msg4Len equ $ - msg4

quebra db ' ', 0xa
quebraLen equ $ - quebra
section .text 

global _start
_start :

	mov eax, 0
	mov ecx, 9
	read_A:
		mov [posicao], eax 
		push rcx
		push rax

		mov ecx, msg1
		mov eax, 4
		mov ebx,1
		mov edx, msg1Len
		int 0x80

		mov ecx, posicao
		mov edx, 0x30
		add [ecx], edx
		mov eax, 4
		mov ebx,1
		mov edx, 1
		int 0x80

		mov ecx, msg2
		mov eax, 4
		mov ebx,1
		mov edx, msg2Len
		int 0x80


		pop rax
		pop rcx

		push rcx
		push rax

		mov ecx, vetA
		add ecx, eax
		mov eax, 3
		mov ebx,2
		mov edx, 1
		int 0x80
	
		
		mov ecx, enter
		mov eax, 3
		mov ebx,2
		mov edx, 1
		int 0x80
		
		
		pop rax
		pop rcx
		inc eax
		sub ecx, 1
	 	cmp ecx, 0
		jnl read_A 
;---------------------------------------------------------------------------------------
		mov eax, 0
		mov ecx, 9
	read_B:
		mov [posicao], eax 
		push rcx
		push rax

		mov ecx, msg3
		mov eax, 4
		mov ebx,1
		mov edx, msg3Len
		int 0x80

		mov ecx, posicao
		mov edx, 0x30
		add [ecx], edx
		mov eax, 4
		mov ebx,1
		mov edx, 1
		int 0x80

		mov ecx, msg2
		mov eax, 4
		mov ebx,1
		mov edx, msg2Len
		int 0x80


		pop rax
		pop rcx

		push rcx
		push rax

		mov ecx, vetB
		add ecx, eax
		mov eax, 3
		mov ebx,2
		mov edx, 1
		int 0x80
	
		
		mov ecx, enter
		mov eax, 3
		mov ebx,2
		mov edx, 1
		int 0x80
		
		
		pop rax
		pop rcx
		inc eax
		sub ecx, 1
	 	cmp ecx, 0
		jnl read_B
;---------------------------------------------------------------------------------------

	mov eax, 0
	mov ecx, 10
somaVetC:
		push rcx
		push rax
		
		 ;posicao[i] de vetA em ebx
		 mov ebx, vetA
		 add ebx, eax
		 

		 ;posicao[i] de vetB  em ecx
		 mov ecx, vetB
		 add ecx, eax
		 
		 mov edx, [ebx]  ; conteudo de ebxx
		 add edx, [ecx]  ; conteudo de ecx
		 sub edx, 30h    ; transforma em asc

		 mov ebx, vetC   ; posicao[i] do vetC em ebx
		 add ebx, eax
		
		 mov [ebx], edx   ; conteudo de edx em vetC[i]

	     pop rax
		 pop rcx
		 inc eax
     loop somaVetC
;--------------------------------------------------------------------------------------
		mov eax, 0
		mov ecx, 9
		write_C:
		mov [posicao], eax 
		push rcx
		push rax

		mov ecx, msg4
		mov eax, 4
		mov ebx,1
		mov edx, msg4Len
		int 0x80

		mov ecx, posicao
		mov edx, 0x30
		add [ecx], edx
		mov eax, 4
		mov ebx,1
		mov edx, 1
		int 0x80

		mov ecx, msg2
		mov eax, 4
		mov ebx,1
		mov edx, msg2Len
		int 0x80


		pop rax
		pop rcx

		push rcx
		push rax

		mov ecx, vetC
		add ecx, eax
		mov eax, 4
		mov ebx,1
		mov edx, 1
		int 0x80
		
	;----------------
		mov ecx, quebra
		mov eax, 4
		mov ebx,1
		mov edx, quebraLen	
		int 0x80
	;----------------	
		pop rax
		pop rcx
		inc eax
		sub ecx, 1
	 	cmp ecx, 0
		jnl write_C

		
;---------------------------------------------------------------------------------------
	; sai do sistema
	mov eax, 1
	mov ebx, 0
	int 0x80
