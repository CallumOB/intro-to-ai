add([], 0).
add([H | T], S) :- 
    add(T, S1),
    S is H + S1.