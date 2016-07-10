

# Module insights #
* [Description](#description)
* [Function Index](#index)
* [Function Details](#functions)

API for the insights application.

__Behaviours:__ [`gen_server`](gen_server.md).

<a name="description"></a>

## Description ##

This module provide the API for the insights application.
It supports two ways of interacting -

* store/1

* summarize/1


<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#code_change-3">code_change/3</a></td><td></td></tr><tr><td valign="top"><a href="#handle_call-3">handle_call/3</a></td><td></td></tr><tr><td valign="top"><a href="#handle_cast-2">handle_cast/2</a></td><td></td></tr><tr><td valign="top"><a href="#handle_info-2">handle_info/2</a></td><td></td></tr><tr><td valign="top"><a href="#init-1">init/1</a></td><td></td></tr><tr><td valign="top"><a href="#start_link-0">start_link/0</a></td><td>Start the application.</td></tr><tr><td valign="top"><a href="#store-1">store/1</a></td><td>store/1 updates the state with the event information.</td></tr><tr><td valign="top"><a href="#summarize-0">summarize/0</a></td><td>summarize/0 returns summary about all events.</td></tr><tr><td valign="top"><a href="#summarize-1">summarize/1</a></td><td>summarize/1 returns the summary about this event.</td></tr><tr><td valign="top"><a href="#terminate-2">terminate/2</a></td><td></td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="code_change-3"></a>

### code_change/3 ###

`code_change(OldVsn, State, Extra) -> any()`

<a name="handle_call-3"></a>

### handle_call/3 ###

`handle_call(X1, From, State) -> any()`

<a name="handle_cast-2"></a>

### handle_cast/2 ###

`handle_cast(X1, State) -> any()`

<a name="handle_info-2"></a>

### handle_info/2 ###

`handle_info(Msg, State) -> any()`

<a name="init-1"></a>

### init/1 ###

`init(X1) -> any()`

<a name="start_link-0"></a>

### start_link/0 ###

`start_link() -> any()`

Start the application.

<a name="store-1"></a>

### store/1 ###

`store(Event) -> any()`

store/1 updates the state with the event information

<a name="summarize-0"></a>

### summarize/0 ###

`summarize() -> any()`

summarize/0 returns summary about all events

<a name="summarize-1"></a>

### summarize/1 ###

`summarize(Event) -> any()`

summarize/1 returns the summary about this event

<a name="terminate-2"></a>

### terminate/2 ###

`terminate(Reason, State) -> any()`

