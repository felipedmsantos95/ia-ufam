
%O jogo termina quando 3 dos 4 jogadores esvaziarem suas maos

terminaJogo(equipes(mao([]), mao([]), mao([]), mao([_,_,_,_,_,_,_]))).
terminaJogo(equipes(mao([]), mao([]), mao([]), mao([_,_,_,_,_,_]))).
terminaJogo(equipes(mao([]), mao([]), mao([]), mao([_,_,_,_,_]))).
terminaJogo(equipes(mao([]), mao([]), mao([]), mao([_,_,_,_]))).
terminaJogo(equipes(mao([]), mao([]), mao([]), mao([_,_,]))).
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

