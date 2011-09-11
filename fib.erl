-module(fib).
-export([f/1]).

f(N) ->
    case N of
	0 -> 0;
	1 -> 1;
	_ -> f(N - 1) + f(N - 2)
    end.
