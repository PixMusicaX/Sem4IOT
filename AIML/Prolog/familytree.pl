%Facts
female(liz).
female(pat).
female(ann).
female(eve).
female(lisa).
female(lucy).
female(amber).
female(julie).

male(tom).
male(bob).
male(jim).
male(peter).
male(jack).
male(adam).
male(joe).
male(jones).
male(james).
male(rish).
male(andy).

parent(jack, adam).
parent(jack, ann).
parent(jack, jim).

parent(eve, joe).
parent(adam, joe).
parent(ann, jones).
parent(ann, pat).
parent(jim, lucy).
parent(jim, james).

parent(lisa, amber).
parent(joe, amber).
parent(rish, julie).
parent(pat, julie).
parent(lucy, peter).
parent(lucy, bob).
parent(james, liz).

parent(liz, andy).
parent(tom, andy).

%These below are called inference engine
%Enter space for more occurences during output
%Rules
%parent name followed by child name (X is mother of Y)
father(X, Y):- parent(X, Y), male(X).
mother(X, Y):- parent(X, Y), female(X).
haschild(X):- parent(X, _).
sister(X, Y):- parent(Z, X), parent(Z, Y), female(Y), X\==Y.
brother(X, Y):- parent(Z, X), parent(Z, Y), male(Y), X\==Y.
uncle(X, Y):- parent(Z, Y), brother(X, Z), male(X).
aunt(X, Y):- parent(Z, Y), brother(X, Z), female(X).
grandfather(X, Y):- parent(Z, Y), father(X, Z).
grandmother(X, Y):- parent(Z, Y), mother(X, Z).
paternaluncle(X, Y):- father(Z, Y), brother(X, Z), male(X).
paternalaunt(X, Y):- father(Z, Y), sister(X, Z), female(X).
maternaluncle(X, Y):- mother(Z, Y), brother(X, Z), male(X).
maternalaunt(X, Y):- mother(Z, Y), sister(X, Z), female(X).