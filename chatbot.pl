:- [nlp].
:- [content].
:- dynamic name/1, sports/1, cheat/1, murder/1, betrayed/1, sex/1. %need to declare every predicate we want to learn as dynamic up here!
start :- welcome_user, gather_data(1).

welcome_user :- write_content(ask_for_name),
                            readln([X|_]),
                            write("Oh hi "), write(X), write('!'),
                            nl, nl,
                            write("I have some great news for you. You are my first customer! After those idiots at the bank lead me on for months with a promotion, I have had enough! They betrayed me, they didn't keep their promise, they tricked me, and I don't care anymore! But I do care about you, my loyal customer. After the great tragedy I have experienced in life, I am here to provide you with fantastic life advice."),
                            nl, nl,
                            assertz(name(X)).

gather_data(State) :-
    question(State,Question,Pred),
    write(Question), nl,
    readln(Input), parsenoun(Input,Ans),
    save_to_kb(Pred,Ans),
    NextState is (State + 1),
    gather_data(NextState).

%read_input(Ans) :-
%    readln(Input),
%    parsenoun(Input, Ans).
    %Clause saying Ans is a proper answer
    %Exit statement and return Ans to caller.

%read_input(Ans) :-
%    readln(Input),
%    parsenoun(Input, Ans),
    %Clause saying that Ans is invalid
    %Clause that prints an error-handling response to user "YOu are TeArInG Me ApArT Lisa"
    %Since clause is invalid, query for another answer.
%    read_input(Ans).

gather_data(5) :-
      communicate_test_results.

communicate_test_results :-
      write("Ha Ha Ha, what a story "), name(Name), write(Name), write("!"), nl, nl,
      get_results(X),
      write('I got the results of the test back. You are definitely a '), write(X), write("!").

%Can repeat logic below with any predicates that we want to save to KB
save_to_kb(Pred,Ans) :- is_name(Pred), assertz(name(Ans)).
save_to_kb(Pred,Ans) :- is_sports(Pred), assertz(sports(Ans)).
save_to_kb(Pred,Ans) :- is_cheat(Pred), assertz(cheat(Ans)).
save_to_kb(Pred,Ans) :- is_murder(Pred), assertz(murder(Ans)).
save_to_kb(Pred,Ans) :- is_betrayed(Pred), assertz(betrayed(Ans)).
save_to_kb(Pred,Ans) :- is_sex(Pred), assertz(sex(Ans)).

is_name(name).
is_sports(sports).
is_cheat(cheat).
is_murder(murder).
is_betrayed(betrayed).
is_sex(sex).

% Question KB
question(1, "What is your favorite sport? Mine is football, I love playing catch with Denny!", sports).
question(2, "Would you ever cheat on your fiance with his best friend? Asking for a friend.",cheat).
question(3, "Have you ever tried to throw someone off the top off a building?", murder).
question(4, "Have you ever been betrayed by the one you love most in this world and would give anything for them but they betray you? Not that I know what that is like. This is about you.", betrayed).
% question(?,"How is your sex life?", sex).

get_results(denny) :- sports('football'), cheat('no'), murder('no'), betrayed('no').
get_results(johnny) :- sports('football'), cheat('no'), murder('no'), betrayed('yes').
get_results(mark) :- sports('football'), cheat('no'), murder('yes'), betrayed('no').
get_results(mark) :- sports('football'), cheat('yes'), murder('yes'), betrayed('no').

get_results(peter) :- sports(_), cheat('no'), murder('no'), betrayed('no').
get_results(claudette) :- sports(_), cheat('no'), murder('no'), betrayed('yes').
get_results(mark) :- sports(_), cheat('no'), murder('yes'), betrayed('no').
get_results(lisa) :- sports(_), cheat('yes'), murder('no'), betrayed('no').
get_results(random_party_guy) :-sports(_), cheat('yes'), murder('no'), betrayed('yes').
get_results(lisa) :- sports(_), cheat('yes'), murder('yes'), betrayed('no').
get_results(chris_r) :- sports(_), cheat('no'), murder('yes'), betrayed('yes').
get_results(chris_r) :- sports(_), cheat('yes'), murder('yes'), betrayed('yes').
get_results(dummy) :- sports(_), cheat(_), murder(_), betrayed(_).

%Profiles: denny, Johnny, mark, peter, claudette, lisa, random_party_guy, chris_r

lookup_profile(denny, "Dennys profile.").
lookup_profile(johnny, "Johnnys profile.").
lookup_profile(mark,"Marks profile.").
lookup_profile(lisa,  "Lisas profile.").
lookup_profile(peter, "Peters profile").
lookup_profile(claudette, "Claudettes profile").
lookup_profile(chris_r, "Chris_R profile").
lookup_profile(random_party_guy, "Random Party Guy Profile").



% Johnny's starting new venture, bad life coach
%Asks lots of questions and in the end have a list of diff result(X,Y) with replies

%When it doesn't understand, print YOU'RE TEARING ME APART, NAME --> then requery
% maybe also how's your sex life
