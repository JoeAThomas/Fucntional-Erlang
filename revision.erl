-module (revision).
-compile(export_all).

%the base for recusion.
foo([]) -> [];
foo([X|Xs]) -> foo(Xs).

sum([])-> 0;
sum([X|Xs]) -> X+sum(Xs).

%test for concurrency question. 
sumLists([X|Xs],[Y|Ys]) -> [X] +sum(Xs) ++ [Y]+sum(Ys).

%doubling everything in the list. 
double([]) -> [];
double([X|Xs]) -> [X*2 | double(Xs)].

%Squared function
sqa([]) -> [];
sqa([X|Xs]) -> [X*X|sqa(Xs)].

%displays the last number in a list. 
last([]) -> [];
last([X|[]]) -> X;
last([_|Xs]) -> last(Xs).

%maximum of the numbers in the list. 
maximum([]) -> [];
maximum([X|Xs]) when [X < maximum(Xs) -> maximum(Xs)].

%return list of numbers up the int you entered... 
Upto(0)-> 0;
Upto(X) while X>0 -> [X|Upto(X-1)].

evens([]) -> [] ;
evens([X|Xs]) when X rem 2 == 0 —> [X | evens(Xs)];
evens([X|Xs]) —> evens(Xs). 

twice([]) -> [];
twice([X|Xs]) -> [X,X] ++ twice(Xs).

%finding the length of the list.
len([]) -> [];
len([X|Xs]) -> 1 + len(Xs).

%reverse a list.
rev([]) -> [];
rev([X | Xs]) -> rev(Xs) ++ [X].

