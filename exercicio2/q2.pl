mesa(F1,F2,F3,F4).

retira([],[]).

retira([(A,B)|T],[(A,B)|Result]):-
	A = B,
	retira(T,Result).

retira([(A,B)|Tail],[A|Result]):-
	retira(Tail,Result).

qualEstado(mesa([(A,B)|T1],[(C,D)|T2],[(E,F)|T3],[(G,H)|T4]),Result):-
	retira([(A,B),(C,D),(E,F),(G,H)],Result).


formataEstado([X1, X2, X3, X4], estado(X1, X2, X3, X4)):-!.
     

   


