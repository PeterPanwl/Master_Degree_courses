%ʵ��3.8
clear all;
n=input('������n��ֵ:');
A=zeros(n,n);
b=zeros(n,1);
x0=zeros(n,1);
for i=1:n;
A(i,i)=3;
end
for i=1:n-1;
A(i,i+1)=-0.5;
end
for i=2:n;
A(i,i-1)=-0.5;
end
for i=1:n-2;
A(i,i+2)=-0.25;
end
for i=3:n;
A(i,i-2)=-0.25;
end
for i=3:n-2;
b(i,1)=1.5;
end
b(1,1)=2.25;
b(2,1)=1.75;
b(n-1,1)=1.75;
b(n,1)=2.25;
disp('��һС��')
x=nagauss2(A,b)
disp('�ڶ�С��')
x=nags(A,b,x0,1e-4)
disp('����С��')
x=naspgs(A,b,x0,1e-4)
