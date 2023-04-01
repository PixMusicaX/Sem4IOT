%This is Sum of Natural Number (only for +ve nos)

snatural(0,0).

snatural(N, M):-
    N > 0,
    N1 is N - 1,
    snatural(N1, M1),
    M is M1 + N.