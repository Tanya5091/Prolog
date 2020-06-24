%t(t(nil/0,1,t(nil/0,2,nil/0)/1)/2,3,t(nil/0,4,nil/0)/1)/3
%1. Trace AVL-tree
trace(nil/0, []):-!.
trace(t(L,X,R)/_, Res):-trace(L, Lr), trace(R, Rr), append(Lr,[X|Rr],Res).

%2. Find element
find(t(L,X,R)/_, El):-El==X; (El>X, find(R,El));(El<X,find(L,El)).

%3. Check if an object if 
checkAvl(nil/0).
checkAvl(t(nil/0,X,nil/0)/Y). 
checkAvl(t(nil/0,X,R)/Y):-(t(D,E,F)/K)=R,1>=K,X=<E.
checkAvl(t(L,X,nil/0)/Y):-(t(D,E,F)/K)=L,1>=K,X>=E. 
checkAvl(t(L,X,R)/Y):-(t(A,B,C)/J)=L,(t(D,E,F)/K)=R,(K==J;1>=(J-K);1=<(K-J)), X>=B, X=<E ,checkAvl(L), checkAvl(R). 

%4. Delete node 
deleteNode(Tree, El, Res) :-findall(Res, deleteN(Tree, El, Res), Temp),last(Temp, Res).

deleteN(t(nil/0,El,R)/_,El,R).
deleteN(t(L,El,R)/_,El,L).
deleteN(t(L,El,R)/H,El,t(L,X,Res)/H) :-remove(R,X,Res).
deleteN(t(L,X,R)/H,El,t(Lr, X,Rr)/H) :-(El<X, Rr=R,deleteN(L,El,Lr));(El>X,Lr=L,deleteN(R,El,Rr)).
remove(t(nil/0,El,R)/_,El,R).
remove(t(L,El,R)/H,X,t(Lr,El,R)/H):- remove(L,X,Lr).

:-initialization(run).
run:-write('(object A) AVL-tree t(t(nil/0,1,t(nil/0,2,nil/0)/1)/2,3,t(nil/0,4,nil/0)/1)/3 \n(object B) Not AVL-tree t(t(nil/0,1,t(nil/0,2,nil/0)/1)/2,3,t(nil/0,2,nil/0)/1)/3 \n1. Trace tree:  '),trace(t(t(nil/0,1,t(nil/0,2,nil/0)/1)/2,3,t(nil/0,4,nil/0)/1)/3, Res), write(Res), write('\n2. Find(4):  '),(find(t(t(nil/0,1,t(nil/0,2,nil/0)/1)/2,3,t(nil/0,4,nil/0)/1)/3,4),write(yes);write(no)),write('\n2. Find(6):  '),(find(t(t(nil/0,1,t(nil/0,2,nil/0)/1)/2,3,t(nil/0,4,nil/0)/1)/3,6),write(yes);write(no)), write('\n3. Is object A AVL-tree(should be true):  '), (checkAvl(t(t(nil/0,1,t(nil/0,2,nil/0)/1)/2,3,t(nil/0,4,nil/0)/1)/3),write('yes');write('no')),write('\n3. Is object B AVL-tree(should be no):  '), (checkAvl(t(t(nil/0,1,t(nil/0,2,nil/0)/1)/2,3,t(nil/0,2,nil/0)/1)/3),write('yes');write('no')),write('\n4. Delete(4):  '), deleteNode(t(t(nil/0,1,t(nil/0,2,nil/0)/1)/2,3,t(nil/0,4,nil/0)/1)/3, 4, Result), write(Result).