list_member(X, [X|_]). 
list_member(X, [_|T]):- list_member(X, T).

list_length([], 0).
list_length([_|T], N):- list_length(T, N1), N is N1 + 1.

list_concat([],L,L). 
list_concat([X1|L1], L2, [X1|L3]):- list_concat(L1,L2,L3).

list_delete(X, [X], []). 
list_delete(X, [X1|L1], L1).
list_delete(X, [Y|L2], [Y|L1]):- list_delete(X, L2, L1).

list_rev([], []).
list_rev([H|T], R):- list_rev(T, RT), list_concat(RT, [H], R).

list_add([], 0, 0).
list_add([H|T], N, S):- list_add(T, N1, S1), N is N1 + 1, S is S1 + H.

list_sum([], 0).
list_sum([H|T], S) :- list_sum(T, R), S is H + R.