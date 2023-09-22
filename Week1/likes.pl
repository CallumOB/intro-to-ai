man(jim).
man(mary).
mortal(X) :- man(X).
likes(X, A) :- man(X), dog(A).


dog(rex).
dog(lassie).
cat(garfield).
hatesChases(X, Y) :- cat(X), dog(Y).