#!/usr/bin/env ruby

# c ode  (b pointer)
# i nput (h pointer)
# a rray (z pointer)
# j ump
# s tack

c,i=STDIN.read.split'!',2;(c||='').scan(/[-+<>\[\],.]/)*'';i||=[];b,h,z,*a=0,0,
0,0;j,s={},[];c.size.times{|n|case c[n];when 91:s<<n;when 93:j[n]=s.pop;j[j[n]]=
n;end};while c[b]:case c[b];when 43:a[z]=(a[z]+1)%256;when 45:a[z]=(a[z]-1)%256;
when 44:i[h]&&(a[z]=i[h];h+=1);when 46:putc a[z];when 62:!a[z+=1]&&a<<0;when 60:
z-=z>0?1:0;when 91:a[z]>0||b=j[b];when 93:a[z]>0&&b=j[b];end;b+=1;end
