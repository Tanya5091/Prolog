fill(-1):-!.
fill(X):-asserta(d(X)), X1 is X-1, fill(X1).
p(Kola,Koka,Voda):- 
d(K), K\=0,
d(V), V\=0, V\=K,
d(O), O\=K, O\=V,
d(A), A\=O, A\=K, A\=V,
d(L), L\=K, L\=V, L\=O, L\=A,
d(D), D\=K, D\=V, D\=O, D\=A, D\=L,
Kola is K*1000+O*100+L*10+A, Koka is K*1000+O*100+K*10+A, Voda is V*1000+O*100+D*10+A, 
Voda is Kola + Koka.