IMPLICIT NONE
	INTEGER::i,j,r!i�Ƿ�������,j�Ƕ�ȡ��ȷ�ж��ñ���,r��ѭ��������
	REAL(KIND=4)::h,s,temp!h��һ�ε�·��,s����·��
WRITE(*,*)'==================================================================='
WRITE(*,*)'THIS PROGRAM IS SHOWN IN ANSI��GB18030��'
WRITE(*,*)'��������С�򷴵���ҵ'
WRITE(*,*)'��дʱ�䣺2014��11��27�գ����ߣ�����'
WRITE(*,*)'==================================================================='
WRITE(*,*)'������߶�'
READ(*,*,IOSTAT=j)h
IF(.NOT.(j==0))THEN
	WRITE(*,*)'����ֵ��ʵ�������������'
	STOP
END IF
IF(h<=0)THEN
	WRITE(*,*)'�����˷����������������'
	STOP
END IF
WRITE(*,*)'�����뷴������'
READ(*,*,IOSTAT=j)i
IF(.NOT.(j==0))THEN
	WRITE(*,*)'����ֵ�����������������'
	STOP
END IF
IF(i<=0)THEN
	WRITE(*,*)'����ֵ�����������������'
	STOP
END IF
s=h
DO r=1,i
	h=h/2
	temp=(s+(2*h))
	IF(s==temp)THEN
		WRITE(*,*)'��Ϊ����ԭ�򣬼�����ǰ����'
		WRITE(*,*)'������㵽�˵�',r-1,'����ײ'
	END IF
	IF(s==temp)EXIT
	s=temp
	write(*,*)h,s
END DO
WRITE(*,*)'���һ�η����߶���',h,'�ܵ�·����',s-h
WRITE(*,*)'�������'
END PROGRAM
