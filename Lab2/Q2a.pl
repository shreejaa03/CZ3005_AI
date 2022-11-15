/* facts about the gender of each royal family successors */
male(prince_charles).
male(prince_andrew).
male(prince_edward).
female(princess_ann).

/* relations between each successor to the monarch */
offspring_of(prince_charles,queen_elizabeth).
offspring_of(princess_ann,queen_elizabeth).
offspring_of(prince_andrew,queen_elizabeth).
offspring_of(prince_edward,queen_elizabeth).

/* age order of all the successors */
older_than(prince_charles,princess_ann).
older_than(princess_ann,prince_andrew).
older_than(prince_andrew,prince_edward).

/* age rules */
is_older_than(Successor_1,Successor_2):-
	older_than(Successor_1,Successor_2).

is_older_than(Successor_1,Successor_2):-
	older_than(Successor_1,Intermediate),
	older_than(Intermediate,Successor_2).

/* succession rules */
/* passed down the male line before female line */
succeed_before(Successor_1,Successor_2):-
	male(Successor_1),
	female(Successor_2).

/* passed down by age order in male line */
succeed_before(Successor_1,Successor_2):-
	male(Successor_1),
	male(Successor_2),
	is_older_than(Successor_1, Successor_2).

/* passed down by age order in female line */
succeed_before(Successor_1,Successor_2):-
	female(Successor_1),
	female(Successor_2),
	is_older_than(Successor_1, Successor_2).

/* sort succession list tail based on succession rules */
sort_successor_list(X,[Y|T],[Y|W]):- 
	\+(succeed_before(X,Y)), !, 
	sort_successor_list(X,T,W).

sort_successor_list(X,[Y|T],[X,Y|T]):-
	succeed_before(X,Y).

sort_successor_list(X,[],[X]).

/* generate succession line based on offspring list */
generate_succession_line([],[]).
generate_succession_line([X|Y],Succession_Line):-
	generate_succession_line(Y,List_Tail),
	sort_successor_list(X,List_Tail,Succession_Line).

/* main function to output succession line of queen elizabeth */
old_royal_succesion(Succession_Line):- 
	findall(X,offspring_of(X,queen_elizabeth),Offspring), 
	generate_succession_line(Offspring,Succession_Line).
