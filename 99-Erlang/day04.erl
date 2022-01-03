
%%                       L-99: Ninety-Nine Lisp Problems
%%
%%  Based on a Prolog problem list by werner.hett@hti.bfh.ch
%%
%% Working with lists
%%
%%
%%   P04 (*) Find the number of elements of a list.



-module(day04).
-export([run/0]).


-spec test_list_one() -> list().
test_list_one() ->
    [[[a, b, c, d, e], []], 4].

-spec list_tests_of() -> list().
list_tests_of() ->
    [[[[a, b, c, d, e], []], 4],
     [[[a, b, c, d], []], 3],
     [[[a, b, c], []], 2],
     [[[a, b, c, d, e, f], []], 5],
     [[[a, b], []], 1],
     [[[a, b], []], 1],
     [[[a], []], 0],
     [[[], []], nil]].


-spec solution_acc(list(), number()) -> number().
solution_acc([], Acc) ->
    Acc;
solution_acc([_|T], Acc) ->
    solution_acc(T, (Acc + 1)).


-spec solution(list()) -> number().
solution([]) ->
    nil;
solution(HT) ->
    solution_acc(HT, -1).



-spec test_on_list(list(), list()) -> list().
test_on_list([H|T], Acc) ->
    [[Test,ArgsV], Check] = H,
    [] = ArgsV,
    Rn = solution(Test),
    case Rn of
	Check ->
	    test_on_list(T, [{Check, ok}|Acc]);
	_N ->
	    test_on_list(T, [{Rn, error}|Acc])
    end;
test_on_list([], Lis) ->
    Lis.


run() ->
    % hello_world,
    lists:reverse(test_on_list([test_list_one()], [])),
    lists:reverse(test_on_list(list_tests_of(), [])).
