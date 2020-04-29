extern printf
extern fflush
extern scanf
     
section .data
    scan db "%s %s", 0
    print db "%d", 10, 0
    g db "tidak ada", 10, 0
    
         
section .bss
	string1 resb 51
	cari resb 2
        
section .text
    global main
         
main:
	cld
	push cari
	push string1
	push scan
	call scanf
	
	mov ecx, 50
	mov edi, string1
	mov al, [cari]
	repne scasb
	
	
	mov eax, 50
	sub eax, ecx
	mov ebx, 0
	cmp ecx, ebx
	je tes
	
	push eax
	push print
	call printf
	jmp exit

tes:
	push g
	call printf
	jmp exit
	
exit:
	push 0
	call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80