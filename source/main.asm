;
; Created by John on 1/19/2024.
;
        extern  printf
        global  main

        ; Assembler gave the following error:
        ;   missing .note.GNU-stack section implies executable stack

        ; In order to fix this, we add the following line.
        section .note.GNU-stack noalloc noexec nowrite progbits

        ; noalloc - Does not allocate space in the program's memory at runtime
        ; noexec - does not require an executable stack
        ; nowrite - the section is not writable. Section is read only
        ; progbits -  contains program data. It is a common type for sections that hold executable code or data used
        ;   during program execution

        section .data

fmt:    db "%s", 10, 0
; 33 Is an Exclamation Point
msg:    db "Hello, World", 33, 0




        section .text
main:
        push    rbp
        mov     rbp, rsp
        mov     rdi, fmt
        mov     rsi, msg
        xor     rax, rax
        call    printf

        xor     rax, rax
        pop     rbp
        ret

