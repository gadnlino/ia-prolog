evenlength_([], N):-
	Mod is (N mod 2),
	Mod = 0.

evenlength_([_|Rest], N):-
	CurrrentLength is N+1,
    evenlength_(Rest, CurrrentLength).

evenlength(L):-
    evenlength_(L, 0).

oddlength(L):- \+evenlength(L).