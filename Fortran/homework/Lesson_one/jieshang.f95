!--THIS ARTICLE IS WRITTEN IN ANSI (GB18030)
!
!�������ȡ������ά���ꡣ��������άʵ���������⺯���Ĳ��ֵ�ĺ������꣬Ȼ��������Щ���꣬�������
!����¼��Ҫ������Ӧ�÷���һ�������ܹ���Ȩ�޶�ȡ��˳���ļ��С��ļ���ÿһ��һ����ĺ������ꡣ��һ���Ǻ����꣬�ڶ�����������
!����������֮�����������������ȫ��ʹ���ļ������̶ȱ����û����ݣ�¼�����ݿɲ����մ�С˳��¼�룬������Զ�����
!
!��дʱ�䣺2014��11��21�գ����ߣ�����
IMPLICIT NONE
!�����ֵ�ͱ�������
	INTEGER::i,j
	INTEGER::nvals=0
	INTEGER::status
	REAL::temp1,temp2
	LOGICAL::done
	CHARACTER(len=20)::filename
	REAL,ALLOCATABLE,DIMENSION(:,:)::a
!����ִ�в���
!��֪�û�����ʹ�÷���
WRITE(*,*)'==================================================================='
WRITE(*,*)'THIS PROGRAM IS SHOWN IN ANSI��GB18030��'
WRITE(*,*)'�����ܣ�������������⺯���Ĳ��ֵ�ĺ������꣬��������'
WRITE(*,*)'����¼��Ҫ������Ӧ����һ���ļ��С��ļ���ÿһ��Ϊһ����ĺ������ꡣ��һ���Ǻ����꣬�ڶ����������ꡣ'
WRITE(*,*)'��дʱ�䣺2014��11��21�գ����ߣ�����'
WRITE(*,*)'==================================================================='
!��ȡ�����ļ�����
WRITE(*,*)'���ڣ�����������ļ������ļ����ַ����ó���20���ַ���'
READ(*,1000)filename
1000 FORMAT(A20)
!�������ļ�
OPEN(UNIT=1,FILE=filename,STATUS='OLD',ACTION='READ',IOSTAT=status)
!�ж������ļ��Ƿ�򿪳ɹ�
IF(status==0) THEN !����򿪳ɹ�������¼�������a
	!�����ļ������ݣ����ļ��е�ʵ��������ֵ��nvals
	DO
		READ(1,*,IOSTAT=status) temp1,temp2
		IF(status/=0) EXIT
		nvals=nvals+1
	END DO
	!�ص��ļ��Ŀ�ͷ
	REWIND(UNIT=1)
	!���ɷ�������aȷ�����С
	ALLOCATE(a(0:nvals-1,-1:nvals-1),STAT=status)
	IF(status/=0)THEN !����������ݹ�����������֪�û��ڴ治�������䲻�ɹ���������ֹ
		WRITE(*,*)'�ڴ治�㣬������ֹ'
		STOP
	END IF
	!����ļ��ܹ��ɹ������ܽ�����������ֵ���ɷ������飬���û�����ԭʼ����
	WRITE(*,*)'�ļ��򿪳ɹ����������ԭʼ������'
	DO i=0,nvals-1
		READ(1,*) a(i,-1),a(i,0)
		WRITE(*,*)i,a(i,-1),a(i,0)
	END DO
ELSE!����ļ��򿪲��ɹ�����֪�û�,����ֹ����
	WRITE(*,*)'�ļ���ʧ�ܣ�������ֹ��'
	STOP
END IF
WRITE(*,*)'����ԭʼ���ݹ�',nvals,'��','�����㵽',nvals-1,'�׾���'
!��ð���㷨�����ݰ���������С����������inner1ѭ���У����i��i+1����ʵ���Ĵ�С�����ǰ�ߴ�͵�����˳��
!ѭ��i=1,navls-1��Ӧ��1�����ݵ������ڶ�������Ϊѭ�����������i+1���������һ��
!���ǲ���Ƚ��˵ģ����i=1,navls���������Խ����󣩡�
!outer1ѭ��������ִ��inner1���Է�������ʵ��������������Ҫ�������ʱ��done�����������棬��EXIT���׽���˳�ѭ����
!��Ļ��������
outer1: DO
	done=.TRUE.
	inner1:DO i=0,nvals-2
		IF(a(i,0)>a(i+1,0)) THEN
			temp1=a(i,-1)
			temp2=a(i,0)
			a(i,-1)=a(i+1,-1)
			a(i,0)=a(i+1,0)
			a(i+1,-1)=temp1
			a(i+1,0)=temp2
			done=.FALSE.
		END IF
	END DO inner1
	IF(done)EXIT
