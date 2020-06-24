%Examples
%Binary trees

%tree(tree(tree(tree(tree(nil,1,nil),2,nil),3,nil),4,nil),8, tree(tree(nil,9,nil), 10,nil))
%Answers: 1.trace = [1,2,3,4,8,9,10], 2. number of leaves =2, 3. height = 5, 4. number of nodes= 7, 7_1. check if is binary = yes. 

% tree(tree(tree(tree(nil,1,nil),2,nil),3,tree(nil,4,nil)), 5,tree(tree(tree(nil,6,nil),7,tree(nil,8,nil)),9,tree(tree(nil,10,nil),11,tree(nil,12,tree(nil,13,nil)))))
%Answers 1.trace = [1,2,3,4,5,6,7,8,9,10,11,12,13], 2. number of leaves =6, 3. height = 5, 4. number of nodes= 13, 7_1. check if is binary = yes.
 
% 2-3 trees
% v2(nil,9,v3(v2(nil,12,nil),15,v2(v2(nil,16,nil),18,nil),19,v3(nil,20,nil,22,v2(nil,26,nil))))
%Answers 5. trace23=[9,12,15,16,18,19,20,22,26], 6. find23(15) =true, find23(13) = no, 7_2. check23=yes.

%not a binary tree
%tree(tree(tree(tree(tree(nil,1,nil),2,nil),3,nil),4,nil),8, tree(tree(nil,9,nil), 10))
%Answers 7_1. check if is binary = no.

%not a 2-3 tree
%v2(v3(v2(nil,12,nil),15,v2(v2(nil,16,nil),18,nil),19,v3(nil,20,nil,22,v2(nil,26,nil))))
%Answers 7_2. check if is binary = no.

make_tree(List,Tree):-make_tree(List,nil,Tree).
make_tree([],Tree,Tree):-!.
make_tree([H|T],Tree,TreeRes):-	add(Tree,H,Tree1),make_tree(T,Tree1,TreeRes).

add(nil, X, tree(nil,X,nil)):-!.
add(tree(L,A,R),X,tree(L1,A,R)):-X<A, add(L,X,L1),!.
add(tree(L,A,R),X,tree(L,A,R1)):-X>A, add(R,X,R1).

in_tree1(X, tree(_,X,_)):-!.
in_tree1(X,tree(L,Root,_)):- X<Root, in_tree(X,L),!.
in_tree1(X,tree(_,Root,R)):-X>Root, in_tree(X,R).

%1. Follow binary tree left to right.
trace(nil, []).
trace(tree(L, X, R), Res) :-trace(L, Lr), trace(R, Rr), append(Lr,[X|Rr],Res).

%2. Find number of leaves on the tree
leaves(nil, 0):-!.
leaves(tree(nil,_,nil), 1):-!.
leaves(tree(L,_,R), Res):-leaves(L, Lr), leaves(R, Rr), Res is Lr+Rr.

%3. Find tree height
height(nil, 0):-!.
height(tree(L,_,R), Res):- height(L, Lr), height(R, Rr), M is max(Lr, Rr), Res is 1+M.

%4. Find number of nodes in binary tree
nodes(nil, 0):-!.
nodes(tree(L, X, R), Res):- nodes(L, Lr), nodes(R, Rr), Res is 1+Rr+Lr.
%52
%5. Follow 2-3 tree left to right
trace23(nil, []):-!.
trace23(l(X), Temp):-Temp=[X].
trace23(v2(L, X, R), Res) :-trace23(L, Lr), trace23(R, Rr), append(Lr,[X|Rr],Res).
trace23(v3(L, X, M, Y, R), Res) :-trace23(L, Lr), trace23(M, Mr), append(Lr,[X|Mr],Tres),  trace23(R, Rr), append(Tres,[Y|Rr],Res).

%6. Find element in a 2-3 tree
find23(v2(L,T,R),X):-T==X;find23(L,X);find23(R,X).
find23(l(X), Y):-X==Y.
find23(v3(L,Tl,M,Tr,R),X):-Tl==X;Tr==X;find23(L,X);find23(M,X);find23(R,X).

