contains([Ele|_], Ele).

contains([_|Tail], Ele):-
	contains(Tail, Ele).