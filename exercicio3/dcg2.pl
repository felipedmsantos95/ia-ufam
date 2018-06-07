read_sentence(L):-
    read_line_to_codes(user_input,Cs), 
    atom_codes(A, Cs), 
    atomic_list_concat(L, ' ', A).

% =====================
regra([]):-!.
regra([jogo|B]):-
	write(B).
regra([branco|B]):-.
regra([duque|B]):-.
regra([terno|B]):-.
regra([quadra|B]):-.
regra([quina|B]):-.
regra([sena|B]):-.

% O que eu preciso é que a leitura retorne no Out uma lista [,,1,2]
% caso a pesso escreva "...jogo.. branco e duque ...." usando a
% regra().
leitura([]):-!.
leitura(L,Out):-
	regra(L,Out),
	leitura(Out,B).
