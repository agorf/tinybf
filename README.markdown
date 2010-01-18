# tinybf #

A tiny interpreter for the [Brainfuck][] programming language.

[Brainfuck]: http://en.wikipedia.org/wiki/Brainfuck

Some of the features/design decisions:

- Matches and caches brackets before executing code, speeding up the interpretation.
- Has an array of 1-byte unsigned cells that can grow "infinitely" to the right.
- Wraps cell values if they exceed the minimum/maximum allowed.
- Ignores a `<` command if the array pointer is on the left-most cell.
- Passes [Daniel Cristofani][cristofd]'s [tests][] and follows his [Epistle to the Implementors][epistle] closely.
- Weighs only 388 bytes!

[cristofd]: http://www.hevanet.com/cristofd/
[tests]: http://www.hevanet.com/cristofd/brainfuck/tests.b
[epistle]: http://www.hevanet.com/cristofd/brainfuck/epistle.html

## Usage ##

Apart from the eight standard [Brainfuck commands][cmds], the first exclamation mark (`!`) is significant and is used to tell apart the program being interpreted from its input.

[cmds]: http://en.wikipedia.org/wiki/Brainfuck#Commands

Here's a usage example with [Daniel Cristofani][cristofd]'s [numwarp.b][]:

[numwarp.b]: http://www.hevanet.com/cristofd/brainfuck/numwarp.b

    >>>>+>+++>+++>>>>>+++[>,+>++++[>++++<-]>[<<[-[->]]>[<]>-]<<[>+>+>>+>+[<<<<]<+>>[
    +<]<[>]>+[[>>>]>>+[<<<<]>-]+<+>>>-[<<+[>]>>+<<<+<+<--------[<<-<<+[>]>+<<-<<-[<<
    <+<-[>>]<-<-<<<-<----[<<<->>>>+<-[<<<+[>]>+<<+<-<-[<<+<-<+[>>]<+<<<<+<-[<<-[>]>>
    -<<<-<-<-[<<<+<-[>>]<+<<<+<+<-[<<<<+[>]<-<<-[<<+[>]>>-<<<<-<-[>>>>>+<-<<<+<-[>>+
    <<-[<<-<-[>]>+<<-<-<-[<<+<+[>]<+<+<-[>>-<-<-[<<-[>]<+<++++[<-------->-]++<[<<+[>
    ]>>-<-<<<<-[<<-<<->>>>-[<<<<+[>]>+<<<<-[<<+<<-[>>]<+<<<<<-[>>>>-<<<-<-]]]]]]]]]]
    ]]]]]]]]]]]]>[>[[[<<<<]>+>>[>>>>>]<-]<]>>>+>>>>>>>+>]<]<[-]<<<<<<<++<+++<+++[[>]
    >>>>>>++++++++[<<++++>++++++>-]<-<<[-[<+>>.<-]]<<<<[-[-[>+<-]>]>>>>>[.[>]]<<[<+>
    -]>>>[<<++[<+>--]>>-]<<[->+<[<++>-]]<<<[<+>-]<<<<]>>+>>>--[<+>---]<.>>[[-]<<]<]
    !1337
          /\
            \
        /\
         /\
      /\  /
       /\
     \  /
      \

In the example above, `1337` is the input to the interpreted program (everything before the `!`).

## Limitations ##

- Insanely slow compared to a C implementation.
- No error checking (e.g. unmatched brackets).
- Both a program's code and its input are passed through the same stream (stdin); this makes I/O non-interactive.
- The code is obfuscated and unreadable.

## License ##

The MIT License

Copyright (c) 2010 Aggelos Orfanakos

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

## Author ##

Aggelos Orfanakos, <http://agorf.gr/>
