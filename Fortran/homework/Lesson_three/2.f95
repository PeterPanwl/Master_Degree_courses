!--THIS ARTICLE IS WRITTEN IN ANSI��GB18030��--
!
!������������sum=sqrt(x^3+y^4)+tan(x^2+y^2)
!
!���������ʱӦ����2.f95�����ļ�����tan.f95��sqrt.f95������gfortran���룬����Ϊ��
!gfortran 2.f95 sqrt.f95 tan.f95
!
!��дʱ�䣺2014��12��4�գ����ߣ�����
IMPLICIT NONE
	REAL::a,b,x,y,mytan
	INTEGER::j
WRITE(*,*)'==================================================================='
WRITE(*,*)'THIS PROGRAM IS SHOWN IN ANSI��GB18030��'
WRITE(*,*)'�����ܣ�����sum=sqrt(x^3+y^4)+tan(x^2+y^2)'
WRITE(*,*)'��дʱ�䣺2014��12��4�գ����ߣ�����'
WRITE(*,*)'==================================================================='
WRITE(*,*)'������x'
READ(*,*,IOSTAT=j)x
IF(.NOT.(j==0))THEN
	WRITE(*,*)'����Ĳ�������'
	WRITE(*,*)'�������'
	STOP
END IF
WRITE(*,*)'����y'
READ(*,*,IOSTAT=j)y
IF(.NOT.(j==0))THEN
	WRITE(*,*)'����Ĳ�������'
	WRITE(*,*)'�������'
	STOP
END IF
IF((x**3+y**4)<0)THEN
	WRITE(*,*)'�������ܿ���'
	WRITE(*,*)'�������'
	STOP
END IF
IF(ABS((x**2+y**2)-3.14159)<0.0001)THEN
	WRITE(*,*)'k*pi+pi/2������ֵ'
	WRITE(*,*)'�������'
	STOP
END IF
		CALL mysqrt(a,x,y)
b=mytan
WRITE(*,*)a+b
END PROGRAM
