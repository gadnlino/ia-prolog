last(List, Result):-
    append(_, [Result], List).

last2([Result], Result).

last2([_| Rest] , Result):-
    last2(Rest, Result).