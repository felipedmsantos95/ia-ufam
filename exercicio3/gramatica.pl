%==================================================================================
% DCG para o jogo do domino

% Alunos:
%   Dimerson Lucas de O. Coelho
%   Felipe de Menezes Santos
%   Guilherme Penã Céspedes

%==================================================================================
% Chamada para funções uteis durante o desenvolvimento do nosso código
%==================================================================================
:-
    [domino].

read_sentence(L):-
    read_line_to_codes(user_input,Cs), 
    atom_codes(A, Cs), 
    atomic_list_concat(L, ' ', A).

%================================================================================
% Regras para definição do nome da dupla:
% exemplo: "eu sou o felipe e meu compadre eh dimerson" "eu me chamo guilherme e meu parceiro eh dimerson"
%=================================================================================
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
%================================================================================
% Regras para a escolha da equipe:
% exemplo de entrada: "nos escolhemos a 2", "escolhemos a primeira" 
%================================================================================
fraseEscolhaEquipe(Ordem) --> numeral(Ordem).
fraseEscolhaEquipe(Ordem) --> pronomePessoal(p), verbo(p), artigo(f), numeral(Ordem).
fraseEscolhaEquipe(Ordem) --> pronomePessoal(p), verbo(p), artigo(f), numeral(Ordem), [equipe].
fraseEscolhaEquipe(Ordem) --> verbo(p), artigo(f), numeral(Ordem).
fraseEscolhaEquipe(Ordem) --> verbo(p), artigo(f), numeral(Ordem), [equipe].

ordem(primeira, 1).
ordem('1', 1).
ordem(segunda, 2).
ordem('2', 2).

escolhaEquipe(X):-
    write('Possiveis equipes: '), nl,
    write('----------------------'), nl,
    write('[1] - Jogadores 1 e 3'), nl,
    write('[2] - Jogadores 2 e 4'), nl, 
    write('Escolha sua equipe: '), nl,
    read_sentence(S),
    fraseEscolhaEquipe(Ordem, S, []),
    ordem(Ordem, X).

%=================================================================================
% Regras para distribuição de pedras

% exemplo de teste: distribuiPedrasDcg(guilherme,dimerson, equipes(domino(2,4), sapiens(1,3)), jogadores([ (6,6), (3,3), (0,5), (3,6), (0,3), (0,2), (3,5)],[ (5,5), (1,5), (0,6), (2,5), (4,6), (2,4), (2,3)],[ (5,5), (1,5), (0,6), (2,5), (4,6), (2,4), (2,3)],[ (5,5), (1,5), (0,6), (2,5), (4,6), (2,4), (2,3)])).
%=================================================================================

distribuiPedrasDcg(J1,J2, equipes(_,sapiens(S1,S2)), PedrasJogadores):-
    write('Baré: obrigado! Agora vou distribuir as pedras.'), nl,
    arg(S1, PedrasJogadores ,P1),
    arg(S2, PedrasJogadores ,P2),
    write(J1), write(' suas pedras são '),  write(' : '),  write(P1), nl,
    write(J2), write(' suas pedras são '),  write(' : '),  write(P2), nl.


%=================================================================================
% Funções e regras para efetuar jogada
%=================================================================================

regra([],Y,Z):-
	Z =.. Y.

regra([equipe|B],Y,Z):-
	append([],[],Y),
	regra(B,Y,Z).

regra(['1'|_],_,1):-!.

regra([passo|_],_,passo):-!.

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

    

% O que eu preciso é que a leitura retorne no Out uma lista [,,1,2]
% caso a pesso escreva "...jogo.. branco e duque ...." usando a
% regra().
%leitura([]):-!.
leitura(In):-
	nl,
	read_sentence(X),
	regra(X,_,In).


%========================================================================
