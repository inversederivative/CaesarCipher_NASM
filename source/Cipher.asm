; We will implement our subroutines and make them global here.

; We can then call them in main or in gtest

; We will expose our subroutines in the .hpp file, so we can access them from GTest




; Cipher (char* message, int offset)

;#include <cstring>
;#include <cstdlib>
;#include <iostream>

;static char* testCipher(char* message, int offset)
;{
;    int length = strlen(message);
;    char* encrypted = (char*)malloc((length + 1) * sizeof(char));
;    if (encrypted == nullptr) {
;        std::cout << "Memory allocation failed." << std::endl;
;        exit(1);
;    }
;
;    for (int i = 0; i < length; i++)
;    {
;        char currentChar = message[i];
;        if (currentChar >= 'A' && currentChar <= 'Z')
;        {
;            int shifted = currentChar + offset;
;            if (shifted > 'Z') {
;                shifted -= 26; // Wrap around if the shifted value exceeds 'Z'
;            } else if (shifted < 'A') {
;                shifted += 26; // Wrap around if the shifted value goes below 'A'
;            }
;            encrypted[i] = shifted;
;        }
;        else if (currentChar >= 'a' && currentChar <= 'z')
;        {
;            int shifted = currentChar + offset;
;            if (shifted > 'z') {
;                shifted -= 26; // Wrap around if the shifted value exceeds 'Z'
;            } else if (shifted < 'a') {
;                shifted += 26; // Wrap around if the shifted value goes below 'A'
;            }
;            encrypted[i] = shifted;
;        }
;        else
;        {
;            encrypted[i] = currentChar; // If it's not an uppercase letter, leave it unchanged
;        }
;    }
;    encrypted[length] = '\0'; // Null-terminate the encrypted string
;    return encrypted;
;}

; Decipher (char* message, int offset)

        extern strlen, malloc, exit
        global ReturnFourtyOne, Cipher, Decipher

        section .data


        section .text


ReturnFourtyOne:

        mov RAX, 41
        ret

Cipher:
        push    rbp                 ; Save the base pointer
        mov     rbp, rsp            ; Set up the base pointer
        sub     rsp, 48             ; Allocate space on the stack for local variables
        mov     QWORD [rbp-40], rdi ; Save the first argument (message pointer)
        mov     DWORD [rbp-44], esi ; Save the second argument (offset)
        mov     rax, QWORD [rbp-40] ; Load the message pointer into rax
        mov     rdi, rax            ; Pass the message pointer as an argument
        call    strlen              ; Call strlen to get the length of the message
        mov     DWORD [rbp-16], eax ; Store the length of the message
        mov     eax, DWORD [rbp-16]; Load the length of the message
        add     eax, 1              ; Add 1 to account for the null terminator
        cdqe                        ; Sign-extend eax to rax
        mov     rdi, rax            ; Pass the length of the message to malloc
        call    malloc              ; Allocate memory for the encrypted string
        mov     QWORD [rbp-24], rax ; Save the pointer to the allocated memory
        cmp     QWORD [rbp-24], 0   ; Check if memory allocation was successful
        jne     notEmpty            ; If memory was allocated, continue
        mov     edi, 1              ; Set the exit code to 1
        call    exit                ; Exit the program
notEmpty:
        mov     DWORD [rbp-4], 0    ; Initialize loop counter
        jmp     forLoopCondition    ; Jump to the loop condition
upperOrLower:                       ; Start of loop body
        mov     eax, DWORD [rbp-4]  ; Load loop counter into eax
        movsx   rdx, eax            ; Sign-extend loop counter to rdx
        mov     rax, QWORD [rbp-40] ; Load message pointer into rax
        add     rax, rdx            ; Add loop counter to message pointer
        movzx   eax, BYTE [rax]     ; Load character from message
        mov     BYTE [rbp-25], al   ; Store the character in a temporary variable
        cmp     BYTE [rbp-25], 64   ; Check if the character is uppercase
        jle     checkIfLowerCase   ; If not, check if it's lowercase
        cmp     BYTE [rbp-25], 90   ; Check if the character is within the uppercase range
        jg      checkIfLowerCase   ; If not, check if it's lowercase
        movsx   edx, BYTE [rbp-25] ; Sign-extend the character to edx
        mov     eax, DWORD [rbp-44]; Load offset into eax
        add     eax, edx            ; Add offset to the character
        mov     DWORD [rbp-8], eax  ; Store the result in a temporary variable
        cmp     DWORD [rbp-8], 90   ; Check if the result is within the uppercase range
        jle     capitalMinusOverflow; If so, jump to handling capital letters
        sub     DWORD [rbp-8], 26   ; Otherwise, subtract 26 to wrap around
        jmp     assignCapitalWithinRange ; Jump to assigning the encrypted character
