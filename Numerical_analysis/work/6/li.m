clear;dyfun=inline('y-2*x/y');
disp('ŷ����ʽ')
[x,y]=naeuler(dyfun,[0,1],1,0.2);[x,y]
disp('��ʽŷ����ʽ')
[x,y]=naeulerb(dyfun,[0,1],1,0.2);[x,y]
disp('�Ľ�ŷ����ʽ')
[x,y]=naeuler2(dyfun,[0,1],1,0.2);[x,y]
