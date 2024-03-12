# Caesar Cipher (NASM)

---


### Introduction

Similar to some of my other recent projects this one originates from a Facebook post I saw recently. I'd imagine this 
particular post was from a student who wanted the answers for his homework question, but I found the exercise seemingly
challenging, and thought I'd go ahead with it. 

The task at hand is to take a message, and Caesar Cipher (and potentially Decipher) it. The actual example I saw was for
MASM, but I thought I would implement this in NASM, since it's more familiar to me, and I've written other projects 
using NASM. 

I'll be using GTest, and attempting to push each time I make progress. This means, my initial commit should just show
this function/subroutine I've implemented, which simply returns a random integer. From there I will work on implementing 
the Caesar Cipher and Decipher subroutines. 

---

### What's Going On?

We have the task of taking a message, and shifting its values by a value. The user will give a value no greater than 26.
The value can also be negative (up to -26). This means we will shift our message the specificed number of places, and 
the number can't be 26 (or negative 26) because then that would leave us with our original message.

##### Things to Consider:

    1. Our message can have capital or lower-case letters. 
    2. We will go through our input string one character at a time, and do our comparison

It's worth noting, the way I'll be implementing this will involve me writing the function in C++, and then passing it to 
the [Godbolt Compiler Explorer](https://godbolt.org/). The code output by the Compiler Explorer is not perfect NASM, so 
it'll need to be adjusted a bit, but it's a great starting point for writing assembly!

Here's my rough algorithm

    1. Determine if current character is capital or not (ASCII)
    2. If capital, handle appropriately
    3. If NOT, then handle as lowercase

Ultimately we're just subtracting or adding our number to the ASCII value which is represented by our char. 

Easy peasy. :P


---

