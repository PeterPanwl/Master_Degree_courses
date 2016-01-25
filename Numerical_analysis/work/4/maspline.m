function [yt b c d]= maspline (x,y,xt,flag,f0,fn)
% ����������ֵ����
% (x,y)Ϊ��ֵ�ڵ�ԣ�xtΪ�������������ytΪxt���ĺ���ֵ��
% f0,fn Ϊ���ұ�ֵ
% flag��˵�߽��������ͣ�
% flag=1 : �˵�һ�׵�ȷ����
% flag=2 : �˵���׵�ȷ����
% flag=3 : �˵���׵�Ϊ0��
n=length(x);
ny=length(y);
if n~=ny
    error('��ֵ�ڵ�x�뺯��ֵy��һ��');
end

a=zeros(n-1,1);
b=a;d=a;h=a;df=a;
A=zeros(n);E=zeros(n,1);

a(1:n-1)=y(1:n-1);
h(1:n-1)=x(2:n)-x(1:n-1);
df(1:n-1)=y(2:n)-y(1:n-1);

% ϵ���������Ҷ���
for i=2:n-1
    A(i,i-1)=h(i-1);
    A(i,i)=2*(h(i-1)+h(i));
    A(i,i+1)=h(i);
    E(i,1)=3*(df(i)/h(i)-df(i-1)/h(i-1));
end
if flag==1 % �˵�һ�׵���ȷ����
    A(1,1)=2*h(1);A(1,2)=h(1);
    A(n,n-1)=h(n-1);A(n,n)=2*h(n-1);
    E(1,1)=3*(df(1)/h(1)-f0);
    E(n,1)=3*(fn-df(n-1)/h(n-1));
end
if flag==2% �˵���׵���ȷ����
    A(1,1)=2;A(n,n)=2;
    E(1,1)=f0;E(n,1)=fn;
end
if flag==3  % �˵���׵�Ϊ0��
    A(1,1)=1;
    A(n,n)=1;
end
% ��⺬c������
c=A\E;
% ���b,d
for i=1:n-1
    b(i)=df(i)/h(i)-h(i)*(2*c(i)+c(i+1))/3;
    d(i)=(c(i+1)-c(i))/(3*h(i));
end
m=size(xt,2);
yt=zeros(m,1);
for i=1:m
    for k=1:n-1
        if xt(i)>=x(k) && xt(i)<x(k+1)
            j=k;
            break;
        elseif xt(i)==x(n)
            j=n-1;
        end
    end
    yt(i)=a(j)+b(j)*(xt(i)-x(j))+c(j)*(xt(i)-x(j))^2+d(j)*(xt(i)-x(j))^3;
end
