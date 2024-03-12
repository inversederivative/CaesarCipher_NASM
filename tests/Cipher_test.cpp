//
// Created by John on 3/12/2024.
//
#include <gtest/gtest.h>
#include <Cipher.hpp>


TEST(Cipher_Tests, Test_Dummy_Function)
{
    int expected = 41;

    int actual = ReturnFourtyOne();

    EXPECT_EQ(expected, actual);
}

TEST(Cipher_Tests, Test_Cipher_CapitalLetter)
{
    char letter = 'A';
    char* expected = "B";

    char* cipherText = reinterpret_cast<char *>(letter);

    // Should produce A + 1
    char* actual = Cipher(cipherText, 1);

    EXPECT_EQ(expected, actual);
}