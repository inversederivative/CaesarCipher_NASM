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

    char* cipherText = (char*) malloc(sizeof(letter));
    *cipherText = letter;
    // Should produce A + 1
    char* actual = Cipher(cipherText, 1);

    EXPECT_EQ(*expected, *actual);
}

TEST(Cipher_Tests, Test_Cipher_CapitalLetter_NegOffset)
{
    char letter = 'A';
    char* expected = "Z";

    char* cipherText = (char*) malloc(sizeof(letter));
    *cipherText = letter;
    // Should produce A - 1, i.e. Z
    char* actual = Cipher(cipherText, -1);

    EXPECT_EQ(*expected, *actual);
}

TEST(Cipher_Tests, Test_Cipher_LowerCaseLetter)
{
    char letter = 'a';
    char* expected = "b";

    char* cipherText = (char*) malloc(sizeof(letter));
    *cipherText = letter;
    // Should produce a + 1
    char* actual = Cipher(cipherText, 1);

    EXPECT_EQ(*expected, *actual);
}

TEST(Cipher_Tests, Test_Cipher_LowerCaseLetter_NegOffset)
{
    char letter = 'a';
    char* expected = "z";

    char* cipherText = (char*) malloc(sizeof(letter));
    *cipherText = letter;
    // Should produce a - 1, i.e. z
    char* actual = Cipher(cipherText, -1);

    EXPECT_EQ(*expected, *actual);
}

TEST(Cipher_Tests, Test_Cipher_MultipleCapitalLetters)
{
    char* cipherText = "ABCDE";

    char* expected = "BCDEF";

    char* actual = Cipher(cipherText, 1);

    EXPECT_EQ(*expected, *actual);
}

TEST(Cipher_Tests, Test_Cipher_TestJohn)
{
    char* cipherText = "John";

    char* expected = "Otms";

    char* actual = Cipher(cipherText, 5);

    EXPECT_EQ(*expected, *actual);
}
