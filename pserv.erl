-module(pserv).
-export([go/0, go/1, server/0]).

go() ->
    From = self(),
    go(fun() -> From ! "I made it back" end).

go(Fun) ->
    server(),
    process_server ! {lambda, Fun},
    receive
	Reply ->
	    io:format("Server to P1 ~p~n",[Reply])
    after
	10000 -> timeout
    end,
    process_server ! stop.

server() ->
    Pid = spawn(fun() -> loop() end),
    register(process_server, Pid).

loop() ->
    receive
	{lambda, Fun} ->
	    Fun(),
	    loop();
	stop -> true
    end.
