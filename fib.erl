-module(fib).
-export([f/1]).

f(0) -> 0;
f(1) -> 1;
f(N) -> f(N - 1) + f(N - 2).
