clear all
c=14.0;
x=[0:1:24];
y=[15,14,14,14,14,15,16,18,20,22,23,25,28,31,32,31,29,27,25,24,22,20,18,17,16];
y1=log(y);
x1=x;
for i=1:25
x1(i)=(x(i)-c)*(x(i)-c);
end
a1=polyfit(x,y,2);         %���ζ���ʽ���%
a2= polyfit(x,y,3);           %���ζ���ʽ���%
a3= polyfit(x,y,4) ;           %�Ĵζ���ʽ���%
a4= polyfit(x1,y1,1); 
b=-1*a4(1);
a=exp(a4(2));

b1= polyval(a1,x);
b2= polyval(a2,x);
b3= polyval(a3,x);
for i=1:25
b4(i)=a*exp(-1*b*(x(i)-c)*(x(i)-c));
end
r1= sum((y-b1).^2)           %���ζ���ʽ���ƽ����%
r2= sum((y-b2).^2)          %���ζ���ʽ���ƽ����%
r3= sum((y-b3).^2)          %�Ĵζ���ʽ���ƽ����%
r4= sum((y-b4).^2) 
plot(x,y,'*')          %��*����x,yͼ��%
hold on
plot(x,b1, 'r')          %�ú�ɫ�߻���x,b1ͼ��%
hold on
plot(x,b2, 'g')         %����ɫ�߻���x,b2ͼ��%
hold on
plot(x,b3, 'b')         %����ɫo�߻���x,b3ͼ��%    
hold on
plot(x,b4, 'k')   
hold off
