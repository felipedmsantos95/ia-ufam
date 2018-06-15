% Exemplo
state(0,mesa([],[],[],[])).

vazia(mesa([],[],[],[])).

jogar(P1,Mesa,State2):-
   vazia(Mesa),
   inicia(P1,Mesa,State2),!.

% primeira ponta
jogar(P,mesa([H1|T1],P2,P3,P4),mesa([NH1|[H1|T1]],P2,P3,P4)):-
   joguePonta(P,H1,NH1).

% segunda ponta
jogar(P,mesa(P1,[H2|T2],P3,P4),mesa(P1,[NH2|[H2|T2]],P3,P4)):-
   joguePonta(P,H2,NH2).

% terceira ponta
jogar(P,mesa(P1,P2,[H3|T3],P4),mesa(P1,P2,[NH3|[H3|T3]],P4)):-
   joguePonta(P,H3,NH3).

% quarta ponta
jogar(P,mesa(P1,P2,P3,[H4|T4]),mesa(P1,P2,P3,[NH4|[H4|T4]])):-
   joguePonta(P,H4,NH4).




joguePonta((X,Y),(X,_),(Y,X)).
joguePonta((Y,X),(X,_),(Y,X)).

inicia(P,_,mesa([P],[P],[P],[P])).

% Q3
memberP((X1,_), estado(X1,_,_,_)).
memberP((X1,_), estado(_,X1,_,_)).
memberP((X1,_), estado(_,_,X1,_)).
memberP((X1,_), estado(_,_,_,X1)).
memberP((_,X2), estado(X2,_,_,_)).
memberP((_,X2), estado(_,X2,_,_)).
memberP((_,X2), estado(_,_,X2,_)).
memberP((_,X2), estado(_,_,_,X2)).
memberP((X1,_), estado((X1,X1),_,_,_)).
memberP((X1,_), estado(_,(X1,X1),_,_)).
memberP((X1,_), estado(_,_,(X1,X1),_)).
memberP((X1,_), estado(_,_,_,(X1,X1))).
memberP((_,X2), estado((X2,X2),_,_,_)).
memberP((_,X2), estado(_,(X2,X2),_,_)).
memberP((_,X2), estado(_,_,(X2,X2),_)).
memberP((_,X2), estado(_,_,_,(X2,X2))).

jogaveis(mao([]),_,[]).
jogaveis(mao([X|T1]), B, [X|T3]):-
    memberP(X,B),
    jogaveis(mao(T1), B, T3).
jogaveis(mao([_|T1]), B, T2):-
    jogaveis(mao(T1),B,T2).


% Q2

retira([],[]).
retira([(A,B)|T],[(A,B)|Result]):-
	A = B,
	retira(T,Result).
retira([(A,_)|Tail],[A|Result]):-
	retira(Tail,Result).

listaEstado(mesa([(A,B)|_],[(C,D)|_],[(E,F)|_],[(G,H)|_]),Result):-
	retira([(A,B),(C,D),(E,F),(G,H)],Result).

formataEstado(estado(A, B, C, D), [A, B, C, D]). 

qualEstado(mesa([(A,B)|T1],[(C,D)|T2],[(E,F)|T3],[(G,H)|T4]), X):-
    listaEstado(mesa([(A,B)|T1],[(C,D)|T2],[(E,F)|T3],[(G,H)|T4]),Result),
    formataEstado(X, Result).    

% Q4

removeM(_,mao([]),mao([])).
removeM(X,mao([X|L]),mao(L)):- !.
removeM(X,mao([Y|L]),mao([Y|L1])):-
    removeM(X,mao(L),mao(L1)).

retiraMao([X|_], Mao, Result):-
    removeM(X, Mao, Result).


primeiraPedra([X|_], X).

joga(Mao1, M1, Mao2, M2):-
    qualEstado(M1,E),
    jogaveis(Mao1, E, Jogaveis),
    primeiraPedra(Jogaveis, P),
    jogar(P, M1, M2),
    retiraMao(Jogaveis,Mao1,Mao2).
