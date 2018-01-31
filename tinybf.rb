c,i=$<.read.split'!',2
i||=[]
*a=b=h=z=0
j,s={},[]
c.size.times{|n|case c[n]
when ?[
s<<n
when ?]
j[j[n]=s.pop]=n
end}
while d=c[b]
case d
when ?+,?-
a[z]=(a[z]+44-d.ord)%256
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
