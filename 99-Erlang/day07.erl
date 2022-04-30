
%%              L-99: Ninety-Nine Lisp Problems
%%
%%  Based on a Prolog problem list by werner.hett@hti.bfh.ch
%%
%%   P07 (**) Flatten a nested list structure.
%%           Transform a list, possibly holding lists as elements into a
%%           `flat' list by replacing each list with its elements
%%           (recursively).
%%
%%           Example:
%%           * (my-flatten '(a (b (c d) e)))
%%           (A B C D E)


-module(day07).
-export([run/0]).

-spec test_list_one() -> list().
test_list_one() ->
    [[[a, [b, [c], b], e], [a,b,c,d,e]], true].
-spec list_tests_of() -> list().
list_tests_of() ->
    [[[[a, b, c, b, a], []], true],
     [[[a, b, c, d], []], false],
     [[[a, b, a], []], true],
     [[[a, b, c, c, b, a], []], true], 
     [[[a, a], []], true],
     [[[a, b], []], false],
     [[[a], []], false],
     [[[], []], false]]. 


-spec solution_acc (list(), list()) -> list().
solution_acc([], []) ->
    [];
solution_acc(_, []) ->
    [].


-spec solution(list()) -> list().
solution([]) ->
    [];
solution(XXS) ->
    solution_acc(XXS, []).


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


-spec reverse(list()) -> list().
reverse([]) ->
    [];
reverse([A]) ->
    [A];
reverse([A|T]) ->
    reverse(T) ++ [A].


run() ->
    % hello_world.
    reverse(test_on_list([test_list_one()], [])).
    % reverse(test_on_list(list_tests_of(), [])).




