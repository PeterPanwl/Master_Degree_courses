SUBROUTINE UKE1(X,Y,KE)
IMPLICIT NONE
INTEGER::I,J
REAL::S
REAL,DIMENSION(1:3)::A,B
REAL,INTENT(IN),DIMENSION(1:3)::X,Y
REAL,INTENT(OUT),DIMENSION(1:3,1:3)::KE
A(1)=Y(2)-Y(3)
A(2)=Y(3)-Y(1)
A(3)=Y(1)-Y(2)
B(1)=X(3)-X(2)
B(2)=X(1)-X(3)
B(3)=X(2)-X(1)
S=2.*(A(1)*B(2)-A(2)*B(1))
DO 10 I=1,3
DO 10 J=1,I
10 KE(I,J)=(A(I)*A(J)+B(I)*B(J))/S
RETURN
END