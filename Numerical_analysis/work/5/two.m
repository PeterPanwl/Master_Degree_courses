%ʵ��5.5
fun=inline('sin(x)/x')
disp('�䲽�����η�')
bbctxf(fun,eps,1,5e-7)
disp('romberg')
romberg(fun,eps,1,5e-7)
