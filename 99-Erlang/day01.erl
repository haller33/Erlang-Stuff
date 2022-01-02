%% L-99: Ninety-Nine Lisp Problems
%% 
%%   Based on a Prolog problem list by werner.hett@ht%% i.bfh.ch
%% 
%% Working with lists
%% 
%%    P01 (*) Find the last box of a list.           
%%                Example:
%%            * (my-last '(a b c d))                 
%%                (D)
%% 


-module(day01).
-export([run/0]).

-spec list_test() -> list().
list_test() ->
    [a, b, c, d].

-spec lists_for_test() -> list().
lists_for_test() ->
    [[[a, b, c, d], [d]],
     [[a, b, c, d, n, k, j], [j]],
     [[a, c, d, h], [h]],
     [[a], [a]]].



-spec last_element(atom(), list()) -> list().
last_element(_N, [H|T]) ->
    last_element(H, T);
last_element(H, []) ->
    % io:format("~p\n", atom_to_list(H)),
    [H].

-spec last(list()) -> list().
last([H|T]) ->
    last_element(H, T).

-spec test_on_list(list(), list()) -> list().
test_on_list([H|T], Acc) ->
    [Test|Check] = H,
    [Res] = Check,
    Rn = last(Test),
    case Rn of
	Res ->
	    test_on_list(T, [{Res, ok}|Acc]);
	_N -> 
	    test_on_list(T, [{Rn, error}|Acc])
    end;
test_on_list([], Lis) ->
    Lis.
    

run() ->
    Returns = last(list_test()),
    io:format("~p ok\n", Returns),
    lists:reverse(test_on_list(lists_for_test(), [])).
    % {hello_world, ok}.
