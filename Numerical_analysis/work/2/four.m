%ʵ��2.8
clear all;
a=[0.3e-15,59.14,3,1;5.291,-6.13,-1,2;11.2,9,5,2;1,2,1,1];
b=[59.17;46.78;1;2];
disp('˳��GAUSS��ȥ��')
x=nagauss(a,b)
disp('ѡ����ԪGAUSS��ȥ��')
x=nagauss2(a,b)