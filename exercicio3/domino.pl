%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                                            %
% Domino    (Sem heuristica)                                                                %
%                                                                                                            %
% Author : Edjard Mota                                                                          %
% Date   : Maio de 2018                                                                         %
%                                                                                                            %
% ?- playDomino.                                                                                   %
%     para iniciar o jogo                                                                           %
%                                                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Para simplificar, vamos assumir que as 4 filas de
% pedras que se formam serão representadas por 4 listas.
% A cabeça de cada ponta sera o cabeça.
% mesa(+F1,+F2,+F3,+F4)
%
% O estado de uma partida envolve:
% 1. o estado da mesa, representado por estado(+P1,+P2,+P3,+P4),
%    em que cada Pi pode ser um numero entre 0 e 6, ou
%    um par (N,N) em que N é um numero entre 0 e 6.
%     - Se for um par é porque há uma carroça de N na ponta.
%     - Se for um numero, este representa o valor da ultima
%       pedra que foi jogada, e que na fila Fi da mesa aparece
%       como primeira coordenada do par que esta cabeça de Fi
%    Exemplo:
%    estado(3,0,(5,5),4)
%    - a ultima pedra de F1 foi um (3,X1) - terno e algum valor
%    - a ultima pedra de F2 foi um (0,X2) - nada e algum valor
%    - a ultima pedra de F3 foi um (5,5) - carroça de quina
%    - a ultima pedra de F4 foi um (4,X4) - quadra e algum valor
% 2. A mão de cada jogador, individualmente assumindo que ele
%    não vê as demais mãos.

% ----------------------------------------------------------
%  DEFINIÇÕES: termos importantes
%  equipes/2: guarda as equipes e a pontuação de cada equipe.
%  domino((Ji,Jk),P): Ji e Jk são ímpares 1 e 3 ou pares 2 e 4
%                     P os pontos da dupla em um dado estado.
%
%  o segundo é termo para o jogador humano, denominado de
%  sapiens((Ji,Jk),P): Ji e Jk são ímpares 1 e 3 ou pares 2 e 4
%                      P os pontos da dupla em um dado estado.
%  
%  Antes de distribuir as pedras, o domino pergunta ao sapiens
%  qual dupla quer ser (1,3) - 1a, ou (2,4) - 2a. ao decidir,
%  fica determinado qual coordenadas sera instanciadas para
%  Ji e Jk de sapiens/2 e domino/2
%
% jogo(Mesa,Jogadores,Equipes,Vez), em que Mesa é a estrutura
%               já definida acima e Jogadores é uma quadrupla
%               jogadores(J1,J2,J3,J4) em que cada J1 é um par
%               - mão de pedras
%               - token para jogar na sua vez
%               Equipes: equipes(domino(D1,D2),sapiens(S1,S2)).
%
%               e Vez um inteiro entre 1 e 4 indicando quem
%               está na vez de jogar.
%
% Faremos jogador(Token, Mao). Token pode ser:
%               - preso ou livre

:-
    use_module(library(lists)),
    [banco_pedras].

remove(_,[],[]).
remove(X,[X|L],L):- !.
remove(X,[Y|L],[Y|L1]):-
    remove(X,L,L1).

% --------------------------------------------------------
distribuiP(jogadores(J1, J2, J3, J4)):-
    B = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28],
    distribui(B,Lp1, Lp2, Lp3, Lp4),
    J1 =..[mao,Lp1],
    J2 =..[mao,Lp2],
    J3 =..[mao,Lp3],
    J4 =..[mao,Lp4].

% --------------------------------------------------------
distribui([], [], [], [], []):- !.
distribui(B,[H1|Tp1],[H2|Tp2],[H3|Tp3],[H4|Tp4]):-
    seleciona(H1,B,B1),
    seleciona(H2,B1,B2),
    seleciona(H3,B2,B3),
    seleciona(H4,B3,B4),
    distribui(B4,Tp1,Tp2,Tp3,Tp4).

% --------------------------------------------------------
seleciona(P,[N],[]):- !,
    pedra(N,P).
seleciona(P,B,B1):-
    random(1,29,N),
    member(N,B), !,
    remove(N,B,B1),
    pedra(N,P).
seleciona(N,Dist,Dist1):-
    seleciona(N,Dist,Dist1).

% --------------------------------------------------------
qualEstado(M,E):-
    \+ vazia(M),
    estadoValido(M,E).
