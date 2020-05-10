extern printf
extern fflush
extern scanf
       
section .data
    angka db "%f", 0
    scan db "%d", 0
    print db "%.1f", 10, 0
    sum dq 0.0       
           
section .bss
	n resd 1
	bil resd 1
	result resd 1
      
section .text
    global main
           
main:
	push n
    push scan
    call scanf
    
    mov edi, [n]
	fld qword[sum]
	
looping:
	push bil
	push angka
	call scanf
	add esp, 8
	
	fadd dword[bil]
	
	sub edi, 1
	cmp edi, 0
	jne looping


	fidiv dword[n]
	fst qword[result]
	
	push dword[result+4]
	push dword[result]
	push print
	call printf

exit:
    push 0
    call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80