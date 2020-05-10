extern printf
extern fflush
extern scanf
      
section .data
    scan db "%f", 0
    print db "%f", 10, 0
          
section .bss
    s resd 1
    result resd 1
     
section .text
    global main
          
main:
    push s
    push scan
    call scanf
     
    fld dword[s]
    push dword[s]
    fldpi
    fmulp
    fstp qword[result]
     
    push dword[result+4]
    push dword[result]
    push print
    call printf
     

    push 0
    call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80