
-module(counter0).

-export([start/0, loop/1, tick/1, read/0]).

start() ->
    register(counter0, spawn(counter0, loop, [0])).

tick(N) ->
    rpc({tick, N}).
read() ->
    rpc(read).

loop(State) ->
    receive
	{From, Tag, {tick, N}} ->
	    From ! {Tag, ack},
	    loop(State + N);
	{From, Tag, read} ->
	    From ! {Tag, State},
	    loop(State)
    end.


rpc (Query) ->
    Tag = make_ref(),
    counter0 ! {self(), Tag, Query},
    receive
	{Tag, Reply} ->
	    Reply
	end.
