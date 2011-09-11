%%%-------------------------------------------------------------------
%%% @author Martin Logan <martinjlogan@Macintosh-2.local>
%%% @copyright (C) 2011, Martin Logan
%%% @doc
%%%  
%%% @end
%%% Created : 11 Sep 2011 by Martin Logan <martinjlogan@Macintosh-2.local>
%%%-------------------------------------------------------------------
-module(todo_list).

%% API
-export([write_todo/1, read_todo/0]).

%%%===================================================================
%%% API
%%%===================================================================

%% @doc write out a todo list
-type todo_list() :: [{non_neg_integer(), term()}].
-spec write_todo(todo_list()) -> ok.
write_todo(ToDo) ->
    file:write_file("todo.bin", term_to_binary(sort_todo(ToDo))).

%% @doc read back out a todo list
-spec read_todo() -> list().
read_todo() ->
    {ok, Bin} = file:read_file("todo.bin"),
    binary_to_term(Bin).

%%%===================================================================
%%% Internal functions
%%%===================================================================
sort_todo(ToDo) ->
    lists:sort(fun({P1, N1}, {P1, N2}) -> N1 < N2 end,
	       ToDo).
