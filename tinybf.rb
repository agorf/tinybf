#!/usr/bin/env ruby

# = tinybf.rb - tiny Brainfuck interpreter in Ruby
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
]=n;end};while c[b]:case c[b];when 43:a[z]=(a[z]+1)%256;when 62:z+=1;a<<0if !a[z
];when 91:b=j[b]if a[z]==0;when 46:putc a[z];when 93:b=j[b]if a[z]!=0;when 45:a[
z]=(a[z]-1)%256;when 44:if i[h]:a[z]=i[h];h+=1;end;when 60:z-=z==0?0:1;end;b+=1;
end
