%%%-------------------------------------------------------------------
%% @doc insights top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(insights_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
    {ok, 
        {{one_for_all, 0, 1},
            [{insights, {insights, start_link, []},
                    permanent, 5000, worker, [insights]}]
        }}.

%%====================================================================
%% Internal functions
%%====================================================================
