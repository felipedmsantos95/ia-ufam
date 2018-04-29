member(X, [X|_]).
member(X, [_|T]):-
    member(X,T).

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


