A = [a,b,c]
B = [d,e,f]
C = [a,b,c]

union(A,B,C) :- (C(H|T)=A(H|T); C(H|T)=B(H|T)) 
