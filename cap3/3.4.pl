reverse([], []).

reverse([Ele], [Ele]).

reverse([Head|Tail], Result):-
	reverse(Tail, Temp),
	append(Temp, [Head], Result).