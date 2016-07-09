-module(insights).
-behaviour(gen_server).

%% ------------------------------------------------------------------
%% API Function Exports
%% ------------------------------------------------------------------

-export([start_link/0]).

-export([store/1,
         summarize/1]).

%% ------------------------------------------------------------------
%% gen_server Function Exports
%% ------------------------------------------------------------------

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

%% @doc Start the application. Mainly useful for using `-s insights' as a command
%% line switch to the VM to make lager start on boot.
start_link() ->
    gen_server:start_link({local, insights}, insights, [], []).

%% ------------------------------------------------------------------
%% API Function Definitions
%% ------------------------------------------------------------------

store(Key) ->
    Key,
    io:fwrite("----     store   ------\n"),
    ok.
    
summarize(Key) ->
    Key,
    io:fwrite("----     summarize   ------\n"),
    ok.

%% ------------------------------------------------------------------
%% gen_server Function Definitions
%% ------------------------------------------------------------------

init([]) -> {ok, []}. %% no treatment of info here!

handle_call({store, Key}, _From, State) ->
    Key,
    {reply, ok, State}.


handle_cast({return, Key}, Key) ->
    {noreply, Key}.

handle_info(Msg, Cats) ->
    io:format("Unexpected message: ~p~n",[Msg]),
    {noreply, Cats}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    %% No change planned. The function is there for the behaviour,
    %% but will not be used. Only a version on the next
    {ok, State}. 
