extern printf
extern fflush
extern scanf
      
section .data
    scan db "%f %f", 0
    print db "%f", 10, 0
          
section .bss
    a1 resd 1
    a2 resd 1
    x resd 1
    x1 resd 1
    x2 resd 1
     
section .text
    global main
          
main:
    push a1
    push a2
    push scan
    call scanf
     
    fld dword[a1]
    fld dword[a1]
    fmulp
    fstp dword[x1]
     
    fld dword[a2]
    fld dword[a2]
    fmulp
    fstp dword[x2]
     
    fld dword[x1]
    fld dword[x2]
    faddp
     
    fsqrt
    fstp qword[x]
     
    push dword[x+4]
    push dword[x]
    push print
    call printf
     
exit:
    push 0
    call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80