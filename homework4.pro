%1. Negative number position list
negative(L,Res):-negative(L, [],0, Res).
negative([], L, _, Res):-reverse(L, Res).
negative([X|Tail], L, Pos, Res):-P is Pos+1, X<0, negative(Tail, [Pos|L], P, Res); P is Pos+1,negative(Tail, L, P, Res). 

%2. Substitute chosen element with "change_done"
substitute(List, El, Res):-substitute(List, El, [], Res).
substitute([], _, Temp, Res):- reverse(Temp, Res), !.
substitute([X|Tail], El, Temp, Res):- (X==El, TempR=[change_done|Temp], substitute(Tail, El, TempR, Res)); (X\=El, TempR=[X|Temp], substitute(Tail, El, TempR, Res)).

%3. Convert a list of arabic numerals into roman numerals.
convert(List, Res):-convert(List, [], Res).
convert([], Temp, Res):- reverse(Temp, Res).
convert([X|List], Temp, Res):-toRoman(X, '', Y), TempR=[Y|Temp], convert(List, TempR, Res).
toRoman(0, L,Res):-Res=L, !.
toRoman(N,L, Res):-(N<4,atom_concat(L, 'I',Nl), Nn is N-1, toRoman(Nn, Nl, Res));
(N==4, atom_concat(L,'IV',Nl), Nn is N-4, toRoman(Nn, Nl, Res));(N<9, atom_concat(L, 'V',Nl), Nn is N-5, toRoman(Nn, Nl, Res));(N==9,atom_concat(L,'IX',Nl), Nn is N-9, toRoman(Nn, Nl, Res));(N<40, atom_concat(L, 'X',Nl), Nn is N-10, toRoman(Nn, Nl, Res));(N<50, atom_concat(L, 'XL', Nl), Nn is N-40, toRoman(Nn, Nl, Res));(N==50, atom_concat(L, 'L', Nl), Nn is N-50, toRoman(Nn, Nl, Res)).

%4. Shift list by 1 position to the right
shiftRight(X,Res):- shiftRight(X, [], Res).
shiftRight([L|[]], Curr, Res):- Res=[L|Curr].
shiftRight([L|List], Curr, Res):- Li=[L], append(Curr, Li, X), shiftRight(List, X ,Res).

%5. Multiply matrix by vector.
multiply(Mat, Vec, Res):-multiply(Mat, Vec, [], Res).
multiply([], Vec, Temp, Res):- reverse(Temp, Res).
multiply([X|Mat], Vec, Temp, Res):-rowMult(X, Vec, 0, R), multiply(Mat, Vec, [R|Temp], Res).
rowMult([], [], T, R):- R is T.
rowMult([X|Row], [Y|Vec], Temp, R):-Nt is Temp+(X*Y), rowMult(Row, Vec, Nt, R).

:-initialization(run).
run:- write('List of negative number positions. Input: [1, 4, -2, -6, 3, -5] \nResult:  '), negative([1, 4, -2, -6, 3, -5], Res), write(Res), write('\nSubstitute element with change_done. Chosen element=3. Input: [1, 2, 3, 4, 3, 5]  \nResult:  '), substitute( [1, 2, 3, 4, 3, 5], 3, R), write(R), write('\nConvert a list of arabic to Roman numerals. Input: [8, 5, 38, 50, 46, 2]   \nResult:  '), convert([8, 5, 38, 50, 46, 2], Re), write(Re), write('\nShift list by 1 position to the right. Input: [2, 3, 4, 5, 1]  \nResult:  '), shiftRight([2, 3, 4, 5, 1], Resu), write(Resu), write('\nMultiply matrix by vector. Input: [[1, 3, 4, 2], [3, 2, 1, 4], [4, 3, 2, 1]], [1, 2, 3, 4] \nResult:  '), multiply([[1, 3, 4, 2], [3, 2, 1, 4], [4, 3, 2, 1]], [1, 2, 3, 4], Resul), write(Resul).