estadoValido(mesa([H1|_],[H2|_],[H3|_],[H4|_]),estado(P1,P2,P3,P4)):-
    pontaOuCarroca(H1,P1),
    pontaOuCarroca(H2,P2),
    pontaOuCarroca(H3,P3),
    pontaOuCarroca(H4,P4).

pontaOuCarroca((N,N),(N,N)).
pontaOuCarroca((N,M),N):-
    N =\= M.

% --------------------------------------------------------
jogaveis(mao(Mao),E,Pedras):-
    oQJogar(E,Mao,[],Pedras).

oQJogar(_,[],Pedras,Pedras).
oQJogar(Estado,[P|TP],PedrasSF, Jogaveis):-
    arg(1, Estado,P1),
    podeJogar(P,P1),
    \+ member(P,PedrasSF),!,
    oQJogar(Estado,TP,[P|PedrasSF], Jogaveis).

oQJogar(Estado,[P|TP],PedrasSF, Jogaveis):-
    arg(2, Estado,P2),
    podeJogar(P,P2),
    \+ member(P,PedrasSF),!,
    oQJogar(Estado,TP,[P|PedrasSF],Jogaveis).

oQJogar(Estado,[P|TP],PedrasSF,Jogaveis):-
    arg(3, Estado,P3),
    podeJogar(P,P3),
    \+ member(P,PedrasSF),!,
    oQJogar(Estado,TP,[P|PedrasSF],Jogaveis).

oQJogar(Estado,[P|TP],PedrasSF, Jogaveis):-
    arg(4, Estado,P4),
    podeJogar(P,P4),
    \+ member(P,PedrasSF),!,
    oQJogar(Estado,TP,[P|PedrasSF], Jogaveis).

oQJogar(Estado,[_|TP],PedrasSF, Jogaveis):-
    oQJogar(Estado,TP,PedrasSF, Jogaveis).

% --------------------------------------------------------
podeJogar((N,N),N).          % Carroça e ponta é normal
podeJogar((N1,N2),N):-       % Pedra e ponta são normais
    N = N1; N = N2.
podeJogar((N1,N2),(N,N)):-   % Ponta é carroça e pedra normal
    N = N1; N = N2.

% --------------------------------------------------------
%  joga(Mao,Mesa,Mao1,Mesa1).

joga(Mao,Mesa,Mao1,Mesa1):-
    estadoValido(Mesa,E),
    jogaveis(Mao, E, Pedras),
    jogar(Pedras, Mao, Mesa, Mao1, Mesa1).

% --------------------------------------------------------
jogar([],Mao,Mesa,Mao,Mesa).
jogar([P|_],Mao1,Mesa1,Mao2,Mesa2):-
    jogue(P,Mesa1,Mesa2),
    retiraDaMao(P,Mao1,Mao2),
    write('Pedra jogada: '), write(P), nl.
jogar([_|T],Mao1,Mesa1,Mao2,Mesa2):-
    jogar(T,Mao1,Mesa1,Mao2,Mesa2).

% --------------------------------------------------------
jogue(passo,M,M).
jogue((N1,N2),M1,M2):-
   (
    M1 = mesa([(N1,N)|T1],P2,P3,P4),
    M2 = mesa([(N2,N1),(N1,N)|T1],P2,P3,P4)
    ;
    M1 = mesa([(N2,N)|T1],P2,P3,P4),
    M2 = mesa([(N1,N2),(N2,N)|T1],P2,P3,P4)).
jogue((N1,N2),M1,M2):-
   (
    M1 = mesa(P1,[(N1,N)|T2],P3,P4),
    M2 = mesa(P1,[(N2,N1),(N1,N)|T2],P3,P4)
    ;
    M1 = mesa(P1,[(N2,N)|T2],P3,P4),
    M2 = mesa(P1,[(N1,N2),(N2,N)|T2],P3,P4)).
jogue((N1,N2),M1,M2):-
   (
    M1 = mesa(P1,P2,[(N1,N)|T3],P4),
    M2 = mesa(P1,P2,[(N2,N1),(N1,N)|T3],P4)
    ;
    M1 = mesa(P1,P2,[(N2,N)|T3],P4),
    M2 = mesa(P1,P2,[(N1,N2),(N2,N)|T3],P4)).
