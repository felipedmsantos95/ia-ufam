read_sentence(L):-
    read_line_to_codes(user_input,Cs), 
    atom_codes(A, Cs), 
    atomic_list_concat(L, ' ', A).

% =====================
regra([],Y,Z):-
	Z =.. Y.

regra([equipe|B],Y,Z):-
	append([],[],Y),
	regra(B,Y,Z).

regra(['1'|_],_,1):-!.

regra([jogo|B],Y,Z):-
	append([,],[],Y),
	regra(B,Y,Z).

regra([e|B],Y,Z):-
	append(Y,[],W),
	regra(B,W,Z).

regra([branco|B],Y,Z):-
	append(Y,[0],W),
	regra(B,W,Z).

regra([as|B],Y,Z):-
	append(Y,[1],W),
	regra(B,W,Z).

regra([duque|B],Y,Z):-
	append(Y,[2],W),
	regra(B,W,Z).

regra([terno|B],Y,Z):-
	append(Y,[3],W),
	regra(B,W,Z).

regra([quadra|B],Y,Z):-
	append(Y,[4],W),
	regra(B,W,Z).

regra([quina|B],Y,Z):-
	append(Y,[5],W),
	regra(B,W,Z).

regra([sena|B],Y,Z):-
	append(Y,[6],W),
	regra(B,W,Z).

%leituraDupla(Sentenca):-
 %   nl,
  %  read_sentence(X),
   % phrase(,X).
    

% O que eu preciso é que a leitura retorne no Out uma lista [,,1,2]
% caso a pesso escreva "...jogo.. branco e duque ...." usando a
% regra().
%leitura([]):-!.
leitura(In):-
	nl,
	read_sentence(X),
	regra(X,_,In).



