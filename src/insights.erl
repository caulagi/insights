%% @doc API for the insights application
%%
%% This module provide the API for the insights application.
%% It supports two ways of interacting -
%%
%% <ul>
%% <li>store/1</li>
%% <li>summarize/1</li>
%% </ul>
%%

-module(insights).
-behaviour(gen_server).

%% ------------------------------------------------------------------
%% API Function Exports
%% ------------------------------------------------------------------

-export([start_link/0]).

-export([store/1,
         summarize/0,
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

%% @doc Start the application.
start_link() ->
    gen_server:start_link({local, insights}, insights, [], []).

%% ------------------------------------------------------------------
%% API Function Definitions
%% ------------------------------------------------------------------

%% @doc store/1 updates the state with the event information
%% @end
store(Event) ->
    gen_server:call(?MODULE, {add_event, Event}).

%% @doc summarize/0 returns summary about all events
%% @end
summarize() ->
    gen_server:call(?MODULE, summary).

%% @doc summarize/1 returns the summary about this event
%% @end
summarize(Event) ->
    gen_server:call(?MODULE, {summary, Event}).

%% ------------------------------------------------------------------
%% gen_server Function Definitions
%% ------------------------------------------------------------------

init([]) -> {ok, maps:new()}. %% no treatment of info here!

handle_call({add_event, Event}, _From, State) ->
    Current = maps:get(Event, State, 0),
    {reply, ok, maps:put(Event, Current + 1, State)};
handle_call({summary, Event}, _From, State) ->
    {reply, maps:get(Event, State, 0), State};
handle_call(summary, _From, State) ->
    {reply, State, State}.

handle_cast(_, State) ->
    {error, State}.

handle_info(Msg, State) ->
    io:format("Unexpected message: ~p~n",[Msg]),
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    %% No change planned. The function is there for the behaviour,
    %% but will not be used. Only a version on the next
    {ok, State}.