capitalMinusOverflow:
        cmp     DWORD [rbp-8], 64   ; Check if the result is below 'A'
        jg      assignCapitalWithinRange ; If not, jump to assigning the encrypted character
        add     DWORD [rbp-8], 26   ; Otherwise, add 26 to wrap around
assignCapitalWithinRange:
        mov     eax, DWORD [rbp-4]  ; Load loop counter into eax
        movsx   rdx, eax            ; Sign-extend loop counter to rdx
        mov     rax, QWORD [rbp-24] ; Load pointer to encrypted string into rax
        add     rax, rdx            ; Add loop counter to pointer
        mov     edx, DWORD [rbp-8]  ; Load encrypted character into edx
        mov     BYTE [rax], dl      ; Store encrypted character in encrypted string
        jmp     incrementForLoopI   ; Jump to incrementing loop counter
checkIfLowerCase:
        cmp     BYTE [rbp-25], 96   ; Check if the character is lowercase
        jle     neitherCapitalNorLower ; If not, neither uppercase nor lowercase
        cmp     BYTE [rbp-25], 122  ; Check if the character is within the lowercase range
        jg      neitherCapitalNorLower ; If not, neither uppercase nor lowercase
        movsx   edx, BYTE [rbp-25]  ; Sign-extend the character to edx
        mov     eax, DWORD [rbp-44] ; Load offset into eax
        add     eax, edx            ; Add offset to the character
        mov     DWORD [rbp-12], eax ; Store the result in a temporary variable
        cmp     DWORD [rbp-12], 122 ; Check if the result is within the lowercase range
        jle     lowerCaseMinusOverflow ; If so, jump to handling lowercase letters
        sub     DWORD [rbp-12], 26  ; Otherwise, subtract 26 to wrap around
        jmp     assignLowerCaseWithinRange ; Jump to assigning the encrypted character
lowerCaseMinusOverflow:
        cmp     DWORD [rbp-12], 96  ; Check if the result is below 'a'
        jg      assignLowerCaseWithinRange ; If not, jump to assigning the encrypted character
        add     DWORD [rbp-12], 26  ; Otherwise, add 26 to wrap around
assignLowerCaseWithinRange:
        mov     eax, DWORD [rbp-4]  ; Load loop counter into eax
        movsx   rdx, eax            ; Sign-extend loop counter to rdx
        mov     rax, QWORD [rbp-24] ; Load pointer to encrypted string into rax
        add     rax, rdx            ; Add loop counter to pointer
        mov     edx, DWORD [rbp-12] ; Load encrypted character into edx
        mov     BYTE [rax], dl      ; Store encrypted character in encrypted string
        jmp     incrementForLoopI   ; Jump to incrementing loop counter
neitherCapitalNorLower:
        mov     eax, DWORD [rbp-4]  ; Load loop counter into eax
        movsx   rdx, eax            ; Sign-extend loop counter to rdx
        mov     rax, QWORD [rbp-24] ; Load pointer to encrypted string into rax
        add     rdx, rax            ; Add loop counter to pointer
        movzx   eax, BYTE [rbp-25]  ; Load character from message
        mov     BYTE [rdx], al      ; Store character in encrypted string
incrementForLoopI:
        add     DWORD [rbp-4], 1    ; Increment loop counter
forLoopCondition:
        mov     eax, DWORD [rbp-4]  ; Load loop counter into eax
        cmp     eax, DWORD [rbp-16] ; Compare loop counter with message length
        jl      upperOrLower        ; If less, jump back to loop body
        mov     eax, DWORD [rbp-16] ; Load message length into eax
        movsx   rdx, eax            ; Sign-extend message length to rdx
        mov     rax, QWORD [rbp-24] ; Load pointer to encrypted string into rax
        add     rax, rdx            ; Add message length to pointer
        mov     BYTE [rax], 0       ; Null-terminate the encrypted string
        mov     rax, QWORD [rbp-24] ; Load pointer to encrypted string into rax
        leave                       ; Restore the stack frame
        ret                         ; Return



Decipher:

        ret