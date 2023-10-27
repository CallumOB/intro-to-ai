sqList([], []).
sqList([H | T], [H1 | T1]) :- 
    H1 is H*H,
    sqList(T, T1).

sumList([], 0).
sumList([H | T], S) :-
    sumList(T, S1),
    S is H + S1.