jogue((N1,N2),M1,M2):-
   (
    M1 = mesa(P1,P2,P3,[(N1,N)|T4]),
    M2 = mesa(P1,P2,P3,[(N2,N1),(N1,N)|T4])
    ;
    M1 = mesa(P1,P2,P3,[(N2,N)|T4]),
    M2 = mesa(P1,P2,P3,[(N1,N2),(N2,N)|T4])).

% --------------------------------------------------------
retiraDaMao(P,mao(Pedras),mao(PedrasN)):-
    remove(P,Pedras,PedrasN).

% ----------------------------------------------------------------------
% O jogo termina em duas situações: uma normal e outra forçada.
%
% Na normal, um dos jogadores esta com a a mão vazia de pedras
% Na forçada, nenhum dos jogadores esta livre para jogar porque
% foram todos presos, i.e. nenhum tem opção de jogo.
%
% Na opção normal, é indicado qual jogador finalizou ou 'bateu'
% Na forçada indicamos um 0 (zero), denotando quem ninguém bateu.
%
fim_jogo(jogo(_, jogadores(jogador(_, mao([])),_ ,_ , _),1)).
fim_jogo(jogo(_, jogadores(_, jogador(_, mao([])),_ , _),2)).
fim_jogo(jogo(_, jogadores(_, _, jogador(_, mao([])), _),3)).
fim_jogo(jogo(_, jogadores(_, _, _, jogador(_, mao([]))),4)).

fim_jogo(jogo(_, jogadores(J1,J2,J3,J4)),0):-
    J1 = jogador(preso,_),
    J2 = jogador(preso,_),
    J3 = jogador(preso,_),
    J4 = jogador(preso,_).

% ----------------------------------------------------------
distribuiPedras(jogadores(J1,J2,J3,J4)):-
    distribuiP(jogadores(mao(M1), mao(M2), mao(M3), mao(M4))),
    J1 =..[jogador,livre,mao(M1)],
    J2 =..[jogador,livre,mao(M2)],
    J3 =..[jogador,livre,mao(M3)],
    J4 =..[jogador,livre,mao(M4)].

% -------------------------------------------------------------------------------
inicia_jogo(0,jogadores(jogador(livre,mao(M1)),J2,J3,J4),Jogadores,Mesa,1):-
    member((6,6),M1),!,
    Mesa = (mesa([(6,6)],[(6,6)],[(6,6)],[(6,6)])),
    retiraDaMao((6,6),mao(M1),mao(M)),
    Jogadores = jogadores(jogador(livre,mao(M)),J2,J3,J4).

inicia_jogo(0,jogadores(J1,jogador(livre,mao(M2)),J3,J4), Jogadores,Mesa,2):-
    member((6,6),M2),!,
    Mesa = (mesa([(6,6)],[(6,6)],[(6,6)],[(6,6)])),
    retiraDaMao((6,6),mao(M2),mao(M)),
    Jogadores = jogadores(J1,jogador(livre,mao(M)),J3,J4).

inicia_jogo(0,jogadores(J1,J2,jogador(livre,mao(M3)),J4), Jogadores,Mesa,3):-
    member((6,6),M3),!,
    Mesa = (mesa([(6,6)],[(6,6)],[(6,6)],[(6,6)])),
    retiraDaMao((6,6),mao(M3),mao(M)),
    Jogadores = jogadores(J1,J2,jogador(livre,mao(M)),J4).

inicia_jogo(0,jogadores(J1,J2,J3,jogador(livre,mao(M4))), Jogadores,Mesa,4):-
    member((6,6),M4),
    Mesa = (mesa([(6,6)],[(6,6)],[(6,6)],[(6,6)])),
    retiraDaMao((6,6),mao(M4),mao(M)),
    Jogadores = jogadores(J1,J2,J3,jogador(livre,mao(M))).

% -------------------------------------------------------------------------------
efetua_jogada(domino,jogador(livre,mao(M)),NJogador,Mesa,Mesa1,lock(TK,Lock),NLock):-
    joga(mao(M),Mesa,mao(M1),Mesa1),
    estadoValido(Mesa1,E),!,
    write('  '), write(E), nl,
    (\+ Mesa = Mesa1,
     %mostre_mesa(Mesa1),
     NJogador = jogador(livre,mao(M1)),
     NLock = lock(TK,Lock),!, nl
     ;
     Mesa = Mesa1,
     lock_token(lock(TK,Lock),NLock),
     NJogador = jogador(preso,mao(M)),
     write(' Domino Passou!!!'), nl),!.

