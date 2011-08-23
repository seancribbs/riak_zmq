-module(riak_zmq).
-export([postcommit/1]).

postcommit(RObj) ->
    riak_zmq_app:ensure_started(riak_zmq),
    Body = riak_object:get_value(RObj),
    riak_zmq_publisher:publish(Body).
