!--THIS ARTICLE IS WRITTEN IN ANSI��GB18030��--
!
!�����������e�Ľ���ֵ�����㹫ʽΪ��
!e=1+1/1!+1/2!+����+1/n!+����
!
!������ʹ���˺����ӳ��������г����ڲ��ӳ���͵ݹ鷽���ֱ���㡣��n��>1E8ʱֹͣ���㡣
!
!���������ʱӦ����1.f95�����ļ�����digui.f95��sub.f95��fun.f95������gfortran���룬����Ϊ��
!gfortran 1.f95 digui.f95 sub.f95 fun.f95
!
!��дʱ�䣺2014��12��4�գ����ߣ�����
IMPLICIT NONE
INTEGER(KIND=8)::n,result
INTEGER::fun
REAL(KIND=8)::e
WRITE(*,*)'==================================================================='
WRITE(*,*)'THIS PROGRAM IS SHOWN IN ANSI��GB18030��'
WRITE(*,*)'�����ܣ�����e�Ľ���ֵ�����㹫ʽΪ��e=1+1/1!+1/2!+����+1/n!+����'
WRITE(*,*)'��дʱ�䣺2014��12��4�գ����ߣ�����'
WRITE(*,*)'==================================================================='
!====�����ӳ��򷽷�======
e=0.
n=0
result=0
DO
	result=fun(n)
	e=e+(1/REAL(result))!�����������ּ��㷽����Ϊ�������ͱ�����ʵ�ͱ����ĳ�����ϼ��㣬��REALת����������
	IF(result>1e8)EXIT
	n=n+1
END DO
WRITE(*,*)'�����ӳ��򷽷�'
WRITE(*,*)'e='
WRITE(*,*)e
!====�����ӳ��򷽷�======
!====�����г��򷽷�======
e=0.
n=0
result=0
DO
	CALL sub(n,result)
	e=e+(1/REAL(result))
	IF(result>1e8)EXIT
	n=n+1
END DO
WRITE(*,*)'�����г��򷽷�'
WRITE(*,*)'e='
WRITE(*,*)e
!====�����г��򷽷�======
!====�ڲ��ӳ��򷽷�======
e=0.
n=0
result=0
DO
	result=jiechen(n)
	e=e+(1/REAL(result))
	IF(result>1e8)EXIT
	n=n+1
END DO
WRITE(*,*)'�ڲ��ӳ��򷽷�'
WRITE(*,*)'e='
WRITE(*,*)e
!====�ڲ��ӳ��򷽷�======
!====�ݹ鷽��======
e=0.
n=0
result=0
DO
	CALL factorial(n,result)
	e=e+(1/REAL(result))
	IF(result>1e8)EXIT
	n=n+1
END DO
WRITE(*,*)'�ݹ鷽��'
WRITE(*,*)'e='
WRITE(*,*)e
!====�ݹ鷽��======
CONTAINS
	INTEGER FUNCTION jiechen(n)
	INTEGER(KIND=8)::i,j,n
	j=1
	DO i=1,n
		j=j*i
	END DO
	jiechen=j
	END
END
