-module(insights).
-behaviour(gen_server).

%% ------------------------------------------------------------------
%% API Function Exports
%% ------------------------------------------------------------------

-export([start_link/0]).

-export([store/2,
         summarize/2]).

%% ------------------------------------------------------------------
%% gen_server Function Exports
%% ------------------------------------------------------------------

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

%% @doc Start the application.
start_link() ->
    gen_server:start_link({local, insights}, insights, [], []).

%% ------------------------------------------------------------------
%% API Function Definitions
%% ------------------------------------------------------------------

%% @doc The api endpoint to hold event details in memory till it is flushed to
%% database
store(Event, State) ->
    Current = maps:get(Event, State, 0),
    maps:put(Event, Current + 1, State).

%% @doc The api endpoint to get summary about an event
summarize(Event, State) ->
    maps:get(Event, State, 0).

%% ------------------------------------------------------------------
%% private api
%% ------------------------------------------------------------------

%% @doc Write the memory contents to database
flush() ->
    ok.

%% ------------------------------------------------------------------
%% gen_server Function Definitions
%% ------------------------------------------------------------------

init([]) -> {ok, []}. %% no treatment of info here!

handle_call({store, Event}, _From, State) ->
    {reply, ok, store(Event, State)};
handle_call({summarize, Event}, _From, State) ->
    {reply, ok, summarize(Event, State)}.

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
