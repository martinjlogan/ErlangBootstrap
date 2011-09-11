-module(fib).
-export([f/1]).

f(N) when N > 1 -> f(N - 1) + f(N - 2);
f(N) when N > -1 -> N.
