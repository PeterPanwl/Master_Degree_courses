!--THIS ARTICLE IS WRITTEN IN ANSI��GB18030��
!
!������������ɭ���������������Ļ��֡�
!���������ֱ��ǣ�f(x)=sin3x+cosx, g(x)=5x^3+2x-10, h(x)=1/(1+x^2)
!��������ֱ��ǣ�(0��pi/6)��(0,10), (0,1)
!��Ҫ�󣬱���������ɭ�㷨��ʵ��д���Ӻ�����
!��������gfortran����ͨ������������Ϊ��gfortran 1.f95 sim.f95
!ע�⣺sim.f95����Ӻ�����Ϊ���������룡
!
!��дʱ�䣺2014��12��23�գ����ߣ�����
IMPLICIT NONE
!�����ֵ�ͱ�������
INTEGER(KIND=8)::status,n,i!status�洢IOSTAT�־䷵�ص�ֵ��n�Ƿ�����������i��ѭ��������
CHARACTER(LEN=30)::j1
REAL(KIND=8),PARAMETER::pi=3.14159265358979!pi��Բ����
REAL(KIND=8)::h,sum,result!h�ǲ�����sum�Ƕ˵㺯��ֵ֮�ͣ�result�����յļ�����
REAL(KIND=8),ALLOCATABLE,DIMENSION(:)::a,b!a��Ź�ʽ�и�i�b��Ź�ʽ�и�i-1/2��
REAL(KIND=8)::sim!sim������ɭ����Ӧ�ĺ���
!����ִ�в���
!��֪�û�����ʹ�÷���
1000 FORMAT(A)
1010 FORMAT(A,A)
WRITE(*,1000)'==================================================================='
WRITE(*,1000)'�����ܣ�������������ɭ���������������Ļ���'
WRITE(*,1000)'�������������ֱ��ǣ�f(x)=sin3x+cosx, g(x)=5x^3+2x-10, h(x)=1/(1+x^2)'
WRITE(*,1000)'��������ֱ��ǣ�(0��pi/6)��(0,10), (0,1)'
WRITE(*,1000)'==================================================================='
!f(x)��ʼ
!��ȡ����
WRITE(*,1000)'������f(x)�ָ�Ϊ��������'
READ(*,*,IOSTAT=status)n
IF(.NOT.(status==0))THEN
	WRITE(*,*)'����ֵ�����������������'
	STOP
END IF
IF(.NOT.((n>0)))THEN
	WRITE(*,*)'����ֵС��1������������Ҫ��һ�����������'
	STOP
END IF
!���ݶ�����ɣ����û���������ֵ
WRITE(j1,*)n
WRITE(*,1010)'������ķ��������ֱ���',TRIM(ADJUSTL(j1))
!���㿪ʼ
h=(pi/6.)/REAL(n)
ALLOCATE(a(1:n-1))
ALLOCATE(b(1:n))
DO i=1,n-1
a(i)=(SIN(3.*(h*i)))+COS((h*i))
END DO
DO i=1,n
b(i)=(SIN(3.*((h*i)-(h/2.))))+COS(((h*i)-(h/2.)))
END DO
sum=(SIN(0.)+COS(0.))+(SIN(pi/6.)+COS(pi/6.))
result=sim(a,b,sum,h,n)
WRITE(j1,*)result
WRITE(*,1010)'�����',TRIM(ADJUSTL(j1))
DEALLOCATE(a)
DEALLOCATE(b)
!f(x)�������
!g(x)��ʼ
!��ȡ����
WRITE(*,1000)'������g(x)�ָ�Ϊ��������'
READ(*,*,IOSTAT=status)n
IF(.NOT.(status==0))THEN
	WRITE(*,*)'����ֵ�����������������'
	STOP
END IF
IF(.NOT.((n>0)))THEN
	WRITE(*,*)'����ֵС��1������������Ҫ��һ�����������'
	STOP
END IF
!���ݶ�����ɣ����û���������ֵ
WRITE(j1,*)n
WRITE(*,1010)'������ķ��������ֱ���',TRIM(ADJUSTL(j1))
!���㿪ʼ
h=10./REAL(n)
ALLOCATE(a(1:n-1))
ALLOCATE(b(1:n))
DO i=1,n-1
a(i)=5.*((h*i)**3)+2.*(h*i)-10.
END DO
DO i=1,n
b(i)=5.*(((h*i)-(h/2.))**3)+2.*((h*i)-(h/2.))-10.
END DO
sum=5.*(0.**3)+2.*0.-10.+5.*(10.**3)+2.*10.-10.
result=sim(a,b,sum,h,n)
WRITE(j1,*)result
WRITE(*,1010)'�����',TRIM(ADJUSTL(j1))
DEALLOCATE(a)
DEALLOCATE(b)
!h(x)�������
!h(x)��ʼ
!��ȡ����
WRITE(*,1000)'������h(x)�ָ�Ϊ��������'
READ(*,*,IOSTAT=status)n
IF(.NOT.(status==0))THEN
	WRITE(*,*)'����ֵ�����������������'
	STOP
END IF
IF(.NOT.((n>0)))THEN
	WRITE(*,*)'����ֵС��1������������Ҫ��һ�����������'
	STOP
END IF
!���ݶ�����ɣ����û���������ֵ
WRITE(j1,*)n
WRITE(*,1010)'������ķ��������ֱ���',TRIM(ADJUSTL(j1))
!���㿪ʼh(x)=1/(1+x^2)
h=1./REAL(n)
ALLOCATE(a(1:n-1))
ALLOCATE(b(1:n))
DO i=1,n-1
a(i)=1./(1.+(h*i)**2)
END DO
DO i=1,n
b(i)=1./(1.+((h*i)-(h/2.))**2)
END DO
sum=1./(1.+0.**2)+1./(1.+1.**2)
result=sim(a,b,sum,h,n)
WRITE(j1,*)result
WRITE(*,1010)'�����',TRIM(ADJUSTL(j1))
DEALLOCATE(a)
DEALLOCATE(b)
!g(x)�������
END
