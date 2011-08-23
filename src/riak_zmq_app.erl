-module(riak_zmq_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

-export([ensure_started/1]).
%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    ensure_started(zmq),
    riak_zmq_sup:start_link().

stop(_State) ->
    ok.

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.
