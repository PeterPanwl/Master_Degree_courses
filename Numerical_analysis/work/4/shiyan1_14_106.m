x = -1:3;
y = x.^4+3*x.^3-1;
disp('����ʽ���')
nafit(x,y,3)
disp('��������ʽ���')
naorthfit(x,y,3)