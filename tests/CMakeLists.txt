project(Google_Tests)
enable_language(ASM_NASM)

# adding the Google_Tests_run target
add_executable(Cipher_tests
        Cipher_test.cpp
        Decipher_test.cpp
        # We need this to be able to have our object files from our assembly source for GTest
        # otherwise we would need to include this instead of our header in the test.cpp file
        ../source/Cipher.asm
)

target_link_libraries(Cipher_tests gtest gtest_main)

