/*	File:	io_esm.pl
	Autor:	Edjard Mota
	Objetivo: Ler uma sentenca e colocar cada palavra em uma
                       lista de atomos. Cada elemento da lista e' tratado 
                       como atomo para facilitar o uso com DCG.
*/

read_sentence(S):-
    read_words(S,0).
read_words([],10):- !.   % return encerra a sentenca
read_words([S|T],_):-
    getword(S,C),
    read_words(T,C).

getword(Wd,C) :-
    collect_wd(String,C),
    atom_codes(Wd, String).

collect_wd(W,FC) :-
    get0(C),
    (valid_char(C),!,
     W = [C|R],
      collect_wd(R,FC)
     ;
     FC = C,
     W = []).

valid_char(C):-
    C \== 10,  % enter ou return
    C \== 32,  % branco
    C \== 46,  % ponto
    C \== 44,  % virgula
    C \== 58,  % dois pontos
    C \== 59.  % ponto e virgula

