

 
move(state( meio, sobreCaixa, meio, semBanana), pega, state(meio, sobreCaixa,meio,comBanana)).    
move(state( P, noChao, P, Has),sobe,state( P, sobreCaixa, P, Has)).
move(state( P1, noChao, P1, Has),arrasta( P1, P2),state( P2, noChao, P2, Has)).
move(state( P1, noChao, B, Has),anda( P1, P2),state( P2, noChao, B, Has)).


podePegar(state(_,_,_, comBanana)).
podePegar(State1) :-
    move(State1, Move, State2),
    podePegar(State2).



podePegarComo(state(_,_,_, comBanana), Como).
podePegarComo(State1,Como):-
    move(State1,Move,State2),
    podePegarComo(State2, parcialComo),
    add(Move, parcialComo, Como).

add(X,L,[X|L]).

