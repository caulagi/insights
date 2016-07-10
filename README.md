insights
=====

A hobby project to learn OTP.  I built an application based on 
[the link here](http://highscalability.com/blog/2011/3/22/facebooks-new-realtime-analytics-system-hbase-to-process-20.html)
that provides counters(number of occurences) of events.

Usage
-----

    $ make run
    ===> No entry for profile dev in config.
    ===> Verifying dependencies...
    ===> Compiling insights
    Erlang/OTP 18 [erts-7.3] [source] [64-bit] [smp:4:4] [async-threads:0] [hipe] [kernel-poll:false] [dtrace]

    Eshell V7.3  (abort with ^G)
    1> ===> The rebar3 shell is a development tool; to deploy applications in production, consider using releases (http://www.rebar3.org/v3.0/docs/releases)
    ===> Booted insights

    1> insights:store("https://news.ycombinator.com/item?id=12064022").
    ok
    2> insights:store("https://news.ycombinator.com/item?id=12064022").
    ok
    3> insights:store("https://twitter.com").
    ok
    4> insights:summarize().
    #{"https://news.ycombinator.com/item?id=12064022" => 2,
      "https://twitter.com" => 1}
      5>

Test
----

    $ make test
    ./rebar3 eunit --cover skip_deps=true verbose=3
    ===> Verifying dependencies...
    ===> Compiling insights
    ===> Performing EUnit tests...
    ....
      All 4 tests passed.

    Top 4 slowest tests (0.001 seconds, 1.6% of total time):
      insights_tests:store_multiple_events_test_/0: Storing multiple events should return ok response
        0.001 seconds
      insights_tests:summarize_one_event_test_/0: Asking summary for a particular event should return only that count
        0.000 seconds
      insights_tests:store_new_event_test_/0: Storing an unknown(new) event should return ok response
        0.000 seconds
      insights_tests:summarize_test_/0: Asking summary/0 should return all events
        0.000 seconds

    Finished in 0.063 seconds
    4 tests, 0 failures
