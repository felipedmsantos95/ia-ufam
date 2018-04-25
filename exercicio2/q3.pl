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


state(0,mesa([],[],[],[])).

vazia(mesa([],[],[],[])).

jogar(P1,Mesa,State2):-
   vazia(Mesa),
   inicia(P1,Mesa,State2),!.

jogar(P,mesa([H1|T1],P2,P3,P4),mesa([NH1|[H1|T1]],P2,P3,P4)):-
   joguePonta(P,H1,NH1).

jogar(P,mesa(P1,[H2|T2],P3,P4),mesa(P1,[NH2|[H2|T2]],P3,P4)):-
   joguePonta(P,H2,NH2).

jogar(P1,mesa([H1|T1],P3,P4,P5),mesa([NH1|[H1|T1]],P3,P4,P5)):-
   joguePonta(P1,H1,NH1).

jogar(P1,mesa([H1|T1],P3,P4,P5),mesa([NH1|[H1|T1]],P3,P4,P5)):-
   joguePonta(P1,H1,NH1).

joguePonta(p(X,Y),p(X,_),p(Y,X)).
joguePonta(p(Y,X),p(X,_),p(Y,X)).

inicia(P,_,mesa([P],[P],[P],[P])).


jogaveis(mao([]), estado(_,_,_,_), [Y]):- !.
jogaveis(mao([(C1,X)|T]), estado(C1, C2, C3, C4), Jogaveis):-
    N  = (C1, X),
    jogaveis(mao(T), estado(C1, C2, C3, C4),[N|_]).
jogaveis(mao([(C2,X)|T]), estado(C1, C2, C3, C4), Jogaveis):-
    N  = (C2, X),
    jogaveis(mao(T), estado(C1, C2, C3, C4),[N|_]).
jogaveis(mao([(C3,X)|T]), estado(C1, C2, C3, C4), Jogaveis):-
    N  = (C3, X),
    jogaveis(mao(T), estado(C1, C2, C3, C4),[N|_]).
jogaveis(mao([(C4,X)|T]), estado(C1, C2, C3, C4), Jogaveis):-
    N  = (C4, X),
    jogaveis(mao(T), estado(C1, C2, C3, C4),[N|_]).
