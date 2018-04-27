member(X, [X|_]).
member(X, [_|T]):-
    member(X,T).

intercessao([],_,[]).
intercessao([X|T1], B, [X|T3]):-
    member(X,B),
    intercessao(T1, B, T3).
intercessao([_|T1], B, T2):-
    intercessao(T1,B

