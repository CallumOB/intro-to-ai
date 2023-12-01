% Q0
student(callum_obrien, c21306503).

% Q1  	(10 marks)
woman(jia).
man(john).
healthy(john).
healthy(jia).
wealthy(john).

traveller(X) :-  % john is a traveller.
    healthy(X), 
    wealthy(X).

likes(X, Y) :- % john likes jia.
    man(X),
    woman(Y),
    healthy(Y).

% Q2  	(10 marks)
%  listtrans(L1, L2)

tran(uno,one).   
tran(due,two).   
tran(tre,three).   
tran(quattro,four).   
tran(cinque,five).   
tran(sei,six).   
tran(sette,seven).  
tran(otto,eight).   
tran(nove,nine). 

listtrans( ItalianList, EngLishList).

listtrans([H | T], [X | Y]) :- 
    tran(H, X),
    listtrans(T, Y).


% Q3
incrementOdds(L1, L2).
% more than 1 way to do this

incrementOdds([H | T], [X | Y]) :-
    (H mod 2 =:= 0 -> X is H; X is H + 1),
    incrementOdds(T, Y).



% Q4	(10 marks)
% directFromTo(A, B)
% fromTo(A,B)

bicycle(dublin, kilkenny, 120).
bicycle(dublin, carlow, 80).
bicycle(kilkenny, waterford, 85).
bicycle(mallow, carlow, 110).
bicycle(cork, mallow, 38).
bicycle(waterford, youghal, 110).
bicycle(youghal, cork, 30).
bicycle(dublin, athlone, 105).
bicycle(athlone, limerick, 135).
bicycle(limerick, cork, 75).

moped(dublin, galway, 200).
moped(galway, limerick, 110).
moped(limerick, ennis, 30).
moped(limerick, cork, 95).

donkey(dublin, galway, 210).
donkey(mallow, carlow, 105).

directFromTo(A, B) :-
    bicycle(A, B, _);
    moped(A, B, _);
    donkey(A, B, _).

directFromTo(A, B, Dist) :-
    bicycle(A, B, Dist);
    moped(A, B, Dist);
    donkey(A, B, Dist).

fromTo(A, B) :- % there are four different ways of getting from limerick to carlow.
    directFromTo(A, B);
    directFromTo(A, X),
    fromTo(X, B).

% Q5

fromTo(A, B, Distance) :- % there are four different ways of getting from limerick to carlow, the distances are 223, 218, 243, 238.
    directFromTo(A, B, Distance);
    directFromTo(A, X, Dist1),
    fromTo(X, B, Dist2),
    Distance is Dist1 + Dist2.
 
