#!/usr/bin/env ruby

# = tinybf.rb - 417-byte Brainfuck interpreter in Ruby
#
# URL::       http://agorf.void.gr/code/tinybf.rb
# Author::    Aggelos Orfanakos (http://agorf.void.gr)
# Copyright:: 2006, Aggelos Orfanakos. All rights reserved.
# License::   MIT[http://agorf.void.gr/code/LICENSE]
#
# $Id$
#--
# c ode  (b pointer)
# i nput (h pointer)
# a rray (z pointer)
# j ump
# s tack
#++

c,i=STDIN.read.split'!',2;c=c.scan(/[-+<>\[\],.]/).join;i||=[];b,h,z,*a=0,0,0,0;
j,s={},[];c.length.times{|n|case c[n].chr;when'[':s<<n;when']':j[n]=s.pop;j[j[n]
]=n;end};loop{case c[b].chr;when'+':a[z]=(a[z]+1)%256;when'-':a[z]=(a[z]-1)%256;
when'>':z+=1;a<<0if !a[z];when'<':z-=z==0?0:1;when'.':putc a[z].chr;when'[':b=j[
b]if a[z]==0;when',':if i[h]:a[z]=i[h];h+=1;end;when']':b=j[b]if a[z]!=0;end;b+=
1;break if !c[b]}
