%Реализация стандартных предикатов обработки данных

%Длина списка(список, дляна)
my_length([],0).
my_length([_|L],N):-my_length(L,N1), N is N1 + 1.

%Принадлежность элемента списку(элемент, список)
my_member(X,[X|_]).
my_member(X,[_|T]):-my_member(X,T).

%Конкатенация списков(список1, список2, список1 + список2)
my_append([],X,X).
my_append([A|X],Y,[A|Z]):-my_append(X,Y,Z).

%Удаление элемента из списка(элемент, список, список без элемента)
my_remove(X,[X|T],T).
my_remove(X,[Y|T],[Y|T1]):-my_remove(X,T,T1).

%Перестановки элементов в списке(список, перестановка)
my_permute([],[]).
my_permute(L,[X|R]):-
				my_remove(X,L,T),
				my_permute(T,R).

%Подсписки списка(подсписок, список)
my_sublist(S,L):-
				my_append(_,L1,L),
				my_append(S,_,L1).

%Нахождение элемента списка следующего за данным (элемент, список, элемент)
my_search(X,[X,Y|_],Y).
my_search(X,[_|T],Y):-
				my_search(X,T,Y).


%Поиск элемента в списке
my_find(X,[X|_],Pos,Pos).
my_find(X,[_|Tail],CurPose,Pos):-
				CurPose1 is CurPose + 1,
				my_find(X,Tail,CurPose1,Pos).
my_find(X,List,Pos):- my_find(X,List,0,Pos).

find_next(X,X1,List):-
				my_find(X,List,Pos),
				delete(List,X,Res),
				my_find(X1,Res,Pos).

%Разделение списка на два
even_odd([E,O|Tail], [E|Tail1], [O|Tail2]):-
				even_odd(Tail,Tail1,Tail2).
even_odd(L,[],L).



