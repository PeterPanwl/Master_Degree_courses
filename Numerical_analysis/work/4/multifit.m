function a=multifit(x,y,m)
% ����ʽ�������
% (x, y)Ϊԭʼ���ݵ��
% m������ʽ����ߴ���:
% a����϶���ʽ��ϵ��
N=length(x);
M=length(y);
if(N ~= M)
    error('x,yά����һ��');
end
c(1:(2*m+1))=0;
b(1:(m+1))=0;
for j=1:(2*m+1)          %���c��b
    for k=1:N
        c(j)=c(j)+x(k)^(j-1);
        if(j<(m+2))
            b(j)=b(j)+y(k)*x(k)^(j-1);
        end
    end
end
C(1,:)=c(1:(m+1));
for s=2:(m+1)
    C(s,:)=c(s:(m+s));
end
a=C\ b';   % ������ϵ��

