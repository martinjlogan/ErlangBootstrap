-module(echo).
-export([go/0]).

go() ->
    Pid2 = spawn(fun() -> loop() end),
    Pid2 ! {self(), hello},
    receive
	{Pid2, Msg} ->
	    io:format("P1 ~w~n",[Msg])
    end,
    Pid2 ! stop.


loop() ->
    receive
	{From, Msg} ->
	    From ! {self(), Msg},
	    loop();
	stop -> true
    end.
