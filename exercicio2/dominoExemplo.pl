%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                  
% Jogo do domino bastante simplificado e incompleto
%
% Autor: Edjard Mota       
% Data : 13/04/2018              
%                                  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-
    use_module(library(lists)).

remove(_,[],[]).
remove(X,[X|L],L):- !.
remove(X,[Y|L],[Y|L1]):-
    remove(X,L,L1).

distribuiP(jogadores(Lp1, Lp2, Lp3, Lp4)):-
    B = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28],
    distribui(B,Lp1, Lp2, Lp3, Lp4).

distribuiPedras(E):-
    E = equipes(mao[(2,3), (1,3), (4,6), (2,4), (0,4), (0,2), (0,0)], mao[(3,5), (4,4), (1,2), (2,5), (3,4), (5,6), (1,5)], mao[(1,6), (1,4), (3,3), (0,3), (2,6), (0,6), (3,6)], mao[(0,1), (6,6), (0,5), (2,2), (4,5), (5,5), (1,1)]),
    J1 = mao[(2,3), (1,3), (4,6), (2,4), (0,4), (0,2), (0,0)],
    J2 = mao[(3,5), (4,4), (1,2), (2,5), (3,4), (5,6), (1,5)],
    J3 = mao[(1,6), (1,4), (3,3), (0,3), (2,6), (0,6), (3,6)],
    J4 = mao[(0,1), (6,6), (0,5), (2,2), (4,5), (5,5), (1,1)].

distribui([], [], [], [], []):- !.
distribui(Banco,[H1|Tp1],[H2|Tp2],[H3|Tp3],[H4|Tp4]):-
    seleciona(H1, Banco, Banco1),
    seleciona(H2, Banco1, Banco2),
    seleciona(H3, Banco2, Banco3),
    seleciona(H4, Banco3,Banco4),
    distribui(Banco4,Tp1,Tp2,Tp3,Tp4).

seleciona(N,[N],[]):- !.
seleciona(N,B,B1):-
    random(1,29,N),
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

