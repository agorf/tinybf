# tinybf

A minuscule interpreter for the [Brainfuck][] programming language, written in
Ruby.

[Brainfuck]: http://en.wikipedia.org/wiki/Brainfuck

Some of the features/design decisions:

- Matches and caches brackets before executing code, speeding up the
  interpretation.
- Has an array of 1-byte unsigned cells that can grow "infinitely" to the right.
- Wraps cell values if they exceed the minimum/maximum allowed.
- Ignores a `<` command if the array pointer is on the left-most cell.
- Passes [Daniel Cristofani][cristofd]'s [tests][] and follows his [Epistle to
  the Implementors][epistle].
- Weighs only 350 bytes!

[cristofd]: http://www.hevanet.com/cristofd/
[tests]: http://www.hevanet.com/cristofd/brainfuck/tests.b
[epistle]: http://www.hevanet.com/cristofd/brainfuck/epistle.html

## Usage

Apart from the eight standard [Brainfuck commands][cmds], the first exclamation
mark (`!`) is significant and is used to split the interpreted code from its
standard input (stdin).

[cmds]: https://en.wikipedia.org/wiki/Brainfuck#Commands

Here's a usage example with [Daniel Cristofani][cristofd]'s [numwarp.b][]:

[numwarp.b]: http://www.hevanet.com/cristofd/brainfuck/numwarp.b

    $ ruby tinybf.b
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

In the example above, `1337` is the input to the interpreted program.

## Limitations

- Insanely slow compared to a C implementation.
- No error checking (e.g. unmatched brackets).
- Both the interpreted source code and its input are passed through the same
  stream (standard input). This makes I/O non-interactive.
- Unsurprisingly, the code is obfuscated and a bit hard to read. :-) That said,
  here's a list of what each variable is:
  - `c` is a `String` holding the code and `b` its pointer
  - `i` is a `String` holding the input and `h` its pointer
  - `a` is an `Array` holding the memory and `z` its pointer
  - `j` is a `Hash` used to cache the position of brackets and `s` an `Array`
    used (as a stack) to build it

## License ##

[The MIT License](https://github.com/agorf/tinybf/blob/master/LICENSE.txt)

## Author ##

Angelos Orfanakos, <https://agorf.gr/>
