PROGRAM sort
!--THIS ARTICLE IS WRITTEN IN ANSI��GB18030��--
!
!�������ȡһ��ʵ�������飬Ȼ�����Щ����С�������С�����¼��Ҫ������Ӧ�÷���һ�������ܹ���Ȩ�޶�ȡ��˳���ļ��У���ÿһ��ӦΪһ��ʵ����
!
!��дʱ�䣺2014��11��7�գ����ߣ�����
IMPLICIT NONE
!�����ֵ�ͱ�������
	INTEGER::i
	INTEGER::nvals=0
	INTEGER::status
	REAL::temp
	LOGICAL::done
	CHARACTER(len=20)::filename
	REAL,ALLOCATABLE,DIMENSION(:)::a
!����ִ�в���
!��֪�û�����ʹ�÷���
WRITE(*,*)'==================================================================='
WRITE(*,*)'�����ܣ��������ȡһ��ʵ�������飬Ȼ�����Щ����С�������С�'
WRITE(*,*)'����¼��Ҫ������Ӧ�÷���һ��������Ȩ�޶�ȡ���ļ���С��20���ַ���˳���ļ��У���ÿһ��ӦΪһ��ʵ����'
WRITE(*,*)'��дʱ�䣺2014��11��7�գ����ߣ�����'
WRITE(*,*)'==================================================================='
!��ȡ�����ļ�����
WRITE(*,*)'���ڣ��������ļ�����'
READ(*,1000)filename
1000 FORMAT(A20)
!�������ļ�
OPEN(UNIT=1,FILE=filename,STATUS='OLD',ACTION='READ',IOSTAT=status)
!�ж������ļ��Ƿ�򿪳ɹ�
IF(status==0) THEN !����򿪳ɹ�������¼�������a
	!�����ļ������ݣ����ļ��е�ʵ��������ֵ��nvals
	DO
		READ(1,*,IOSTAT=status) temp
		IF(status/=0) EXIT
		nvals=nvals+1
	END DO
	!�ص��ļ��Ŀ�ͷ
	REWIND(UNIT=1)
	!���ɷ�������aȷ�����С
	ALLOCATE(a(1:nvals),STAT=status)
	IF(status/=0)THEN !����������ݹ�����������֪�û��ڴ治�������䲻�ɹ���������ֹ
		WRITE(*,*)'�ڴ治�㣬������ֹ'
		STOP
	END IF
	!����ļ��ܹ��ɹ������ܽ�����������ֵ���ɷ������飬���û�����ԭʼ����
	WRITE(*,*)'�ļ��򿪳ɹ����������ԭʼ������'
	DO i=1,nvals
		READ(1,*) a(i)
		WRITE(*,*)i,a(i)
	END DO
ELSE!����ļ��򿪲��ɹ�����֪�û�,����ֹ����
	WRITE(*,*)'�ļ���ʧ�ܣ�������ֹ��'
	STOP
END IF
!��ð���㷨����������innerѭ���У����i��i+1����ʵ���Ĵ�С�����ǰ�ߴ�͵�����˳��
!ѭ��i=1,navls-1��Ӧ��1�����ݵ������ڶ�������Ϊѭ�����������i+1���������һ��
!ʵ���ǲ���Ƚ��˵ģ����i=1,navls���������Խ����󣩡�
!outerѭ��������ִ��inner���Է�������ʵ��������������Ҫ�������ʱ��done�����������棬��EXIT���׽���˳�ѭ����
outer: DO
	done=.TRUE.
	inner:DO i=1,nvals-1
		IF(a(i)>a(i+1)) THEN
			temp=a(i)
			a(i)=a(i+1)
			a(i+1)=temp
			done=.FALSE.
		END IF
	END DO inner
	IF(done)EXIT
END DO outer
!��Ļ��������
WRITE(*,*)'������ɣ������'
DO i=1,nvals		
	WRITE(*,*)i, a(i)
END DO
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
		DO i=1,nvals		
			WRITE(3,*)i, a(i)
		END DO
		WRITE(*,*)'���ݴ洢��ɣ�����������ټ���'
	ELSE!����ļ��򿪲��ɹ�����֪�û����������ļ���
		WRITE(*,*)'�ļ�����ʧ�ܣ��������Ѿ�����ͬ���ļ����ļ���'
		WRITE(*,*)'Ϊ�������ݣ������������ʹ�õ��ļ����������������'
	END IF
	IF(status==0) EXIT
END DO
END PROGRAM sort
