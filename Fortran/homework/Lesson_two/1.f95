IMPLICIT NONE
	REAL::i
	INTEGER::j
WRITE(*,*)'==================================================================='
WRITE(*,*)'THIS PROGRAM IS SHOWN IN ANSI��GB18030��'
WRITE(*,*)'�����ܣ�ѧ���ɼ��������'
WRITE(*,*)'�ɼ�Ӧ��0��100֮�䡣90-100Ϊ�ţ�80-89Ϊ����70-79Ϊ�У�60-69Ϊ���񣬵���60Ϊ������'
WRITE(*,*)'��дʱ�䣺2014��11��27�գ����ߣ�����'
WRITE(*,*)'==================================================================='
WRITE(*,*)'������ɼ�'
READ(*,*,IOSTAT=j)i
IF(j==0)THEN
	IF((i>=90).AND.(i<=100))THEN
		WRITE(*,*)'�ɼ�Ϊ��'
	ELSE IF((i>=80).AND.(i<90))THEN
		WRITE(*,*)'�ɼ�Ϊ��'
	ELSE IF((i>=70).AND.(i<80))THEN
		WRITE(*,*)'�ɼ�Ϊ��'
	ELSE IF((i>=60).AND.(i<70))THEN
		WRITE(*,*)'�ɼ�Ϊ����'
	ELSE IF((i>=0).AND.(i<60))THEN
		WRITE(*,*)'�ɼ�Ϊ������'
	ELSE
		WRITE(*,*)'��������ֲ���0��100'
	END IF
ELSE
	WRITE(*,*)'����Ĳ�������'
END IF
WRITE(*,*)'�������'
END PROGRAM
