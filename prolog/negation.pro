%%%%%%%%%%%%%%%%%%%
%%   Отрицание   %%
%%%%%%%%%%%%%%%%%%%


%%
%% p(X) <=> (exists a in X)[a > 0].
%%
%% Условие - известни са елемените на списъка X.
%% 
p(X) :- member(A,X), A > 0.

%%
%% q(X) <=> (forall a in X)[a > 0].
%%
%% Условие - известни са елемените на списъка X.
%% 
q([]).
q([A|Rest]) :- A > 0, q(Rest).
%% 
%%  q(X) <=> (forall a in X)[a > 0].
%%       <=> neg neg (forall a in X)[a > 0]
%%       <=> neg (exists a in X)[a =< 0]
%% 
q1(X) :- not(member(A,X), A =< 0).


%%
%% r(X) <=> (exists a in X)(forall b in X)[a + b > 0].
%%      <=> (exists a in X)r'(a,X)
%% 
r1(_,[]).
r1(A,[B|X]) :- A+B > 0, r1(A,X).

r(X) :- member(A,X), r1(A,X).

%%
%% r(X) <=> (exists a in X) neg neg (forall b in X)[a + b > 0]
%%      <=> (exists a in X) neg (exists b in X)[a + b =< 0]
%% 

r2(X) :- member(A,X), not((member(B,X), A+B =< 0)).


%%
%% s(X) <=> (forall a in X)(exists b in X)[a + b > 0]
%%      <=> (forall a in X)[s'(a,X)]
%% 

s1([], _).
s1([A|Rest],X) :- member(B,X), A+B > 0, s2(Rest,X).

s(X) :- s1(X,X).

%%
%% s(X) <=> (forall a in X)(exists b in X)[a + b > 0]
%%      <=> neg neg (forall a in X)(exists b in X)[a + b > 0]
%%      <=> neg (exists a in X) neg (exists b in X)[a + b > 0]
%% 
s2(X) :- not(member(A,X), not(member(B,X), A+B > 0)).


%%
%% t(X) <=> (forall a in X)(exists b in X)(forall c in X)(exists d in X)[a * d > b + c]
%%      <=> neg (exists a in X) neg (exists b in X)(forall c in X)(exists d in X)[a * d > b + c]
%%      <=> neg (exists a in X) neg (exists b in X) neg (exists c in X) neg (exists d in X)[a * d > b + c]

t(X) :- not(member(A,X), not(member(B,X), not(member(C,X), not(member(D,X), A*D > B+C)))).

