%ʵ��5.8
f1=@ (x)13*(x-x^2)*exp(-1.5*x);
disp('�䲽�����η�')
bbctxf(f1,0,4,1e-8)
disp('romberg')
romberg(f1,0,4,1e-8)
disp('����Ӧsimpson')
%[q,srm,err]=naadapt(inline('1./log(x)'),1.5,5,1e-8)
 %I =bianfuhuasimpson(fx,a,b,epsilon,M) 
disp('���ϵķ���')
[q,srm,err]=naadapt(inline('13*(x-x.^2).*exp(-1.5*x)'),eps,4,1e-8)
disp('�Լ��ҵ�')
bianfuhuasimpson(inline('13.*(x-x.^2)*exp(-1.5.*x)'),0,4,1e-8,1000)
