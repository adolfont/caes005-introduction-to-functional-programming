-module(jokenpo).
-export([play/2]).

play(X,X)  -> 
    case lists:member(X, [rock, paper, scissors]) of
        true -> 
            {tie, X};
        false ->
            {"Error: invalid options!", {X, X}}
    end;
play(rock,paper) -> {win, paper};
play(paper,rock) -> {win, paper};
play(rock,scissors) -> {win, rock};
play(scissors,rock) -> {win, rock};
play(scissors,paper) -> {win, scissors};
play(paper,scissors) -> {win, scissors};
play(X,Y) -> {error, "Error: invalid options!", {X, Y}}.

% c("jokenpo.erl").
% jokenpo:play(paper, scissors).
% will return {win,scissors}


