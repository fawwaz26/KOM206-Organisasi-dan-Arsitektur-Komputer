extern printf
extern fflush
extern scanf
     
section .data
    fmt db "%s", 0
    weekday db "weekday", 10, 0
    weekend db "weekend", 10, 0
    sun db "Sun", 0
    sat db "Sat", 0
    
         
section .bss
	string1 resb 10
	string2 resb 10
        
section .text
    global main
         
main:
	push string1
	push fmt
	call scanf
	
	mov esi, string1
	mov edi, sun
	
	cmpsb
	je .sama
	
	mov edi, sat
	cmpsb
	je .sama

	push weekday
	call printf
	jmp exit

.sama:
	push weekend
	call printf
	jmp exit
         
exit:
	push 0
	call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80