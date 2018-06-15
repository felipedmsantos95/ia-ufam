read_sentence(L):-
    read_line_to_codes(user_input,Cs), 
    atom_codes(A, Cs), 
    atomic_list_concat(L, ' ', A).

oracao(J1,J2) --> frase(J1),[e],frase(J2).

frase(J1) --> sujeito, predicado(J1).

sujeito --> pronomePessoal(_).
sujeito --> pronomePossessivo(G), substComum(G).

%predicado(J1) --> verbo, substProprio(G, J1), conjuncao, artigo(G), pronomePossessivo(G), substComum(G), verboP, substProprio(G, J2).

predicado(J1) --> verbo ,artigo(G),substProprio(G, J1).
redicado(J1) --> verbo ,substProprio(-_, J1).

artigo(m) --> [o].
artigo(f) --> [a].
conjuncao --> [e].
pronomePessoal(m) --> [eu].
pronomePossessivo(m) --> [meu].
pronomePossessivo(f) --> [minha].
substComum(m) --> [parceiro] | [chapa] | [compadre] | [amigo].
substComum(m) --> [parceira] | [chapa] | [comadre] | [amiga] | [dupla].

substProprio(m, X) --> [X], {member(X, [felipe, dimerson, guilherme])}.
substProprio(f, X) --> [X], {member(X, [carlla, fernanda, roberta, alice, florentina, luana])}.

verbo --> [me, chamo] | [sou] | [se, chama] | [eh].

bemVindo:-
    write('quem sao vcs?'), nl,
    write('>> '),
    read_sentence(S),
    oracao(J1,J2,S,[]),
    write('Bem vindos'),
    write(J1),
    write(' e '),
    write(J2).

leituraDupla:-
    nl,
	read_sentence(X).
    

