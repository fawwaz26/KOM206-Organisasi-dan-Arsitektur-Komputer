extern printf
extern fflush
extern scanf
     
section .data
    n db "%s", 0
    scan db "%s", 10, 0
    print db "%d", 10, 0
    a1 db "", 0
section .bss
	string1 resb 20
	string2 resb 20
        
section .text
    global main
         
main:
	cld
	push string1
	push n
	call scanf
	
	mov ecx, 21
	mov edi, string1
	mov eax, [a1]
	repne scasb
	
	mov eax, 20
	sub eax, ecx
	
	push eax
	push print
	call printf
	
exit:
	push 0
	call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80