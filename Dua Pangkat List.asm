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
	mov ecx, [n]
	mov ebx, [n]
	
	cmp ebx, 0
	je looping
	
	mov eax, 1
	call pangkat
	
	push eax
	push print
	call printf
	
	cmp ebx, 0
	jne sub_loop
	
	jmp looping
	
pangkat:
	mov edx, 2
	imul edx
	loop pangkat
	ret

looping:   
    push 0
    call fflush
         
exit:
    mov eax, 1
    mov ebx, 0
    int 0x80