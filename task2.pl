----------------------------------------------------------------
search([]):-!.
search([H|T]):- H < 3, !, search(T), write('NO').
search([_|T]):- search(T).

sum_list([],0).
sum_list([H|T],Sum):-
				sum_list(T,Sum1),
				Sum is H + Sum1.


sum_grades(Sub,S):-
				subject(Y,Sub),
				findall(X,grade(_,Y,X),C),
				sum_list(C,Sum),
				length(C,Len),
				S is Sum / Len.

%------------------------------------------------------------------

find_not_pass(G,N):- findall(X,student(G,X),C),
					all_marks(C,L),
					count_dont_pass(L,N).

%Список вех оценок группы
all_marks([],[]).
all_marks([H|T],List):- findall(X,grade(H,_,X),C), !, remove_same(C,R), all_marks(T,L1), append(R,L1,List).
%удаляем повторяющиеся
delete_all(_,[],[]).
delete_all(X,[X|L],L1):-delete_all(X,L,L1).
delete_all(X,[Y|L],[Y|L1]):- X \= Y, delete_all(X,L,L1).

remove_same([],[]).
remove_same([H|T],[H|T1]):-delete_all(H,T,T2), remove_same(T2,T1).
%подсчет
count_dont_pass([],0).
count_dont_pass([H|T],N):- H < 3,!, count_dont_pass(T,N1), N is (N1 + 1).
count_dont_pass([_|T],N):-count_dont_pass(T,N).
%-------------------------------------------------------------------

kp([],0):-!.
kp([X|T],K):- X < 3, !, kp(T,K1), K is (K1 + 1).
kp([_|T],K):-kp(T,K).


sub_notes(Sub,S):-
				subject(Y,Sub),
				findall(X,grade(_,Y,X),C),
				kp(C,N),
				S is N.
