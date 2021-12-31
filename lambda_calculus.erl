%% Lambda calculus evaluator on Erlang

-module(lambda_calculus).
% -export([print/1, identity/0, y_combinator/0, test_lambda/0, apply/2]).
-export([print/1, identity/0, y_combinator/0, test_lambda/0]).
-export_type([]).


%%
%% TODO
%%
%% Implement Beta-Eta-Reduction
%% Implement Eval
%% Implement Apply
%% Implement Reduce
%% Implement Parser
%% Implement closures and defun

%%% Types
%% a lambda is the form
%%   (\a.s-expression)
%%
%% the s-expression can be
%% 
%%  (\a.a)           <- lambda
%%
%%  (\a.a a)(\a.a a) <- abstraction
%%  (\a.b)c          <- also abstraction
%%  
%%  a                <- a atom | with is also a symbol
%%  asdfasdf         <- also a atom
%%
%% where they need to have a environment on the lambda
%% 

-type symbol() :: {'sym', atom()}.

-type s_expr() :: {'lambda', atom(), [s_expr()]}
	        | symbol()
		| {'abstrac', s_expr(), s_expr()}.

-type env() :: [{symbol(), s_expr()}].

-type beta() :: {'beta', {symbol(), symbol()}}.

-type eta() :: {'eta', [beta()], s_expr()}.



%%
%% @doc print/1
%%
%% take a expression and convert to string
-spec print(s_expr()) -> string().
print({beta, {sym, A}, {sym,B}}) ->
    "[" ++ atom_to_list(B) ++ "/" ++ atom_to_list(A) ++ "]";
print({lambda, {sym, Atm}, [Exhead|Extail]}) ->
    "(\\" ++ atom_to_list(Atm) ++ "." ++ print(Exhead) ++ print(Extail) ++ ")";
print([Exhead|Extail]) -> 
    print(Exhead) ++ print(Extail);
print({abstrac, Ex1, Ex2}) ->
    "(" ++ print(Ex1) ++ " " ++ print(Ex2) ++ ")";
print({eta, [HeadEnv|TailEnv], Exp}) ->
    "(be" ++ print(HeadEnv) ++ print(TailEnv) ++ print(Exp) ++ ")";
print([]) -> 
    "";
print({sym, N}) ->
    atom_to_list(N).
%% print(E) -> %% this needs to be commented for soundness
%%    atom_to_list(E).

%% 
%% @doc identity/0
%% 
%% Identity s-expression
-spec identity() -> s_expr().
identity() ->
    {lambda, {sym, a}, [{sym, a}]}.

%% 
%% @doc y_combinator/0
%%
%% Y Combinator for my interpreter.
-spec y_combinator() -> s_expr().
y_combinator () ->
    {abstrac, {lambda, {sym, a}, [{abstrac, {sym, a}, {sym, a}}]}, {lambda, {sym, a}, [{abstrac, {sym, a}, {sym, a}}]}}.


%%
%% @doc test_lambda/0
%%
%% Test Lambda Print Function.
-spec test_lambda() -> s_expr().
test_lambda() ->
    {lambda, {sym, a}, [{sym, a}, {sym, a}, {lambda, {sym,x}, [{sym, y}]}]}.


%%
%% @doc reduce/2
%% 
%% Apply beta reduction on one expression
-spec reduce(beta(), s_expr(), env()) -> s_expr().
reduce({beta, {sym,A}, {sym,B}}, {lambda, {sym,C}, [Exp]}, Env) ->
    A.
    

%%
%% @doc apply
%% 
%% Apply beta-eta reduction on a s-expression.
%% -spec apply(eta(), env()) -> s_expr().
%% apply() ->
%%     nil.


%%
%% @doc eval/2
%%
%% Evaluator with no environment.
%% -spec eval(s_expr(),env()) -> beta().
%% eval({sym, N}, Env) ->
%%     {beta, Env, {sym, N}};
%% eval({lambda, Atm, Ex}, Env) ->
%%     {beta, Env, {lambda, Atm, Ex}};
%% eval({abstrac, {lambda, N, Exp1}, Exp2}, Env) ->
%%     {beta, NExp, NEnv} = eval(Exp2, Env),
%%     NEnv1 = NEnv ++ Env,
%%     Exp2.
 
 


    
    

    
%% @doc lookup/2
%% Key in a list of key-value pairs.
%% Fails if the key not present.
-spec lookup(atom(),env()) -> integer().
lookup(A, {A,V}) ->
    V;
lookup(A, [{A,V}|_]) ->
    V;
lookup(A, [_|Rest]) ->
    lookup(A,Rest).



%% @doc replace/3
%% replace caracters on erlang.
%% replace([], _, _) -> [];
%% replace([H|T], P, R) ->
%%     [ if H =:= P -> R;
%%          true -> H
%%       end | replace(T, P, R)].
%% 
