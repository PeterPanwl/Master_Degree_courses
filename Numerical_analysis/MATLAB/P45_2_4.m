clear all;
n=input('������n��ֵ:');
A=zeros(n,n);
for i=1:n
    for j=1:n
        if i==j
        A(i,j)=5;
        elseif i==j+1
            A(i,j)=1;
        elseif i==j-1
            A(i,j)=6;
        else
            A(i,j)=0;
        end
    end
end
disp('��ʾ��������')
A
A;a=det(A),B=inv(A)
[V,D]=eig(A)
[norm(A),norm(A,1),norm(A,inf)]
[cond(A),cond(A,1),cond(A,inf)]