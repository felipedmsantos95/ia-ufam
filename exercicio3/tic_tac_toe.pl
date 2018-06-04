%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                  %
% TicTacToe (Minimax & Alpha-beta) %
%                                  %
% TicTacToe game.                  %
%                                  %
% Author : Lens Stephane ULg       %
% Date   : 11/06/2009              %
%                                  %
% ?- play.                         %
% to start the game                %
%                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


:- set_prolog_flag(toplevel_print_options,
                   [quoted(true), portray(true), max_depth(0)]).

:- [minimax].
%:- use_module(minimax).



% bestMove(+Pos, -NextPos)
% Compute the best Next Position from Position Pos
% with minimax or alpha-beta algorithm.
bestMove(Pos, NextPos) :-
    minimax(Pos, NextPos, _).



%
% We represent a game position by a list [Player, State, Board],
% where Player is the next player to play,
% State is equal to 'play' if not final posit., 'win' if win or 'draw' if draw
% and Board is the actual board of the game.
%
% The board is represented by a list of 9 elements
% (the first 3 elements are the first line of the board, ...).
% An empty case is represented by '0'.
%
% We choose x to be the MAX player and o the MIN player.
%
%
% TODO :
% - Add the number of empty cases in Board to test draw faster.
% - Try to not test all lines/cols/diags for winning or draw after a move,
%   but only the modified ones.
%



% play
% Start the game.
play :-
    nl,
    write('********************'), nl,
	  write('* Prolog TicTacToe *'), nl,
	  write('********************'), nl, nl,
	  write('Rem : x starts the game'), nl,
	  playAskColor.
	
	
	
% playAskColor
% Ask the color for the human player and start the game with it.
playAskColor :-
	  nl, write('Color for human player ? (x or o)'), nl,
	  read(Player), nl,
	  (
	    Player \= o, Player \= x, !,     % If not x or o -> not a valid color
	    write('Error : not a valid color !'), nl,
	    playAskColor                     % Ask again
	    ;
	    EmptyBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0],
	    show(EmptyBoard), nl,
	
	    % Start the game with color and emptyBoard
	    play([x, play, EmptyBoard], Player)
	  ).



% play(+Position, +HumanPlayer)
% If next player to play in position is equal to HumanPlayer -> Human must play
% Ask to human what to do.
play([Player, play, Board], Player) :- !,
    nl, write('Next move ?'), nl,
    read(Pos), nl,                                  % Ask human where to play
    (
      humanMove([Player, play, Board], [NextPlayer, State, NextBoard], Pos), !,
      show(NextBoard),
      (
        State = win, !,                             % If Player win -> stop
        nl, write('End of game : '),
        write(Player), write(' win !'), nl, nl
        ; % OR
        State = draw, !,                            % If draw -> stop
        nl, write('End of game : '),
        write(' draw !'), nl, nl
        ; % OR
        play([NextPlayer, play, NextBoard], Player) % Else -> continue the game
      )
      ; % OR
      write('-> Bad Move !'), nl,                % If humanMove fail -> bad move
      play([Player, play, Board], Player)        % Ask again
    ).



% play(+Position, +HumanPlayer)
% If it is not human who must play -> Computer must play
% Compute the best move for computer with minimax or alpha-beta.
play([Player, play, Board], HumanPlayer) :-
    nl, write('Computer play : '), nl, nl,
    % Compute the best move
    bestMove([Player, play, Board], [NextPlayer, State, BestSuccBoard]),
    show(BestSuccBoard),
    (
      State = win, !,                                 % If Player win -> stop
      nl, write('End of game : '),
      write(Player), write(' win !'), nl, nl
      ;
      State = draw, !,                                % If draw -> stop
      nl, write('End of game : '), write(' draw !'), nl, nl
      ;
      % Else -> continue the game
      play([NextPlayer, play, BestSuccBoard], HumanPlayer)
    ).



% nextPlayer(X1, X2)
% True if X2 is the next player to play after X1.
nextPlayer(o, x).
nextPlayer(x, o).



% move(+Pos, -NextPos)
% True if there is a legal (according to rules) move from Pos to NextPos.
move([X1, play, Board], [X2, State, NextBoard]) :-
    nextPlayer(X1, X2),
    move_aux(X1, Board, NextBoard),
    (
      winningPos(X1, NextBoard), !, State = win ;
      drawPos(NextBoard), !, State = draw ;
      State = play
    ).



% move_aux(+Player, +Board, -NextBoard)
% True if NextBoard is Board whit an empty case replaced by Player mark.
move_aux(P, [0|Bs], [P|Bs]).

move_aux(P, [B|Bs], [B|B2s]) :-
    move_aux(P, Bs, B2s).



% min_to_move(+Pos)
% True if the next player to play is the MIN player.
min_to_move([o, _, _]).

% max_to_move(+Pos)
% True if the next player to play is the MAX player.
max_to_move([x, _, _]).



% When human play
humanMove([X1, play, Board], [X2, State, NextBoard], Pos) :-
    nextPlayer(X1, X2),
    set1(Pos, X1, Board, NextBoard),
    (
      winningPos(X1, NextBoard), !, State = win ;
      drawPos(NextBoard), !, State = draw ;
      State = play
    ).



% set1(+Elem, +Pos, +List, -ResList).
% Set Elem at Position Pos in List => Result in ResList.
% Rem : counting starts at 1.
set1(1, E, [X|Ls], [E|Ls]) :- !, X = 0.

set1(P, E, [X|Ls], [X|L2s]) :-
    number(P),
    P1 is P - 1,
    set1(P1, E, Ls, L2s).



% evalPos(+Pos, -Val) :-
% True if Val the the result of the evaluation function at Pos.
% We will only evaluate for final position.
% So we will only have MAX win, MIN win or draw.
% We will use  1 when MAX win
%             -1 when MIN win
%              0 otherwise.
evalPos([o, win, _], 1).       % Previous player (MAX) has win.
evalPos([x, win, _], -1).      % Previous player (MIN) has win.
evalPos([_, draw, _], 0).



% winningPos(+Player, +Board)
% True if Player win in Board.
winningPos(P, [X1, X2, X3, X4, X5, X6, X7, X8, X9]) :-
    equal(X1, X2, X3, P) ;    % 1st line
    equal(X4, X5, X6, P) ;    % 2nd line
    equal(X7, X8, X9, P) ;    % 3rd line
    equal(X1, X4, X7, P) ;    % 1st col
    equal(X2, X5, X8, P) ;    % 2nd col
    equal(X3, X6, X9, P) ;    % 3rd col
    equal(X1, X5, X9, P) ;    % 1st diag
    equal(X3, X5, X7, P).     % 2nd diag



% equal(+W, +X, +Y, +Z).
% True if W = X = Y = Z.
equal(X, X, X, X).



% drawPos(+Player, +Board)
% True if the game is a draw.
drawPos(Board) :-
    \+ member(0, Board).



% show(+Board)
% Show the board to current output.
show([X1, X2, X3, X4, X5, X6, X7, X8, X9]) :-
    write('   '), show2(X1),
    write(' | '), show2(X2),
    write(' | '), show2(X3), nl,
    write('  -----------'), nl,
    write('   '), show2(X4),
    write(' | '), show2(X5),
    write(' | '), show2(X6), nl,
    write('  -----------'), nl,
    write('   '), show2(X7),
    write(' | '), show2(X8),
    write(' | '), show2(X9), nl.



% show2(+Term)
% Write the term to current outupt
% Replace 0 by ' '.
show2(X) :-
    X = 0, !,
    write(' ').

show2(X) :-
    write(X).