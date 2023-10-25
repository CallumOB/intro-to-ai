% Financial Advisor
% code to get you started

% declare predicates and their arity
% not necessary, but avoids warnings

:- dynamic invest_in/1.
:- dynamic savings_account/1.
:- dynamic amount_saved/1.
:- dynamic dependents/1.
:- dynamic minsavings/2.
:- dynamic earnings/2.

% custom rules
:- dynamic maxexpenditure/2.
:- dynamic check_expenditure/1.


minsavings(Dependents, Amount) :- 
	Amount is 5000 * Dependents.

minincome(Dependents, Amount) :-
	Amount is 15000 + (Dependents * 4000).

maxexpenditure(Income, Amount) :-
	Monthly_Income is Income / 12,
	Amount is Monthly_Income / 2.

% Based off of rules in Predicate Calculus examples
invest_in(stocks) :- 
	savings_account(adequate),
	income(adequate).

invest_in(combination) :- 
	savings_account(adequate),
	income(inadequate).

invest_in(savings) :-
	savings_account(inadequate).

% Checks for sufficient savings 
savings_account(adequate) :- 
	amount_saved(Amount),
	dependents(Dependents),
	minsavings(Dependents, MinSavings),
	Amount > MinSavings, !.

savings_account(inadequate) :-
	amount_saved(Amount),
	dependents(Dependents),
	minsavings(Dependents, MinSavings),
	Amount =< MinSavings, !.

savings_account(inadequate).



% rules 6 & 7
% The next rule uses cut !. The order of the following
% 2 clauses is important. The second one only fires if 
% the first one fails. Does not allow backtracking. 
% Cut ! prevents this.

income(adequate) :- 
	earnings(Amount, steady),
	dependents(Dependents),
	minincome(Dependents, MinIncome),
	Amount >= MinIncome, !.

income(inadequate).

check_expenditure(reduce) :-
	expenditure(Exp_Amount),
	earnings(Amount, steady),
	maxexpenditure(Amount, Max_Exp),
	Exp_Amount > Max_Exp, !.

check_expenditure(adequate).

getSavings :-
	write('Input savings amount -> '),
	read(S),
	assert(amount_saved(S)).

getDependents :- 
	write('Input number of dependents -> '),
	read(S),
	assert(dependents(S)).

getEarnings :-
	write('Input your income -> '),
	read(X),
	write('Is your income steady? Enter "steady" or "unsteady" -> '),
	read(Y),
	assert(earnings(X, Y)).

getExpenditure :- 
	write('Enter your monthly expenditure'),
	read(S),
	assert(expenditure(S)).

% amount_saved(150000).
% dependents(2).
% earnings(240000, steady).

%  go is to run the whole program, makes it easier
go :- 
	getSavings,
	getDependents,
	getEarnings,
	getExpenditure,
	savings_account(SA),
	income(IA),
	invest_in(II),
	check_expenditure(Exp),
	(Exp == reduce -> 
		write('Advice is to reduce expenditure.');
		write('Advice is to invest in '),
		write(II)),
	cleanInputs.

% If the first attempt at go fails, Prolog will 
% backtrack and try this instead
go :-
      write('Cannot currently advise you'),
      cleanInputs.


cleanInputs :-
    retractall(amount_saved(_)),
    retractall(dependents(_)),
    retractall(earnings(_, _)),
	retractall(expenditure(_)).