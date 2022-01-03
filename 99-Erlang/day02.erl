
%%             L-99: Ninety-Nine Lisp Problems
%%
%%  Based on a Prolog problem list by werner.hett@hti.bfh.ch
%%
%%   P02 (*) Find the last but one box of a list.
%%           Example:
%%           * (my-but-last '(a b c d))
%%           (C D)
%%


-module(day02).
-export([run/0]).


-spec test_list_one() -> list().
test_list_one() ->
    [a, b, c, d].

-spec test_list_of_items() -> list().
test_list_of_items() ->
    [[[a, b, c, d, e], [d, e]],
     [[a, n, m, e], [m, e]],
     [[a, c], [a, c]],
     [[a], [a]],
     [[], []]].


-spec solution(list()) -> list().
solution([]) ->
    [];
solution([A|[]]) ->
    [A];
solution([A,B|[]]) ->
    [A,B];
solution([_H|T]) ->
    solution(T).


-spec test_on_list(list(), list()) -> list().
test_on_list([H|T], Acc) ->
    [Test|Check] = H,
    [Res] = Check,
    Rn = solution(Test),
    case Rn of
	Res ->
	    test_on_list(T, [{Res, ok}|Acc]);
	_N ->
	    test_on_list(T, [{Rn, error}|Acc])
    end;
test_on_list([], Lis) ->
    Lis.

-spec run() -> atom().
run() ->
    % hello_world.
    solution(test_list_one()),
    lists:reverse(test_on_list(test_list_of_items(), [])).
