delete_last_3(List, Result):-
    append(Result, [_, _, _], List).

delete_first_3(List, Result):-
    append([_,_,_], Result, List).

delete_first_last_3(List, Result):-
    delete_first_3(List, Intermediary),
    delete_last_3(Intermediary, Result).