%ʵ��2.10
clear all;
n=input('������n��ֵ:');
A=zeros(n,n);
b=zeros(n,1);
for i=1:n
A(i,i)=2;
end
for i=1:n-1
A(i,i+1)=1;
end
for i=2:n
A(i,i-1)=1;
end
A;
for i=2:n-1
b(i,1)=4;
end
b(1,1)=3;
b(n,1)=3;
b
disp('��һС��')
x=nagauss2(A,b)
disp('�ڶ�С��')
x=zhuiganfa(A,b)
disp('����С��')
x=A\b
