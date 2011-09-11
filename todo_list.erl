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
-spec write_todo(list()) -> ok.
write_todo(ToDo) ->
    file:write_file("todo.bin", term_to_binary(ToDo)).

%% @doc read back out a todo list
-spec read_todo(list()) -> string().
read_todo(ToDo) ->
    {ok, Bin} = file:read_file("todo.bin"),
    binary_to_term(Bin).


    

%%%===================================================================
%%% Internal functions
%%%===================================================================
