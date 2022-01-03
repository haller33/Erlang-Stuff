
%%                L-99: Ninety-Nine Lisp Problems
%%
%%  Based on a Prolog problem list by werner.hett@hti.bfh.ch
%%
%%Working with lists
%%
%%   P03 (*) Find the K'th element of a list.
%%           The first element in the list is number 1.
%%           Example:
%%           * (element-at '(a b c d e) 3)
%%           C

-module(day03).
-export([run/0]).

-spec test_list_one() -> list().
test_list_one() ->
    [[[a, b, c, d, e], [3]], c].

-spec list_tests_of() -> list().
list_tests_of() ->
    [[[[a, b, c, d, e], [3]], c],
     [[[a, b, c, d], [2]], b],
     [[[a, b, c], [3]], c],
     [[[a, b, c, d, e, f], [6]], f],
     [[[a, b], [2]], b],
     [[[a, b], [1]], a],
     [[[a], [1]], a],
     [[[], [1]], []]].



-spec solution_acc(list(), number(), number()) -> atom().
solution_acc([], _N, _Acc) ->
    [];
solution_acc([H|T], Num, Acc) ->
    case Acc of
	Num ->
	    H;
	_Else ->
	    solution_acc(T, Num, (Acc + 1))
    end.


-spec solution(list(), number()) -> atom().
solution([], _N) ->
    [];
solution(HT, Num) ->
    solution_acc(HT, Num, 1).



-spec test_on_list(list(), list()) -> list().
test_on_list([H|T], Acc) ->
    [[Test,ArgsV], Check] = H,
    [Argv1] = ArgsV,
    Rn = solution(Test, Argv1),
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
    % [test_list_one(),
    % solution(),
    lists:reverse(test_on_list([test_list_one()], [])),
    lists:reverse(test_on_list(list_tests_of(), [])).
