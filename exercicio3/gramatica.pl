:-
    [domino].

read_sentence(L):-
    read_line_to_codes(user_input,Cs), 
    atom_codes(A, Cs), 
    atomic_list_concat(L, ' ', A).

%regras para definição do nome da dupla:
%exemplo: "eu sou o felipe e meu compadre eh dimerson" "eu me chamo guilherme e meu parceiro eh dimerson"
%-----------------------------------------------
oracao(J1,J2) --> frase(J1),conjuncao,frase(J2).

frase(J1) --> sujeito, predicado(J1).

sujeito --> pronomePessoal(s).
sujeito --> artigo(G), pronomePossessivo(G), substComum(G).%para o caso da frase que se refere ao segundo parceiro
sujeito --> pronomePossessivo(G), substComum(G).

predicado(J1) --> verbo(s), artigo(G),substProprio(G, J1).
predicado(J1) --> verbo(s), substProprio(_, J1).

artigo(m) --> [o].
artigo(f) --> [a].
conjuncao --> [e].
pronomePessoal(s) --> [eu].
pronomePessoal(p) --> [nos].
pronomePossessivo(m) --> [meu].
pronomePossessivo(f) --> [minha].
substComum(m) --> [parceiro] | [chapa] | [compadre] | [amigo].
substComum(m) --> [parceira] | [chapa] | [comadre] | [amiga] | [dupla].

substProprio(m, X) --> [X], {member(X, [felipe, dimerson, guilherme])}.
substProprio(f, X) --> [X], {member(X, [carlla, fernanda, roberta, alice, florentina, luana])}.

verbo(s) --> [me, chamo] | [sou] | [se, chama] | [eh].
verbo(p) --> [escolhemos] | [selecionamos].

numeral(X) --> [X] , {member(X,['1',primeira, '2', segunda])}.

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
%-------------------------------------------------------------------------------

%regras para a escolha da equipe:
%exemplo de entrada: "nos escolhemos a 2", "escolhemos a primeira" 
%-------------------------------------------------------------------------------
fraseEscolhaEquipe(Ordem) --> pronomePessoal(p), verbo(p), artigo(f), numeral(Ordem).
fraseEscolhaEquipe(Ordem) --> pronomePessoal(p), verbo(p), artigo(f), numeral(Ordem), [equipe].
fraseEscolhaEquipe(Ordem) --> verbo(p), artigo(f), numeral(Ordem).
fraseEscolhaEquipe(Ordem) --> verbo(p), artigo(f), numeral(Ordem), [equipe].

ordem([primeira], 1).
ordem(['1'], 1).
ordem([segunda], 2).
ordem(['2'], 2).

escolhaEquipe:-
    write('Possiveis equipes: '), nl,
    write('----------------------'), nl,
    write('[1] - Jogadores 1 e 3'), nl,
    write('[2] - Jogadores 2 e 4'), nl, 
    write('Escolha sua equipe: '), nl,
    read_sentence(S),
    fraseEscolhaEquipe(Ordem, S, []).
    ordem(Ordem, X).

%--------------------------------------------------------------------------------
%regras para distribuição de pedras
%---------------------------------------------------------------------------------