END DO outer1
WRITE(*,*)'������ɣ�'
DO i=0,nvals-1		
	WRITE(*,*)i, a(i,-1),a(i,0)
END DO
WRITE(*,*)'==============================='
WRITE(*,*)'������ɣ�'
WRITE(*,*)'==============================='
!�����outer2ѭ���Ǳ�����ĺ��Ĵ��룬���Ĵ����5��
!outer2ѭ��������ǵ�j�׾���Ľ����
!inner2ѭ������ĸ��׾���Ľ�������ݾ��Ǿ���Ķ���ʽ
!ע�⣺aѭ������������ݺ�������ݡ��У�0��ʼ���У�-1��ʼ��ǰ���зŵ����������ݣ�֮��Ĳ��ַ����������
!������ݷ����Ԫ���ǰ��վ���������
!���㷨��ȱ�����������n�����ݵ�ľ�����˷�1/2����n����n-1������Ԫ�ص��ڴ棬�˷��ʼ���Ϊһ��
outer2: DO j=1,nvals-1
	WRITE(filename,*)j
	WRITE(*,*)'#',TRIM(ADJUSTL(filename)),'�ײ��̽����ʼ'
	inner2: DO i=j,nvals-1
		a(i,j)=(a(i,j-1)-a(i-1,j-1))/(a(i,-1)-a(i-j,-1))
		WRITE(*,*)a(i,j)
	END DO inner2
	WRITE(*,*)'#',TRIM(ADJUSTL(filename)),'�ײ��̽������'
END DO outer2
!ѯ���û��Ƿ�����ļ������̶ȱ�����������ֱ����ȷ�û���;�Źرճ���
DO
	WRITE(*,*)'�Ƿ���Ҫ���ļ����Ϊ�ļ���y/Y=�ǣ�n/N=��'
	READ(*,*)filename
	IF( (filename=='y').OR.(filename=='Y') )EXIT
	IF( (filename=='n').OR.(filename=='N') )THEN
		WRITE(*,*)'���������',TRIM(ADJUSTL(filename)),'������������ټ���'
		STOP
	ELSE 
		WRITE(*,*)'���������',TRIM(ADJUSTL(filename))
		WRITE(*,*)'������ֻ�ܽ���y/Y����n/N'
		WRITE(*,*)'Ϊ�˱������ݣ����ǰ��������룬���򲻻�����ֹͣ��'
	END IF
END DO
!ѯ���û�����ļ�������������������ļ����������̶ȱ�������������������
DO
	WRITE(*,*)'������������ļ������ļ���������20���ַ�'
	READ(*,*)filename
	OPEN(UNIT=3,FILE=filename,STATUS='NEW',ACTION='READWRITE',IOSTAT=status)
	IF(status==0) THEN !����򿪳ɹ�������¼�������a
		WRITE(*,*)'�ļ������ɹ�!'
		DO j=1,nvals-1
			WRITE(filename,*)j
			WRITE(3,*)'#',TRIM(ADJUSTL(filename)),'�ײ��̽����ʼ'
			DO i=j,nvals-1
				WRITE(3,*)a(i,j)
			END DO
			WRITE(3,*)'#',TRIM(ADJUSTL(filename)),'�ײ��̽������'
		END DO
		WRITE(*,*)'���ݴ洢��ɣ�����������ټ���'
	ELSE!����ļ��򿪲��ɹ�����֪�û����������ļ���
		WRITE(*,*)'�ļ�����ʧ�ܣ��������Ѿ�����ͬ���ļ����ļ���'
		WRITE(*,*)'Ϊ�������ݣ������������ʹ�õ��ļ����������������'
	END IF
	IF(status==0) EXIT
END DO
END PROGRAM
