:- [library(dcg/basics)].

sentence(s(NP,VP)) -->     
    noun_phrase(NP,Num),
    verb_phrase(VP,Num).

noun_phrase(np(DET, NP2), Num) -->
    determiner(DET, Num),
    noun_phrase2(NP2, Num).
noun_phrase(np(NP2), Num) -->
    noun_phrase2(NP2, Num).
noun_phrase2(np2(N), Num) -->
    noun(N, Num).
noun_phrase2(np2(ADJ, NP2), Num) -->
    adjective(ADJ),
    noun_phrase2(NP2, Num).
verb_phrase(vp(V), Num) -->
    verb(V, Num).
verb_phrase(vp(V, NP), Num) -->
    verb(V, Num),
    noun_phrase(NP, _).
% -----------------------------------------------
determiner(det(the), _) --> [the].
determiner(det(a), singular) --> [a].
noun(n(pumpkin), singular) --> [pumpkin].
noun(n(pumpkins), plural) --> [pumpkins].
noun(n(lecturer), singular) --> [lecturer].
noun(n(lecturers), plural) --> [lecturers].
adjective(adj(possessed)) --> [possessed].
verb(v(scares), singular) --> [scares].
verb(v(scare), plural)    --> [scare].

% ----------------------------------------------
sentence(VP) --> noun_phrase(Actor),
		 verb_phrase(Actor,VP).
noun_phrase(NP) --> proper_noun(NP).
verb_phrase(Actor,VP) --> intrans_verb(Actor,VP).
verb_phrase(Actor,VP) --> trans_verb(Actor,Y,VP),
			  noun_phrase(Y).
intrans_verb(Actor, paints(Actor)) --> [paints].
trans_verb(X,Y, likes(X,Y)) --> [likes].
proper_noun(john) --> [john].
proper_noun(annie) --> [annie].


/* ---------------------------------------------
    Apenas para teste da semantica.
    A semantica deve cappturar o que se deve
    fazer, ou seja, no caso qual predicado deve
    ser chamado. Como exemplo vou definir
    que "john likes annie" e' igual a likes(john, annie)
    que quando chamado escreve uma mensagem 
    que enfatize esta relacao
*/

likes(X, annie):-
    write('Todo mundo sabia que o '), write(X), write(' gosta da annie'), nl.
