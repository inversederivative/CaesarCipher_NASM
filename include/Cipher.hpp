//
// Created by John on 3/12/2024.
//

#ifndef CAESARCIPHER_NASM_CIPHER_HPP
#define CAESARCIPHER_NASM_CIPHER_HPP

#ifdef __cplusplus

extern "C"
{
#else //is pure C

#endif //__cplusplus

    // Implement here

    // Dummy function
    static int ReturnFourtyOne();

    char* Cipher(char* message, int offset);

    char* Decipher(char* message, int offset);

#ifdef __cplusplus
} //End of extern "C" bloc
#endif //__cplusplus
#endif //CAESARCIPHER_NASM_CIPHER_HPP
