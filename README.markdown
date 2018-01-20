# tinybf #

A minuscule interpreter for the [Brainfuck][] programming language, written in Ruby.

[Brainfuck]: http://en.wikipedia.org/wiki/Brainfuck

Some of the features/design decisions:

- Matches and caches brackets before executing code, speeding up the interpretation.
- Has an array of 1-byte unsigned cells that can grow "infinitely" to the right.
- Wraps cell values if they exceed the minimum/maximum allowed.
- Ignores a `<` command if the array pointer is on the left-most cell.
- Passes [Daniel Cristofani][cristofd]'s [tests][] and follows his [Epistle to the Implementors][epistle] closely.
- Weighs only 383 bytes!

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

[The MIT License](https://github.com/agorf/tinybf/blob/master/LICENSE.txt)

## Author ##

Angelos Orfanakos, <https://agorf.gr/>
