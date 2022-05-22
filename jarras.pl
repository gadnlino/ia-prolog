objetivo((_, 2)).

capacidade((4,3)).

acao((J1,J2),encher1,(J1a,J2a)):-
	capacidade((C1, _)),
	J1 < C1,
	J1a = C1,
	J2a = J2.

acao((J1,J2),encher2,(J1a,J2a)):-
	capacidade((_, C2)),
	J2 < C2,
	J1a = J1,
	J2a = C2.

acao((J1,J2),esvaziar1,(J1a,J2a)):-
	J1 > 0,
	J1a is 0,
	J2a = J2.

acao((J1,J2),esvaziar2,(J1a,J2a)):-
	J2 > 0,
	J1a = J1,
	J2a is 0.

acao((J1,J2),passar12,(J1a,J2a)):-
	capacidade((_,C2)),
	J1 > 0,
	J2 < C2,
	min_list([J1, C2-J2], DIFF),
	J2a is J2 + DIFF,
	J2a =< C2,
	J1a is J1 - DIFF,
	J1a >= 0.

acao((J1,J2),passar21,(J1a,J2a)):-
	capacidade((C1,_)),
	J1 < C1,
	J2 > 0,
	min_list([J2, C1-J1], DIFF),
	J1a is J1 + DIFF,
	J1a =< C1,
	J2a is J2 - DIFF,
	J2a >= 0.