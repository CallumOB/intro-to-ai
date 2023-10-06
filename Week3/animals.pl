% Semantic Network example 1 in Prolog
% with some inference rules for navigating the knowledge network

is_a(cat, mammal).
is_a(bear, mammal).
is_a(mammal, animal).
is_a(fish, animal).
is_a(whale, mammal).
is_a(trout, fish).
is_a(bird, animal).
is_a(cat, tom).
is_a(X, _Y) :- is_a(cat, X).

caught(tom, bird).

is_owned_by(tom, john).

is_coloured(tom, ginger).

likes(cat, cream).
likes(X, _Y) :- isa(cat, X).

sat_on(cat, mat).
sat_on(X, _Y) :- isa(cat, X).

has(cat, fur).
has(bear, fur).
has(mammal, vertebra).
has(mammal, fur).
has(A,B) :- isa(A,C), has(C,B).

lives_in(fish, water).
lives_in(whale, water).
lives_in(A,B) :- isa(A,C), lives_in(C, B).

isa(A,B) :- is_a(A,B).
isa(A,B) :- is_a(A,C), isa(C,B).
