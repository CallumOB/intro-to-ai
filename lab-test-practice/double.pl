double([], []).
double([H | T], [H1 | T1]) :- 
    H1 is H*2,
    double(T, T1).