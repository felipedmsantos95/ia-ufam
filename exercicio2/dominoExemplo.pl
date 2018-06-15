%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                  
% Jogo do domino bastante simplificado e incompleto
%
% Autor: Edjard Mota       
% Data : 13/04/2018              
%                                  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-
    use_module(library(lists)).


state(0,mesa([],[],[],[])).

vazia(mesa([],[],[],[])).

jogar(P1,Mesa,State2):-
   vazia(Mesa),
   inicia(P1,Mesa,State2),!.

jogar(P,mesa([H1|T1],P2,P3,P4),mesa([NH1|[H1|T1]],P2,P3,P4)):-
   joguePonta(P,H1,NH1).

jogar(P,mesa(P1,[H2|T2],P3,P4),mesa(P1,[NH2|[H2|T2]],P3,P4)):-
   joguePonta(P,H2,NH2).

jogar(P1,mesa([H1|T1],P3,P4,P5),mesa([NH1|[H1|T1]],P3,P4,P5)):-
   joguePonta(P1,H1,NH1).

jogar(P1,mesa([H1|T1],P3,P4,P5),mesa([NH1|[H1|T1]],P3,P4,P5)):-
   joguePonta(P1,H1,NH1).

joguePonta((X,Y),(X,_),(Y,X)).
joguePonta((Y,X),(X,_),(Y,X)).

inicia(P,_,mesa([P],[P],[P],[P])).