efetua_jogada(domino,jogador(preso,mao(M)),NJogador,Mesa,Mesa1,lock(TK,Lock),NLock):-
    joga(mao(M),Mesa,mao(M1),Mesa1),
    estadoValido(Mesa1,E),
    write('  '), write(E), nl,
    (\+ Mesa = Mesa1,
     %mostre_mesa(Mesa1),
     NJogador = jogador(livre,mao(M1)),
     unlock_token(lock(TK,Lock),NLock),
     write(E), nl
     ;
     Mesa = Mesa1,
     NJogador = jogador(preso,mao(M)),
     lock_token(lock(TK,Lock),NLock),
     write(' Domino passou!!!'), nl).

efetua_jogada(sapiens,jogador(livre,mao(M)),NJogador, Mesa, Mesa1,lock(TK,Lock),NLock):-
    estadoValido(Mesa,E),
    jogaveis(mao(M), E, Pedras),
    write('Escolha uma pedra de: '), write(M), nl,
    pegue_pedra(M,Pedras,Pedra),
    jogue(Pedra,Mesa,Mesa1),
    (\+ Pedra = passo,
     %mostre_mesa(Mesa1),
     write('Pedra jogada: '), write(Pedra), nl, 
     retiraDaMao(Pedra,mao(M),M2),
     NJogador = jogador(livre, M2),
     NLock = lock(TK,Lock),!, nl
     ;
     Pedra = passo,
     lock_token(lock(TK,Lock),NLock),
     NJogador = jogador(preso, mao(M)),
     write(' Passou!!!'), nl),!.

efetua_jogada(sapiens,jogador(preso,mao(M)),NJogador, Mesa, Mesa1,lock(TK,Lock),NLock):-
    estadoValido(Mesa,E),
    jogaveis(mao(M), E, Pedras),
    write('Escolha uma pedra de: '), write(M), write('  '), nl,
    pegue_pedra(M,Pedras,Pedra),
    jogue(Pedra,Mesa,Mesa1),
    (\+ Pedra = passo,
     %mostre_mesa(Mesa1),
     write('Pedra jogada: '), write(Pedra), nl, 
     retiraDaMao(Pedra,mao(M),M2),
     NJogador = jogador(livre, M2),
     NLock = lock(TK,Lock),!, nl
     ;
     Pedra = passo,
     lock_token(lock(TK,Lock),NLock),
     NJogador = jogador(preso, mao(M)),
     write(' Passou!!!'), nl),!.
     
pegue_pedra(M,Pedras,Pedra):-
    read(P),    
    (P \= passo,
     member(P,Pedras),
     Pedra = P
     ;
     P \= passo,
     \+ member(P,Pedras),
     write('Esta pedra '), write(P), write(' naum eh valida!'), nl,
     write('Escolha uma pedra de: '), write(M),
     pegue_pedra(M,Pedras,Pedra)
     ;
     Pedra = P,
     write('Jogador Passou!')), !.

% -------------------------------------------------------------------------------
lock_token(lock(TK,Lock),NLock):-
    (Lock < 4,
     Lock1 is Lock+1,
     NLock = lock(TK,Lock1), !
     ;
     TK1 is TK + 1,
     NLock = lock(TK1,Lock)).

unlock_token(lock(TK,Lock),NLock):-
    (TK > 0,
     TK1 is TK - 1,
     NLock = lock(TK1,Lock)
     ;
     TK = 0,
     Lock1 is Lock - 1,
     NLock = lock(TK,Lock1)).
     
% -------------------------------------------------------------------------------
vazia(mesa([],[],[],[])).
proximoJogar(1,2).
proximoJogar(2,3).
proximoJogar(3,4).
proximoJogar(4,1).

% -------------------------------------------------------------------------------
jodador_da_vez(1,jogadores(J1,J2,J3,J4),jogadores(J,J2,J3,J4),J1).
jodador_da_vez(2,jogadores(J1,J2,J3,J4),jogadores(J1,J,J3,J4),J2).
jodador_da_vez(3,jogadores(J1,J2,J3,J4),jogadores(J1,J2,J,J4),J3).
jodador_da_vez(4,jogadores(J1,J2,J3,J4),jogadores(J1,J2,J3,J),J4).

% -------------------------------------------------------------------------------
pontos_validos(estado((N,N),(N,N),(N,N),(N,N)),0).                % inicio do jogo
%pontos_validos(estado((N,N),P2,P3,P4),Total):-
    
