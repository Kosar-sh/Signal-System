function ro=innerproduct(x,y)
len=length(x);
ro=0;
for i=1:len
    ro=ro+x(i)*y(i);
end
end