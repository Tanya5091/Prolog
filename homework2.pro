%1.Division with remainder
division(Dividend, Divisor, Quotient, Remainder):-division(Dividend, Divisor, Quotient, Remainder,0).
division(Dividend, Divisor, Counter, Dividend ,Counter):- Dividend<Divisor,!.
division(Dividend, Divisor, Quotient, Remainder,Counter):-Tdend is Dividend-Divisor,Tcount is Counter+1, division(Tdend, Divisor, Quotient, Remainder ,Tcount).

%2. Power
%2.1 Simple power
power(_,0,1):-!.
power(A,B,Res):- Bt is B-1, power(A, Bt, Temp), Res is Temp*A.

%2.2 Logarythmic power
logPower(_,0,1):-!.
logPower(A,B,Res):-(B mod 2)==0, Bt is B/2, power(A, Bt, Temp), Res is Temp*Temp.
logPower(A,B,Res):-Bt is B-1, power(A, Bt, Temp), Res is Temp*A.

%3. Fibonacci
%3.1 RecursiveFibonacci
recFibonacci(0,0):-!.
recFibonacci(1,1):-!.
recFibonacci(Pos, Val):- P1 is Pos-1, P2 is Pos-2, recFibonacci(P1, V1), recFibonacci(P2,V2), Val is V1+V2.

%3.2 IterativeFibonacci
recFibonacci(0,0):-!.
recFibonacci(1,1):-!.
iterFibonacci(Pos, Val):-iterFibonacci(Pos, Val, 0, 1,1).
iterFibonacci(Pos, Prev, Preprev, Prev, Pos).
iterFibonacci(Pos, Val, Preprev, Prev, Posit):-Tres is Preprev+Prev, P is Posit+1, iterFibonacci(Pos, Val, Prev, Tres, P).

%4. Break a number into simple multipliers
multipliers(X):- X<2, !.
multipliers(X):- simple(X, 2, Res), NewX is X div Res, write(Res), write(' '), multipliers(NewX).

simple(N, Mult, Res):-(N mod Mult)<1, Res is Mult, !.
simple(N, Mult, Res):-NewMult is Mult+1, simple(N, NewMult, Res).

%5. Calculate sum of 1/1! + 1/2! + 1/3! + ... 1/n!
sum(N, Res):-sum(N, Res, 1, 1, 1),!.
sum(N, Res, Sum, El, Pos):-N is Pos, Res is Sum, !.
sum(N, Res, Sum, El, Pos):-Npos is Pos+1, NewEl is El/Npos, Nsum is Sum + NewEl, sum(N,Res, Nsum, NewEl, Npos).
