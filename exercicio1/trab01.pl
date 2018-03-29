

 
move(state(meio, sobreCaixa, meio, semBanana), pega, state(meio, sobreCaixa,meio,comBanana)).    
move(state( P, noChao, P, Has),sobe,state( P, sobreCaixa, P, Has)).
move(state( P1, noChao, P1, Has),arrasta( P1, P2),state( P2, noChao, P2, Has)).
move(state( P1, noChao, B, Has),anda( P1, P2),state( P2, noChao, B, Has)).


podePegar(state(_,_,_, comBanana)).
podePegar(State1) :-
    move(State1, Move, State2),
    podePegar(State2).


podePegarlist(state(_,_,_, comBanana), Como):-
    Como = [].
podePegarlist(state(meio, sobreCaixa, meio, semBanana),Como):-
    Como = [pega].
podePegarlist(state(meio, noChao, meio, semBanana),Como):-
    Como = [sobe, pega].
podePegarlist(state(naJanela, noChao, naJanela, semBanana),Como):-
    Como = [arrasta(naJanela, meio), sobe, pega].
podePegarlist(state(naPorta, noChao, naJanela, semBanana),Como):-
    Como = [anda(naPorta, naJanela), arrasta(naJanela, meio), sobe, pega].
    

podePegarComo(State, [], Como):-
    podePegarlist(State, Como).
podePegarComo(State, Inicio, Como):-
    Inicio = [X|L],
    podePegar(State),
    move(State, X, State2),
    podePegarComo(State2, L, Como).
    



