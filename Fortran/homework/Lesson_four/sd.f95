!--THIS ARTICLE IS WRITTEN IN ANSI��GB18030��--
!
!������Ҫ������һ���ļ����ƣ��ж�����ļ��Ƿ���ڣ�������ھͰ���ɾ���������ھ���ʾ������Ϣ��
!
!��дʱ�䣺2014��12��16�գ����ߣ�����
IMPLICIT NONE
	CHARACTER(len=20)::filename,err_str
	INTEGER::i
WRITE(*,*)'�������ļ��������ļ�����ɾ����'
READ(*,*)filename
OPEN(UNIT=1,FILE=filename,STATUS='OLD',IOSTAT=i)
IF (i==0)THEN
	CLOSE(UNIT=1,STATUS='DELETE',IOSTAT=i)
ELSE
WRITE(*,*)'����û������ļ�'
END IF
END
