-module(assignment_two).
-compile(export_all).

%task_1_a
pos_bid([]) -> [];
pos_bid([{A,X}|Xs]) when X >= 0 -> pos_bid([{A,X} | pos_bid(Xs)]);
pos_bid([{_,_X} | Xs]) -> pos_bid(Xs).

%task_1_b
sum([])-> 0;
sum([{_,Bid}|Bids]) -> Bid+sum(Bids).

success([{Y,Bid} | Bids], Threshold) ->
    case sum([{Y,Bid} | Bids]) >= Threshold of
         true -> true;
         _ -> false
    end.

%task_1_c
winners([],_,_) -> [];
winners([{Y,Bid} | _Bids], Threshold, Counter) when Bid + Counter == Threshold -> {Y,Bid}; 
winners([{Y,Bid} | Bids], Threshold, Counter) when Bid + Counter < Threshold -> [{Y,Bid}] ++ winners(Bids,Threshold,Counter + Bid) ; 
winners([{Y,_Bid} | _Bids], Threshold, Counter) -> {Y,(Threshold-Counter)}.

%task_2_a
init([X|_Xs], [Y|_Ys])  when X =/= Y -> false;
init([X|Xs], [Y|Ys])  when X == Y -> init(Xs,Ys);
init([], [_Y|_Ys]) -> true;
init(_,_) -> true.

%task_2_b
drop(_,[]) -> [];
drop(N,[X|Xs]) when N == 0-> [X|Xs];
drop(N,[_X|Xs]) -> drop(N-1,Xs).

%task_2_c
subst([Old|Olds],New,[St|Sts]) ->
     case init([Old|Olds],[St|Sts]) of
         true -> New ++ drop(length([Old|Olds]), [St|Sts]);
         false -> [St] ++ subst([Old|Olds],New, Sts)
     end.

%task_2_d
% I would modify part c on line 40 "true -> New ++ drop(length([Old|Olds]), [St|Sts]);" once it has been executed it would 
% then recursivily iterate through the string comparing values to see if that section of the string matched with Old untill it reaches the end of the string.

%task_3_a
isxwin([x,x,x]) -> true;
isxwin([o,o,o]) -> true; %take out for isxwin but need in for 3d.
isxwin([_,_,_]) -> false.

%task_3_b 
linexwin([[X|Xs], [Y|Ys], [Z|Zs]]) ->
     case isxwin([X |Xs]) of
          true -> true;
          false ->
               case isxwin([Y |Ys]) of
                    true -> true;
                    false ->
                         case isxwin([Z |Zs]) of
                              true -> true;
                              false -> false
                         end
                end
     end.

%task_3_c
pick(0,[X|_Xs]) -> X;
pick(N,[_|Xs]) when N>0 -> pick(N-1,Xs). 

%task_3_d 
wincol([[A,B,C],[D,E,F],[G,H,I]]) ->
     case linexwin([[A,D,G],[B,E,H],[C,F,I]]) of
          true -> true;
          false -> false
     end.