

%%           L-99: Ninety-Nine Lisp Problems
%%
%%  Based on a Prolog problem list by werner.hett@hti.bfh.ch
%%
%% Working with lists
%%   P05 (*) Reverse a list.
%%


-module(day05).
-export([run/0]).


-spec test_list_one() -> list().
test_list_one() ->
    [[[a, b, c, d, e], []], [e, d, c, b, a]].

-spec list_tests_of() -> list().
list_tests_of() ->
    [[[[a, b, c, d, e], []], [e,d,c,b,a]],
     [[[a, b, c, d], []], [d,c,b,a]],
     [[[a, b, c], []], [c,b,a]],
     [[[a, b, c, d, e, f], []], [f,e,d,c,b,a]],
     [[[a, b], []], [b,a]],
     [[[a], []], [a]],
     [[[], []], []]].



-spec solution(list()) -> list().
solution([]) ->
    [];
solution([A]) ->
    [A];
solution([A|T]) ->
    solution(T) ++ [A].



-spec test_on_list(list(), list()) -> list().
test_on_list([H|T], Acc) ->
    [[Test,ArgsV], Check] = H,
    [] = ArgsV,
    Rn = solution(Test),
    case Rn of
	Check ->
	    test_on_list(T, [{Check, ok}|Acc]);
	_N ->
	    test_on_list(T, [{{Check, Rn}, error}|Acc])
    end;
test_on_list([], Lis) ->
    Lis.


run() ->
    % hello_world.
    lists:reverse(test_on_list([test_list_one()], [])),
    lists:reverse(test_on_list(list_tests_of(), [])).