%7. Check if the object is 
%7_1 binary tree
checkBinary(nil).
checkBinary(tree(L,_,R)):-checkBinary(L), checkBinary(R).

%7_2 2-3 tree
check23(nil).
check23(l(_)):-!.
check23(v2(L,_,R)):-check23(L),check23(R).
check23(v3(L, _, M, _, R)):-check23(L),check23(M),check23(R).
%71
:-initialization(run).
run:-write('Binary tree. Input: tree(tree(tree(tree(tree(nil,1,nil),2,nil),3,nil),4,nil), 8, tree(tree(nil,9,nil), 10,nil)) \nResults should be :1.trace = [1,2,3,4,8,9,10], 2. number of leaves =2, 3. height = 5, 4. number of nodes= 7, 7_1. check if is binary = yes.  '), trace(tree(tree(tree(tree(tree(nil,1,nil),2,nil),3,nil),4,nil), 8, tree(tree(nil,9,nil), 10,nil)), Res), write('\n1. Trace tree:  '), write(Res), write('\n2. Number of leaves:'), leaves(tree(tree(tree(tree(tree(nil,1,nil),2,nil),3,nil),4,nil),8, tree(tree(nil,9,nil), 10,nil)), R), write(R), write('\n3. Tree height:  '), height(tree(tree(tree(tree(tree(nil,1,nil),2,nil),3,nil),4,nil),8, tree(tree(nil,9,nil), 10,nil)), Re), write(Re), write('\n4. Number of nodes:  '), nodes(tree(tree(tree(tree(tree(nil,1,nil),2,nil),3,nil),4,nil),8, tree(tree(nil,9,nil), 10,nil)), Resu), write(Resu), write('\n7_1. Is binary tree:  '), (checkBinary(tree(tree(tree(tree(tree(nil,1,nil),2,nil),3,nil),4,nil), 8, tree(tree(nil,9,nil), 10,nil))),write('yes');write('no')), write('\n\n2-3 tree. Input: v2(nil,9,v3(v2(nil,12,nil),15,v2(v2(nil,16,nil),18,nil),19,v3(nil,20,nil,22,v2(nil,26,nil)))) \nResults should be :5. trace23=[9,12,15,16,18,19,20,22,26], 6. find23(15) =true, find23(13) = no, 7_2. check23=yes '),trace23(v2(nil,9,v3(v2(nil,12,nil),15,v2(v2(nil,16,nil),18,nil),19,v3(nil,20,nil,22,v2(nil,26,nil)))), Resul), write('\n5. Trace:  '), write(Resul),  write('\n5. Find23(15):  '),(find23(v2(nil,9,v3(v2(nil,12,nil),15,v2(v2(nil,16,nil),18,nil),19,v3(nil,20,nil,22,v2(nil,26,nil)))),15),write(yes);write(no)),write('\n5. Find23(13):  '),(find23(v2(nil,9,v3(v2(nil,12,nil),15,v2(v2(nil,16,nil),18,nil),19,v3(nil,20,nil,22,v2(nil,26,nil)))),13),write(yes);write(no)), write('\n7_2. Is 2-3 tree:  '), (check23(v2(nil,9,v3(v2(nil,12,nil),15,v2(v2(nil,16,nil),18,nil),19,v3(nil,20,nil,22,v2(nil,26,nil))))),write(yes);write(no)), write('\n\nCheck for non-trees \n1.Not binary: tree(tree(tree(tree(tree(nil,1,nil),2,nil),3,nil),4,nil),8, tree(tree(nil,9,nil), 10))) \n2.Not 2-3 tree: v2(v3(v2(nil,12,nil),15,v2(v2(nil,16,nil),18,nil),19,v3(nil,20,nil,22,v2(nil,26,nil))))'), write('\n7_1. Is binary tree:  '), (checkBinary(tree(tree(tree(tree(tree(nil,1,nil),2,nil),3,nil),4,nil),8, tree(tree(nil,9,nil), 10))),write('yes');write('no')),write('\n7_2. Is 2-3 tree:  '), (check23(v2(v3(v2(nil,12,nil),15,v2(v2(nil,16,nil),18,nil),19,v3(nil,20,nil,22,v2(nil,26,nil))))),write(yes);write(no)).