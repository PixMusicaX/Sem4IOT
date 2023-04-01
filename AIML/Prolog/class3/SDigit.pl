%This is Sum of Digits (only for +ve nos)

sdigit(N,N):-N<10.

sdigit(N, M):-
    N>=10,
    N1 is N mod 10,
    N2 is N // 10,
    sdigit(N2, M1),
    M is M1 + N1.

