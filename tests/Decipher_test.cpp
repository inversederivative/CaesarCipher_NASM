//
// Created by John on 3/12/2024.
//
#include <gtest/gtest.h>
#include <Cipher.hpp>


TEST(Decipher_Tests, Test_Decipher_CapitalChar)
{
    char letter = 'B';
    char* expected = "A";

    char* cipherText = (char*) malloc(sizeof(letter));
    *cipherText = letter;
    // Should produce B - 1
    char* actual = Decipher(cipherText, 1);

    EXPECT_EQ(*expected, *actual);
}

TEST(Decipher_Tests, Test_Decipher_LowerCaseChar)
{
    char letter = 'b';
    char* expected = "a";

    char* cipherText = (char*) malloc(sizeof(letter));
    *cipherText = letter;
    // Should produce B - 1
    char* actual = Decipher(cipherText, 1);

    EXPECT_EQ(*expected, *actual);
}

