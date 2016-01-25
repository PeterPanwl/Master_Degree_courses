function [y,Ck,Ak]=NewtonCotes(fun,a,b,n)
%NewtonCotes��ţ��-����˹��ֵ���ַ�
%a����������
%b����������
%n�����ֽ�����n=1��Ϊ���λ��֣�n=2,Ϊ����ɭ���֣�n<=8,�����ѱ����ֵ��ȶ���
%funΪ����������fun=@��x����������������ʽ
if nargin==1
    [mm,nn]=size(fun);
    if mm>8
        error
    end
 xk=fun(1,:);
 fk=fun(2,:);
 a=min(xk);
 b=max(xk);
 n=mm-1;
end
if nargin==4
    xk=linspace(a,b,n+1);
    if isa(fun,'function_handle')
       fx=fun(xk);
    end 
end
    Ck=cotescoeff(n);
    Ak=(b-a)*Ck;
y=Ak*fx';
