function yt=LagInterp2(x,y,xt)
% �������ղ�ֵ
% x,y:��ֵ����
% xt:���������ղ�ֵ����Ҫ������Ա����������Ƕ��
% yt:���������ղ�ֵ���������x_t��Ӧ�ĺ���ֵ����
n=length(x);
ny=length(y);
if n~=ny
    error('��ֵ�ڵ�x�뺯��ֵy��һ��');
end
m=length(xt);
yt=zeros(1,m);
for k=1:n
    lk=ones(1,m);
    for j=1:n
        if j~=k,
            lk=lk.*(xt-x(j))/(x(k)-x(j));
        end
    end
    yt=yt+y(k)*lk;
end

