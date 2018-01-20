#!/usr/bin/env ruby

# c ode  (b pointer)
# i nput (h pointer)
# a rray (z pointer)
# j ump
# s tack

c,i=STDIN.read.split'!',2
(c||='').scan(/[-+<>\[\],.]/)*''
i||=[]
*a=b=h=z=0
j,s={},[]
c.size.times{|n|case c[n]
when ?[
s<<n
when ?]
j[n]=s.pop
j[j[n]]=n
end}
while c[b]
case c[b]
when ?+
a[z]=(a[z]+1)%256
when ?-
a[z]=(a[z]-1)%256
when ?,
i[h]&&(a[z]=i[h].ord;h+=1)
when ?.
putc a[z]
when ?>
!a[z+=1]&&a<<0
when ?<
z-=z>0?1:0
when ?[
a[z]>0||b=j[b]
when ?]
a[z]>0&&b=j[b]
end
b+=1
end
