%ʵ��4.1.12
x=pi*[0 1/6 1/3];
y=[1 sqrt(3)/2 0.5];
%multifit(x,y,2)
disp('��һ��')
polyfit(x,y,1)
disp('�ڶ���')
x1=pi*pi*[0 1/36 1/9]
polyfit(x1,y,1)
disp('������')
fun=inline('c(1)*exp(c(2)*x)','c','x');
lsqcurvefit(fun,[0,0],x,y)
