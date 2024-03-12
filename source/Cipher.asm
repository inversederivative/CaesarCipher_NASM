; We will implement our subroutines and make them global here.

; We can then call them in main or in gtest

; We will expose our subroutines in the .hpp file, so we can access them from GTest




; Cipher (char* message, int offset)


; Decipher (char* message, int offset)


        global ReturnFourtyOne, Cipher, Decipher

        section .data


        section .text


ReturnFourtyOne:

        mov RAX, 41
        ret

Cipher:


Decipher: