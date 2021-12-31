%% get some code from :: https://github.com/mdlkxzmcp/various_erlang/blob/master/Kent_Erlang_Master_Class/1_Functional_Programming/expr.erl

-module(expr).
-export([print/1, eval/1, eval/2, compile/1, run/2, run/3, execute/2, parse/1, expr2/0, simplify/1, evale/2]).
-export_type([expr/0, env/0]).


%%% Types

-type expr() :: {'num',integer()}
             |  {'var',atom()}
             |  {'add',expr(),expr()}
             |  {'sub', expr(),expr()}
             |  {'mul',expr(),expr()}
             |  {'divi', expr(),expr()}.

-type env() :: [{atom(),integer()}].

%% @doc instr/0 type – Instructions
%%    {push, N} - push integer N onto the stack
%%    {fetch, A} - lookup value of variable a and push the result onto the stack
%%    {add2} - pop the top two elements of the stack, add, push the result
%%    {sub2} - ... , subtract, push the result
%%    {mul2} - ... , multiply, push the result
%%    {div2} - ... , divide, push the result
-type instr() :: {'push',integer()}
              |  {'fetch',atom()}
              |  {'add2'}
              |  {'sub2'}
              |  {'mul2'}
              |  {'div2'}.

-type program() :: [instr()].

-type stack() :: [integer()].



%%% API

