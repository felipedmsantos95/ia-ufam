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
