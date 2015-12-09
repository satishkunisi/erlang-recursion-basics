-module(recursion).
-export([fib/1, len/1, duplicate/2, reverse/1, sublist/2, zip/2]).

fib(1) -> 0;
fib(2) -> 1;
fib(N) -> fib(N-3,{0,1}).
fib(0,{F,L}) -> F+L;
fib(N,{F,L}) -> fib(N-1,{L, F+L}).

len(L) -> len(L,0).
len([],Acc) -> Acc;
len([_|T],Acc) -> len(T,Acc+1).

duplicate(N,Term) -> duplicate(N,Term,[]).
duplicate(0,_,Acc) -> Acc;
duplicate(N,Term,Acc) when N > 0 -> duplicate(N-1, Term, [Term | Acc]).

reverse([]) -> [];
reverse(List) -> reverse(List, []).
reverse([], List) -> List;
reverse([H|T],List) -> reverse(T, [H|List]).

sublist([], _) -> [];
sublist(List,0) -> List;
sublist(List, N) when N > 0 -> 
  reverse(sublist(List, N, [])). 
sublist(_,0,Acc) -> Acc;
sublist([],_,Acc) -> Acc;
sublist([H|T],N,Acc) -> sublist(T,N-1,[H|Acc]). 

zip([],[]) -> [];
zip(List1, List2) -> reverse(zip(List1, List2, [])).
zip([],_,Acc) -> Acc;
zip(_,[],Acc) -> Acc;
zip([H1|T1], [H2|T2], Acc) -> zip(T1, T2, [{H1,H2}|Acc]).
