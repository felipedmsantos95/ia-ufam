:-
    use_module(library(lists)).

remove(_,[],[]).
remove(X,[X|L],L):- !.
remove(X,[Y|L],[Y|L1]):-
    remove(X,L,L1).

distribuiPedras(E):-
    E = equipes(J1, J2, J3, J4),
    B =
[(0,0),(0,1),(0,2),(0,3),(0,4),(0,5),(0,6),(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(2,2),(2,3),(2,4),(2,5),(2,6),(3,3),(3,4),(3,5),(3,6),(4,4),(4,5),(4,6),(5,5),(5,6),(6,6)],
    distribui(B,J1, J2, J3, J4).


distribui([], mao([]), mao([]), mao([]), mao([])):- !.
distribui(Banco,mao([H1|Tp1]),mao([H2|Tp2]),mao([H3|Tp3]),mao([H4|Tp4])):-
    seleciona(H1, Banco, Banco1),
    seleciona(H2, Banco1, Banco2),
    seleciona(H3, Banco2, Banco3),
    seleciona(H4, Banco3,Banco4),
    distribui(Banco4,mao(Tp1),mao(Tp2),mao(Tp3),mao(Tp4)).

seleciona(N,[N],[]):- !.
seleciona(N,B,B1):-
    random_member(N,B),
    member(N,B), !,
    remove(N,B,B1).
seleciona(N,Dist,Dist1):-
    seleciona(N,Dist,Dist1).

