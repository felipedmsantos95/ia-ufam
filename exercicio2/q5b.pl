
% procurar elemento por elemento das maos dos jogadores para ver quem tem a carroça sena

verificaSena(mao([(6,6),B,C,D,E,F,G]),mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([(6,6),B,C,D,E,F,G])).
verificaSena(mao([A,(6,6),C,D,E,F,G]),mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([A,(6,6),C,D,E,F,G])).
verificaSena(mao([A,B,(6,6),D,E,F,G]),mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([A,B,(6,6),D,E,F,G])).
verificaSena(mao([A,B,C,(6,6),E,F,G]),mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([A,B,C,(6,6),E,F,G])).
verificaSena(mao([A,B,C,D,(6,6),F,G]),mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([A,B,C,D,(6,6),F,G])).
verificaSena(mao([A,B,C,D,E,(6,6),G]),mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([A,B,C,D,E,(6,6),G])).
verificaSena(mao([A,B,C,D,E,F,(6,6)]),mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([A,B,C,D,E,F,(6,6)])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([(6,6),B,C,D,E,F,G]), mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([(6,6),B,C,D,E,F,G])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([A,(6,6),C,D,E,F,G]), mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([A,(6,6),C,D,E,F,G])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([A,B,(6,6),D,E,F,G]), mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([A,B,(6,6),D,E,F,G])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([A,B,C,(6,6),E,F,G]), mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([A,B,C,(6,6),E,F,G])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([A,B,C,D,(6,6),F,G]), mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([A,B,C,D,(6,6),F,G])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([A,B,C,D,E,(6,6),G]), mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([A,B,C,D,E,(6,6),G])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([A,B,C,D,E,F,(6,6)]), mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([A,B,C,D,E,F,(6,6)])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([_,_,_,_,_,_,_]), mao([(6,6),B,C,D,E,F,G]), mao([_,_,_,_,_,_,_]), mao([(6,6),B,C,D,E,F,G])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([_,_,_,_,_,_,_]), mao([A,(6,6),C,D,E,F,G]), mao([_,_,_,_,_,_,_]), mao([A,(6,6),C,D,E,F,G])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([_,_,_,_,_,_,_]), mao([A,B,(6,6),D,E,F,G]), mao([_,_,_,_,_,_,_]), mao([A,B,(6,6),D,E,F,G])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([_,_,_,_,_,_,_]), mao([A,B,C,(6,6),E,F,G]), mao([_,_,_,_,_,_,_]), mao([A,B,C,(6,6),E,F,G])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([_,_,_,_,_,_,_]), mao([A,B,C,D,(6,6),F,G]), mao([_,_,_,_,_,_,_]), mao([A,B,C,D,(6,6),F,G])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([_,_,_,_,_,_,_]), mao([A,B,C,D,E,(6,6),G]), mao([_,_,_,_,_,_,_]), mao([A,B,C,D,E,(6,6),G])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([_,_,_,_,_,_,_]), mao([A,B,C,D,E,F,(6,6)]), mao([_,_,_,_,_,_,_]), mao([A,B,C,D,E,F,(6,6)])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([(6,6),B,C,D,E,F,G]), mao([(6,6),B,C,D,E,F,G])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([A,(6,6),C,D,E,F,G]), mao([A,(6,6),C,D,E,F,G])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([A,B,(6,6),D,E,F,G]), mao([A,B,(6,6),D,E,F,G])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([A,B,C,(6,6),E,F,G]), mao([A,B,C,(6,6),E,F,G])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([A,B,C,D,(6,6),F,G]), mao([A,B,C,D,(6,6),F,G])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([A,B,C,D,E,(6,6),G]), mao([A,B,C,D,E,(6,6),G])).
verificaSena(mao([_,_,_,_,_,_,_]),mao([_,_,_,_,_,_,_]), mao([_,_,_,_,_,_,_]), mao([A,B,C,D,E,F,(6,6)]), mao([A,B,C,D,E,F,(6,6)])).


terminaJogo(equipes(mao([]), mao([]), mao([]), mao([_,_,_,_,_,_,_]))).
terminaJogo(equipes(mao([]), mao([]), mao([]), mao([_,_,_,_,_,_]))).
terminaJogo(equipes(mao([]), mao([]), mao([]), mao([_,_,_,_,_]))).
terminaJogo(equipes(mao([]), mao([]), mao([]), mao([_,_,_,_]))).
terminaJogo(equipes(mao([]), mao([]), mao([]), mao([_,_]))).
terminaJogo(equipes(mao([]), mao([]), mao([]), mao([_]))).
terminaJogo(equipes(mao([]), mao([]), mao([_,_,_,_,_,_,_]), mao([]))).
terminaJogo(equipes(mao([]), mao([]), mao([_,_,_,_,_,_]), mao([]))).
terminaJogo(equipes(mao([]), mao([]), mao([_,_,_,_,_]), mao([]))).
terminaJogo(equipes(mao([]), mao([]), mao([_,_,_,_]), mao([]))).
terminaJogo(equipes(mao([]), mao([]), mao([_,_,_]), mao([]))).
terminaJogo(equipes(mao([]), mao([]), mao([_,_]), mao([]))).
terminaJogo(equipes(mao([]), mao([]), mao([_]), mao([]))).
terminaJogo(equipes(mao([]), mao([_,_,_,_,_,_,_]), mao([]), mao([]))).
terminaJogo(equipes(mao([]), mao([_,_,_,_,_,_]), mao([]), mao([]))).
terminaJogo(equipes(mao([]), mao([_,_,_,_,_]), mao([]), mao([]))).
terminaJogo(equipes(mao([]), mao([_,_,_,_]), mao([]), mao([]))).
terminaJogo(equipes(mao([]), mao([_,_,_]), mao([]), mao([]))).
terminaJogo(equipes(mao([]), mao([_,_]), mao([]), mao([]))).
terminaJogo(equipes(mao([]), mao([_]), mao([]), mao([]))).
terminaJogo(equipes(mao([_,_,_,_,_,_,_]), mao([]), mao([]), mao([]))).
terminaJogo(equipes(mao([_,_,_,_,_,_]), mao([]), mao([]), mao([]))).
terminaJogo(equipes(mao([_,_,_,_,_]), mao([]), mao([]), mao([]))).
terminaJogo(equipes(mao([_,_,_,_]), mao([]), mao([]), mao([]))).
terminaJogo(equipes(mao([_,_,_]), mao([]), mao([]), mao([]))).
terminaJogo(equipes(mao([_,_]), mao([]), mao([]), mao([]))).
terminaJogo(equipes(mao([_]), mao([]), mao([]), mao([]))).

loop_entryJ1(equipes(J1,J2,J3,J4),M):-
   terminaJogo(equipes(J1,J2,J3,J4)),
   removeM((6,6), J1, J1N),
   joga(J2,M, J2N, MN),
   joga(J3,MN, J3N, MN1),
   joga(J4, MN1, J4N, MN2),
   loop_entryJ1(equipes(J1N, J2N, J3N, J4N), MN2).
    

play(M):-
    distribuiPedras(E),
    E = equipes(J1,J2,J3,J4),
    verificaSena(J1,J2,J3,J4,X),
    M = mesa([(6,6)], [(6,6)], [(6,6)], [(6,6)]),
    loop_entryJ1(equipes(J1,J2,J3,J4),M).
    
    

