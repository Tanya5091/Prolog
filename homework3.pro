fill(-1):-!.
fill(X):-asserta(d(X)), X1 is X-1, fill(X1).

%1. Find all 3-digit numbers that when you take the middle digit out, they become their divisors. All digits are odd. 
findAllDivs:-forall(findDiv(X), (write(X), write(' '))).
findDiv(X):- d(A), A>0, A mod 2 =\= 0, d(B), B mod 2 =\= 0, d(C), C mod 2 =\= 0, 
(A*100+B*10+C) mod (A*10+C) =:= 0, X is A*100+B*10+C.

%2. Find four digit number where first and second digits and third and fourth are the same and this number is an exact square.
exactSquare(X):-d(A), A>0, d(B), X is A*1000+A*100+B*10+B, (round(sqrt(X)))**2 =:= X.

%3. How many numbers are there between 1 and 1998 that can`t be divided by either of the following numbers: 6, 10, 15?
undivided(X):- task(1, 0, X).
task(A, B, C):-A<1999,
              (A mod 10)=\=0,
              (A mod 15)=\=0,
              (A mod 6)=\=0, B1 is B+1, A1 is A+1, task(A1, B1, C);
              A<1999, A1 is A+1, task(A1, B, C);
              A>1998, C is B.

%4. Find smallest natural number that the sum of the next 11 numbers is a square.
smallest(X):-smallest1(X,1).
smallest1(X, Curr):- 
X1 is Curr**2, 
X2 is (Curr+1)**2, 
X3 is (Curr+2)**2, 
X4 is (Curr+3)**2, 
X5 is (Curr+4)**2, 
X6 is (Curr+5)**2, 
X7 is (Curr+6)**2, 
X8 is (Curr+7)**2, 
X9 is (Curr+8)**2, 
X10 is (Curr+9)**2, 
X11 is (Curr+10)**2, 
Sum is X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11,
((round(sqrt(Sum)))**2 =:= Sum, X is Curr, !; N is Curr+1, smallest1(X, N)).

%5. Find in how many digits a combination of 1998 will appear again.
findPeriod(X):- findPer(X, 1, 9, 9, 8, 0).
findPer(X, A, B, C, D, Curr):- E is (A+B+C+D) mod 10, (B =:= 1, C =:= 9, D=:=9, E=:=8, NewCurr is Curr+1, X is NewCurr, !; N is Curr+1, findPer(X, B, C, D, E, N)).


