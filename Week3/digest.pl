is_digesting(X,Y)  :-  just_ate(X,Y).

% if X has eaten Z and Z is digesting Y, then X is digesting Y too. 
is_digesting(X,Y)  :-
                just_ate(X,Z),
                is_digesting(Z,Y).

just_ate(mosquito,blood(john)).
just_ate(frog,mosquito).
just_ate(stork,frog).

% the stork is digesting the frog, mosquito and blood(john): is_digesting(stork, Z).
% the frog is digesting the mosquito and blood(john): is_digesting(frog, Y).
% the mosquito, frog and stork are digesting blood(john): is_digesting(X, blood(john)).