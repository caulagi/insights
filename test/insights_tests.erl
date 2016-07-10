-module(insights_tests).
-include_lib("eunit/include/eunit.hrl").

-compile([export_all]).

store_new_event_test_() ->
    {"Storing an unknown(new) event should return ok response",
      fun() ->
        insights:start_link(),
        ?assertEqual(insights:store("foo"), ok)
      end
     }.

store_multiple_events_test_() ->
    {"Storing multiple events should return ok response",
      fun() ->
        insights:start_link(),
        ?assertEqual(insights:store("foo"), ok),
        ?assertEqual(insights:store("foo"), ok)
      end
     }.

summarize_one_event_test_() ->
    {"Asking summary for a particular event should return only that count",
      fun() ->
        insights:start_link(),
        ?assertEqual(insights:summarize("foo"), 3)
      end
     }.

summarize_test_() ->
    {"Asking summary/0 should return all events",
      fun() ->
        insights:start_link(),
        ?assertEqual(insights:summarize(), #{"foo" => 3})
      end
     }.