%%
%% @doc print/1
%%
%% Turn an expression into a string.
%% For example,
%%   print({add,{var,a},{mul,{num,2},{var,b}}). is
%%   "(a+(2*b))"
-spec print(expr()) -> string().
print({num,N}) ->
    integer_to_list(N);
print({var,A}) ->
    atom_to_list(A);
print({add,E1,E2}) ->
    "("++ print(E1) ++ "+" ++ print(E2) ++")";
print({sub,E1,E2}) ->
    "("++ print(E1) ++ "-" ++ print(E2) ++")";
print({mul,E1,E2}) ->
    "("++ print(E1) ++ "*" ++ print(E2) ++")";
print({divi,E1,E2}) ->
    "("++ print(E1) ++ "/" ++ print(E2) ++")".


%%
%% @doc eval/1
%%
%% Evaluate an expression.
%% Turn an expression into a number, by working out its value.
%%
%% For example,
%%   eval({mul,{num,6},{sub,{num,3},{num,1}}}). is
%%   12
-spec eval(expr()) -> integer().
eval({num,N}) ->
    N;
eval({add,E1,E2}) ->
    eval(E1) + eval(E2);
eval({sub,E1,E2}) ->
    eval(E1) - eval(E2);
eval({mul,E1,E2}) ->
    eval(E1) * eval(E2);
eval({divi,E1,E2}) ->
    eval(E1) / eval(E2).

%%
%% @doc eval/2
%%
%% Evaluate an expression that contains variables (fails if they don't exist).
%% Turn an expression into a number, by working out its value.
%%
%% For example,
%%   eval([{a,12},{b,6}],{add,{var,a},{var,b}}). is
%%   18
-spec eval(env(),expr()) -> integer().
eval(_Env,{num,N}) ->
    N;
eval(Env,{var,A}) ->
    lookup(A,Env);
eval(Env,{add,E1,E2}) ->
    eval(Env,E1) + eval(Env,E2);
eval(Env,{sub,E1,E2}) ->
    eval(Env,E1) - eval(Env,E2);
eval(Env,{mul,E1,E2}) ->
    eval(Env,E1) * eval(Env,E2);
eval(Env,{divi,E1,E2}) ->
    eval(Env,E1) / eval(Env,E2).


%% @doc evale/2
%% 
%% Evaluation and Simplification of String
%% Parse string to expression, simplificate then and evaluate.
-spec evale(expr(), env()) -> integer().
evale(N, Env) ->
    {Ex, _N} = parse(simplify(N)),
    eval(Env, Ex).



%%
%% @doc compile/1
%%
%% Compiles expressions into stack instructions.
%%
%% For example,
%%   compile({add,{num,2},{mul,{num,3},{var,a}}}). is
%%   [{push,2},{push,3},{fetch,a},{mul2},{add2}]
-spec compile(expr()) -> program().
compile({num,N}) ->
    [{push, N}];
compile({var,A}) ->
    [{fetch, A}];
compile({add,E1,E2}) ->
    compile(E1) ++ compile(E2) ++ [{add2}];
compile({sub,E1,E2}) ->
    compile(E1) ++ compile(E2) ++ [{sub2}];
compile({mul,E1,E2}) ->
    compile(E1) ++ compile(E2) ++ [{mul2}];
compile({divi,E1,E2}) ->
    compile(E1) ++ compile(E2) ++ [{div2}].


%%
%% @doc run/2
%%
%% Run a code sequence in given environment and empty stack.
%%
%% For example,
%%   run([{push,2},{push,3},{fetch,a},{mul2},{add2}],{a,2}). is
%%   8
-spec run(program(),env()) -> integer().
run(Code,Env) ->
    run(Code,Env,[]).


%%
%% @doc run/3
%%
%% Run a code sequence in given environment and given stack.
%% When the code is exhausted, return the top of the stack as result.
%%
%% For example,
%%   run([{push,2},{push,3},{fetch,a},{mul2},{add2}],{a,2}, []). is
%%   8
-spec run(program(),env(),stack()) -> integer().
run([{push, N} | Continue], Env, Stack) ->
    run(Continue, Env, [N | Stack]);
run([{fetch, A} | Continue], Env, Stack) ->
    run(Continue, Env, [lookup(A,Env) | Stack]);
run([{add2} | Continue], Env, [N1,N2|Stack]) ->
    run(Continue, Env, [(N1+N2) | Stack]);
run([{sub2} | Continue], Env, [N1,N2|Stack]) ->
    run(Continue, Env, [(N1-N2) | Stack]);
run([{mul2} | Continue], Env ,[N1,N2|Stack]) ->
    run(Continue, Env, [(N1*N2) | Stack]);
run([{div2} | Continue], Env ,[N1,N2|Stack]) ->
    run(Continue, Env, [(N1/N2) | Stack]);
run([],_Env,[N]) ->
    N.


%%
%% @doc execute/2
%%
%% compile and run given expression under given environment.
%%
%% For example,
%%   execute([{a,12},{b,6}],{add,{var,a},{var,b}}). is
%%   18
-spec execute(env(),expr()) -> integer().
execute(Env,Expr) ->
    run(compile(Expr),Env).


%%
%% @doc parse/1
%%
%% Deterministic, recursive descent, parser.
%%
%% For example,
%%   parse("(-55*eeee)+1111)"). is
%%   {{mul,{num,-55},{var,eeee}},"+1111)"}
-spec parse(string()) -> {expr(), string()}.

% Recognise a fully-bracketed expression, with no spaces etc.
parse([$(|Rest]) ->                            % starts with a '('
    {E1,Rest1} = parse(Rest),                  % then an expression
    [Op|Rest2] = Rest1,                        % then an operator, '+' or '*'
    {E2,Rest3} = parse(Rest2),                 % then another expression
    [$)|RestFinal] = Rest3,                    % starts with a ')'
    {
        case Op of
            $+ -> {add,E1,E2};
            $- -> {sub,E1,E2};
            $* -> {mul,E1,E2};
            $/ -> {divi,E1,E2}
        end,
    RestFinal
    };

% recognise an integer, a sequence of digits
% with an optional '-' sign at the start
parse([Ch|Rest]) when ($0 =< Ch andalso Ch =< $9) orelse Ch == $- ->
    {Succeeds,Remainder} = get_while(fun is_digit/1,Rest),
    {{num, list_to_integer([Ch|Succeeds])}, Remainder};

% recognise a variable: an atom built of small letters only.
parse([Ch|Rest])  when $a =< Ch andalso Ch =< $z ->
    {Succeeds,Remainder} = get_while(fun is_alpha/1,Rest),
    {{var, list_to_atom([Ch|Succeeds])}, Remainder}.



%%% Auxiliary functions

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


%% @doc get_while/2
%% Get the longest initial segment of a list in which all elements have property P.
-spec get_while(fun((T) -> boolean()),[T]) -> {[T],[T]}.
get_while(P,[Ch|Rest]) ->
    case P(Ch) of
	true ->
	    {Succeeds,Remainder} = get_while(P,Rest),
	    {[Ch|Succeeds],Remainder};
	false ->
	    {[],[Ch|Rest]}
    end;
get_while(_P,[]) ->
    {[],[]}.


%% @doc is_digit/1
%% Recognise a digit.
-spec is_digit(integer()) -> boolean().
is_digit(Ch) ->
    $0 =< Ch andalso Ch =< $9.


%% @doc is_alpha/1
%% Recognise a small letter.
-spec is_alpha(integer()) -> boolean().
is_alpha(Ch) ->
    $a =< Ch andalso Ch =< $z.

expr2() ->
    {add,{mul,{num,1},{var, b}},
         {mul,{add,{mul,{num,2},{var, b}},{mul,{num,1},{var,b}}},
              {mul,{var,b},{num,0}}}}.


% simplification...

zeroA({add,E,{num, 0}}) ->
    E;
zeroA({add,{num,0},E}) ->
    E;
zeroA(E) ->
    E.

mul0({mul,E,{num,1}}) ->
    E;
mul0({mul,{num,1},E}) ->
    E;
mul0(E) ->
    E.

mulZ({mul,_,{num,0}}) ->
    {num,0};
mulZ({mul,{num,0},_}) ->
    {num,0};
mulZ(E) ->
    E.

compose([]) ->
    fun (E) -> E end;
compose([Rule|Rules]) ->
    fun (E) -> (compose(Rules))(Rule(E)) end.

rules () ->
    [ fun zeroA/1, fun mul0/1, fun mulZ/1 ].


simp(F, {add, E1, E2}) ->
    F({add,simp(F,E1),simp(F,E2)});
simp(F, {mul, E1, E2}) ->
    F({mul,simp(F,E1),simp(F,E2)});
simp(_,E) -> E.


simplify(E) ->
    simp(compose(rules()),E).
       




