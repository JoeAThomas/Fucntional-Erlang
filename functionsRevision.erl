-module(functionsRevision).
-compile(export_all).
%----------------------------------------------------
% This document is procticing simple pattern matching.
%----------------------------------------------------

% returns the first value in a list. 
head([X|_]) -> X.

% returns the second value in a list. 
second([_,X|_]) -> X.

% checks if the two values that are entered are the same...
% if so then true, else false.
% bound & unbound value.
    % bound assigned a vaiable.
        % unbound is an empty vaiable.
same(X,X) -> true;
same(_,_) -> false.

%% uses pattern matching to check if the date and time are in the correct fomat.
%% if is isn't in the correct format then...
valid_time({Date = {Y,M,D}, Time = {H,Min,S}}) ->
    io:format("The Date tuple (~p) says today is: ~p/~p/~p,~n",[Date,Y,M,D]),
    io:format("The time tuple (~p) indicates: ~p:~p:~p.~n", [Time,H,Min,S]);
valid_time(_) ->
    io:format("Stop feeding me wrong data!~n").

% guards.
% when someone is over the age of 16 then can drive.
% guards must return true to succeed.
% "," = and also.
% ";" = or else.
%----------------------------------------------
driving_age(X) when X >= 16 -> true;
driving_age(_) -> false.

% if they are between the age range.
right_age(X) when X >= 16, X =< 104 ->
true;
right_age(_) ->
false.

% wrong way around...
wrong_age(X) when X < 16; X > 104 ->
true;
wrong_age(_) ->
false.
%----------------------------------------------
% if statments (guards)
% statments below will always throw errors as have nothing
% to catch the falling ifs. For this we add an "else" in the 
% form of a "true".
heh_fine() ->
    if 1 =:= 1 -> 
        works
    end,
    if 1 =:= 2; 1 =:= 1 -> 
        works
    end,
    if 1 =:= 2, 1 =:= 1 -> 
        fails
    end.

% example of an if and then "true" aka "else"
oh_god(N) ->
if N =:= 2 -> might_succeed;
    true -> always_does  % this is Erlang's if's 'else!'
end.

% another example of ifs would be....
% note, this one would be better as a pattern match in function heads!
% i'm doing it this way for the sake of the example.
help_me(Animal) ->
    Talk = if Animal == cat  -> "meow";
              Animal == beef -> "mooo";
              Animal == dog  -> "bark";
              Animal == tree -> "bark";
              true -> "fgdadfgna"
            end,
{Animal, "says " ++ Talk ++ "!"}. 

% case of
% an inefficient way to add an element to a list 
% checks wether element is part of lsit, return true if is 
% return false if not. if already in there dont do anythgng
% otherwise add the "X" as the lists first element.
insert(X,[]) ->
    [X];
insert(X,Set) ->
    case lists:member(X,Set) of
        true  -> Set;
        false -> [X|Set]
    end.

% another example of a case ... of would be 
% this fucntion tells us the right temp to go to the beach
% seen in 3 different temps. The "Pattern Marching" and "Guards"
% are combined in order to return an answer which satisys all cases.
beach(Temperature) ->
    case Temperature of
         {celsius, N} when N >= 20, N =< 45 -> % case 1
            'favorable';
        {kelvin, N} when N >= 293, N =< 318 -> % case 2
            'scientifically favorable';
        {fahrenheit, N} when N >= 68, N =< 113 -> % case 3
            'favorable in the US';
        _->
            'avoid beach'
    end.