% -------------------------------------------------------------------------------
inicia(P,_,mesa([P],[P],[P],[P])).

playDomino:-
    write('***************************'), nl,
    write('     Domino em Prolog    '), nl,
    write('***************************'), nl,
    escolhaEquipe(Dupla),
    escolha_dupla(Dupla,Equipes),
    distribuiPedras(PedrasJogadores),
    mostra_pedras(Equipes, PedrasJogadores),
    inicia_jogo(0,PedrasJogadores, NovasPedrasJogadores, Mesa, Vez),
    write('Iniciou com jogador: '), write(Vez), nl,
    proximoJogar(Vez,Proximo),
    jogue_domino(lock(0,0),jogo(Mesa, NovasPedrasJogadores, Equipes ,Proximo)).

% -------------------------------------------------------------------------------
% jogue_domino(+TokenGame,jogo(+Mesa,+ NovasPedrasJogadores ,+Equipes,+Vez+)):-
jogue_domino(Lock,jogo(Mesa, PedrasAJogar,Equipes,Vez)):-
    write('Vez do jogador: '), write(Vez), nl,
    mostre_mesa(Mesa),
    jodador_da_vez(Vez, PedrasAJogar, PedrasRestantes,Jogador), % Pedras com variável   
    quem_joga(Vez,Equipes,QuemJoga),
    efetua_jogada(QuemJoga, Jogador, NJogador,Mesa, NovaMesa, Lock, NLock),   
    arg(Vez, PedrasRestantes, NJogador),  % instancia variavel
    verifica_estado(NLock, jogo(NovaMesa, PedrasRestantes,Equipes,Vez)).

% -------------------------------------------------------------------------------
quem_joga(Vez,equipes(domino(D1,D2),_),domino):-
    (Vez = D1; Vez = D2),!.
quem_joga(Vez,equipes(_,sapiens(S1,S2)),sapiens):-
    (Vez = S1; Vez = S2),!.

% -------------------------------------------------------------------------------
verifica_estado(lock(4,4),jogo(Mesa,Pedras,_,_)):-
    estadoValido(Mesa,E),
    write('***JOGO TRAVOU COM Pontas finais: '), write(E), nl,
    write('Equipes com pedras: '), write(Pedras),!.
verifica_estado(_,jogo(Mesa,Pedras,_,Vez)):-
    fim_jogo(jogo(Mesa,Pedras,Vez)),!,
    estadoValido(Mesa,E),
    write('Pontas finais: '), write(E).
verifica_estado(Lock,jogo(Mesa, Pedras, Equipes,Vez)):-
    proximoJogar(Vez,Proximo),
    jogue_domino(Lock,jogo(Mesa, Pedras, Equipes,Proximo)),!.

% -------------------------------------------------------------------
escolha_dupla(Dupla,equipes(Domino,Sapiens)):-
    %write('Possiveis equipes: '), nl,
    %write('----------------------'), nl,
    %write('[1] - Jogadores 1 e 3'), nl,
    %write('[2] - Jogadores 2 e 4'), nl, 
    %write('Escolha sua equipe: '), nl,
    (
     Dupla \= 1, Dupla \= 2, !,   % Escolha invalida se nao for 1 ou 1
     write('Error : não é uma escolha válida !'), nl,
     escolha_dupla(equipes(Domino, Sapiens))
     ;
     Dupla = 1,
     Domino = domino(2,4), 
     Sapiens = sapiens(1,3)
     ;
     Dupla = 2,
     Domino = domino(1,3), 
     Sapiens = sapiens(2,4)
    ).

% -------------------------------------------------------------------
mostra_pedras(equipes(_,sapiens(S1,S2)), PedrasJogadores):-
    arg(S1, PedrasJogadores ,P1),
    arg(S2, PedrasJogadores ,P2),
    write(' *Jogador*      *Pedras* '), nl,
    write('      '),  write(S1), write(' :       '),  write(P1), nl,
    write('      '),  write(S2), write(' :       '),  write(P2), nl.
% -------------------------------------------------------------------
mostre_mesa(mesa(P1,P2,P3,P4)):-
    qualEstado(mesa(P1,P2,P3,P4),E),
    write('P1: '), write(P1), nl,
    write('P2: '), write(P2), nl,
    write('P3: '), write(P3), nl,
    write('P4: '), write(P4), nl,
    write(' ------------------------------------------'), nl,
    write(E), nl.

