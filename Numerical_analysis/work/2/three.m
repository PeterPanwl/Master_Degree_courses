%ʵ��2.5
%����һ��n��hilbert���󣬲������������Ϣ������hilb��������Ա�
clear all;
n=input('������n��ֵ:');
A=zeros(n,n);
for i=1:n
for j=1:n
A(i,j)=1/(i+j-1);
end
end
A
disp('2-������')
cond(A,2)
disp('�����')
inv(A)
disp('norm(inv(A)*A-eye(n))')
norm(inv(A)*A-eye(n))
disp('det(A)*det(inv(A))-1')
det(A)*det(inv(A))-1
