-module(side_effect).
-export([multiply/2]).

multiply(N1, N2) ->
    mult_v1(N1, N2).

mult_v1(N1, 1) ->
    N1;
mult_v1(N1, N2) ->
    N1 + mult_v1(N1, N2 -1).

mult_v2(N1, N2) ->
    N1 * N2.

mult_why(N1, N2) ->
    SideEffect = 
	receive
	    SideEffect_ -> SideEffect_
	after
	    0 -> 0
	end,
    N1 * N2 + SideEffect.
