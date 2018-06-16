read_sentence(L):-
    read_line_to_codes(user_input,Cs), 
    atom_codes(A, Cs), 
    atomic_list_concat(L, ' ', A).

oracao(J1,J2) --> frase(J1),conjuncao,frase(J2).

frase(J1) --> sujeito, predicado(J1).

sujeito --> pronomePessoal(_).
sujeito --> pronomePossessivo(G), substComum(G).%para o caso da frase que se refere ao segundo parceiro

predicado(J1) --> verbo, artigo(G),substProprio(G, J1).
predicado(J1) --> verbo, substProprio(_, J1).

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

leituraDupla:-
    write('Baré: Bem vindo ao mundo Baré!'),nl,
    write('Baré: Por favor entre com o nome da sua dupla, na ordem de jogada.'), nl,
    write('>> '),
    read_sentence(S),
    oracao(J1,J2,S,[]),
    write('Bem vindos '),
    write(J1),
    write(' e '),
    write(J2), write('! Escolham das equipes abaixo:').



