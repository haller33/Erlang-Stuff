
%%              L-99: Ninety-Nine Lisp Problems
%%
%%  Based on a Prolog problem list by werner.hett@hti.bfh.ch
%%
%% Working with lists
%%
%%   P06 (*) Find out whether a list is a palindrome.
%%           A palindrome can be read forward or backward; e.g%%. (x a m a x).
%%



-module(day06).
-export([run/0]).


-spec test_list_one() -> list().
test_list_one() ->
    [[[[a, b, c, b, a], []], true]].
 -spec list_tests_of() -> list().
list_tests_of() ->
    [[[[a, b, c, b, a], []], true],
     [[[a, b, c, d], []], false],
     [[[a, b, a], []], true],
     [[[a, b, c, c, b, a], []], true], %% TODO ERROR
     [[[a, a], []], true],
     [[[a, b], []], false],
     [[[a], []], false],
     [[[], []], false]].

-spec element_at(list(), number(), number()) -> atom().
element_at([], _N, _Acc) ->
    [];
element_at([H|T], Num, Acc) ->
    case Acc of
	Num ->
	    H;
	_Else ->
	    element_at(T, Num, (Acc + 1))
    end.

-spec lenght(list(), number()) -> number().
lenght([], Acc) ->
    Acc;
lenght([_|T], Acc) ->
    lenght(T, (Acc + 1)).


-spec reverse(list()) -> list().
reverse([]) ->
    [];
reverse([A]) ->
    [A];
reverse([A|T]) ->
    reverse(T) ++ [A].

% -spec solution_acc(list(), list(), atom(), atom(), number()) -> atom().
solution_acc([], [], _, _, 0) ->
    true;
solution_acc([X|_], [S|_], nil, _, 0) ->
    case X of
	S -> true;
	_ -> false
    end;
solution_acc([X|XS], [S|SX], nil, _, Number) ->
    case X of
	S ->
	    solution_acc(XS, SX, nil, nil, (Number - 1));
	_ -> false
    end;
solution_acc([X|_], [S|_], ok, Sym, 0) ->
    case X of
	Sym ->
	    true;
	S -> 
	    false;
	_ ->
	    false
    end;
solution_acc([X|XS], [S|SX], ok, Sym, Number) ->
    case X of
	S ->
	    solution_acc(XS, SX, ok, Sym, (Number - 1));
	_ -> false
    end.

-spec solution(list()) -> list().
solution([]) ->
    false;
solution(XXS) ->
    Lenght = lenght(XXS, 1),
    case Lenght > 2 of
        false -> false;
	true -> 
	    case Lenght rem 2 of
		0 -> ActualLength = Lenght div 2,
		     solution_acc(XXS, reverse(XXS), nil, nil, ActualLength);
		1 -> ActualLength = (Lenght div 2) + 1,
		     solution_acc(XXS, reverse(XXS), ok, element_at(XXS, ActualLength, 1), ActualLength)
	    end
    end.

-spec test_on_list(list(), list()) -> list().
test_on_list([H|T], Acc) ->
    [[Test,ArgsV], Check] = H,
    [] = ArgsV,
    Rn = solution(Test),
    case Rn of
	Check ->
	    test_on_list(T, [{Check, ok}|Acc]);
	_N ->
	    test_on_list(T, [{{Check, Rn, Test}, error}|Acc])
    end;
test_on_list([], Lis) ->
    Lis.

run() ->
  % hello_world.
    reverse(test_on_list(test_list_one(), [])),
    
    reverse(test_on_list(list_tests_of(), [])).
