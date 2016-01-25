%�䲽������ɭ���ַ�
function  I =bianfuhuasimpson(fx,a,b,epsilon,M) 
% ���÷�ʽ�� I =fuhuasimpson(@fx,a,b,epsilon) 
% fx -- ��������������ļ��� 
% a, b -- ������� 
% epsilon -- ���㾫�� 
%  M--���������������� 
n=1; 
h = (b-a)/n; 
T1 = h*(feval(fx,a)-feval(fx,b))/2; 
Hn=h*feval(fx,(a+b)/2); 
S1=(T1+2*Hn)/3; 
n=2*n; 
while n<=M 
   T2=(T1+Hn)/2;    
Hn=0;    
h=(b-a)/n;  
for j=1:n 
x(j)=a+(j-1/2)*h;     
y(j)=feval(fx,x(j));     
Hn=Hn+y(j); 
end 
 Hn=h*Hn; 
 S2=(T2+2*Hn)/3; 
 fprintf(' n=%2d   S2=%-12.9f  S2-S1=%-12.9f\n',n,S2,abs(S2-S1)); 
if  abs(S2-S1)<epsilon    
break; 
else  
T1=T2;     S1=S2;     n=2*n; 
end 
end 
I=S2;
