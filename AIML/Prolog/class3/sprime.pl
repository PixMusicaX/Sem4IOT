%This is Sum of Prime Number in range(only for +ve nos)

sprime(0,0).

isdiv(N, M):- 0 is N mod M, !.

isprime(2):- true, !.

isdiv(N, M):-
    N > M + 1,
    isdiv(N, M + 1).

isprime(N):-
    N < 2,
    !,
    false.

isprime(N):- not(isdiv(N, 2)).

sprime(L, R, S):-
    R > L,
    R1 is R - 1,
    sprime(L1, R1),
    isprime(R1) -> 
    S is S + R1;.
    