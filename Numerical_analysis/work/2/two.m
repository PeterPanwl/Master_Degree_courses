%ʵ��2.2.4
%����һ�����Խ�n�׾��󣬲�����������ʽ���棬����ֵ���������������ַ�����������
clear all;
n=input('������n��ֵ:');
A=zeros(n,n);
for i=1:n
A(i,i)=5;
end
for i=1:n-1
A(i,i+1)=6;
end
for i=2:n
A(i,i-1)=1;
end
A
disp('���������ʽ')
det(A)
disp('����������')
inv(A)
disp('���������ֵ����������')
[v,d]=eig(A)
disp('�����2-����')
norm(A,2)
disp('�����1-����')
norm(A,1)
disp('���������-����')
norm(A,inf)
disp('�����2-������')
cond(A,2)
disp('�����1-������')
cond(A,1)
disp('���������-������')
cond(A,inf)
disp('����ĵ�������')
rcond(A)
