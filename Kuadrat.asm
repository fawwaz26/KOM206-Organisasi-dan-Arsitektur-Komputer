extern printf
extern fflush
extern scanf
     
section .data
    scan db "%d", 0
    print db "%d", 10, 0
         
section .bss
    n resd 1
        
section .text
    global main
         
main:
    
sub_loop:
	push n
	push scan
	call scanf
	mov eax, [n]
	mov ebx, [n]
	mov ecx, 0
	
	cmp ebx, ecx
	je looping
	
	call kuadrat
	
	push eax
	push print
	call printf
	
	cmp ebx, ecx
	jne sub_loop
	jmp looping
	
kuadrat:
	mov edx, eax
	imul edx
	ret

looping:
    push 0
    call fflush
         
exit:
    mov eax, 1
    mov ebx, 0
    int 0x80