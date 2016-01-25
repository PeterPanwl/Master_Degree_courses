function [x,k,index]=Jacobi(A,b,ep,it_max)
%�����Է�������ſɱȵ�������
%AΪ�������ϵ������
%bΪ������������
%xΪ������Ľ⣻
% epΪ����Ҫ��ȱʡֵΪ1e-5��
%it_maxΪ������������ȱʡֵΪ100��
%kΪ����������
%indexΪָ�������index=0��ʾ����ʧ�ܣ�index=1��ʾ����ɹ���
if nargin<4
    it_max=100;
end
if nargin<3
    ep=1e-5;
end
n=length(A);k=0;x=zeros(n,1);y=zeros(n,1);index=1;
while k<=it_max
    for i=1:n
       if abs(A(i,i))<1e-10 
            index=0;
            return;
       end
       y(i)=(b(i)-A(i,1:n)*x(1:n)+A(i,i)*x(i))/A(i,i);
end
if norm(y-x,inf)<ep
        break;
        end
    k=k+1;
    x=y;
end
