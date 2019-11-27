:- [nlp].
:- [content].
:- dynamic name/1, sports/1, cheat/1, murder/1, betrayed/1, sex/1. %need to declare every predicate we want to learn as dynamic up here!

% Main predicate.
start :- welcome_user, gather_data(1).

% Welcome user, retrieve name, and then save to dynamic database.
welcome_user :- retrieve_content(ask_for_name, Y),
                            write(Y),
                            nl,
                            readln([X|_]),
                            nl,
                            write("Oh hi "), write(X), write('!'),
                            nl, nl,
                            retrieve_content(intro, Z),
                            write(Z),
                            nl, nl,
                            assertz(name(X)).

%Ask user questions and then save answer to dynamic database.
gather_data(State) :-
    question(State,Question,Pred),
    write(Question),
    nl,
    readln(Input), read_input(Input,State, Ans), %parsenoun(Input,Ans)
    save_to_kb(Pred,Ans),
    NextState is (State + 1),
    gather_data(NextState).

% Finished asking questions.
gather_data(5) :-
      communicate_test_results. %if we want chatbot to keep going after results, need to define another rule for gather data where State > 5.

% Successfully read input. Return Ans.
read_input(Input,_, Ans) :- parsenoun(Input, Ans).

%Unable to read input. Print error message to user and then re-ask question.
read_input(Input, State, Ans) :-
   \+ parsenoun(Input, Ans),
   nl,
   random_between(1, 9, Random),
   error_messages(Random, ErrorMsg),
   write(ErrorMsg),
   nl, nl,
   write("I did not understand what you said! I asked:"),
   nl,nl,
   gather_data(State).

% Communicates the test results to the user and then exits program.
communicate_test_results :-
      nl,
      write("Ha Ha Ha, what a story "), name(Name), write(Name), write("!"),
      nl, nl,
      get_results(X),
      write('I have divined your character, personality, and future!'),
      nl, nl,
      lookup_profile(X, Y), write(Y),
      nl, nl,
      halt(0).

% Saves predicates to dynamic database.
save_to_kb(Pred,Ans) :- is_name(Pred), assertz(name(Ans)).
save_to_kb(Pred,Ans) :- is_sports(Pred), assertz(sports(Ans)).
save_to_kb(Pred,Ans) :- is_cheat(Pred), assertz(cheat(Ans)).
save_to_kb(Pred,Ans) :- is_murder(Pred), assertz(murder(Ans)).
save_to_kb(Pred,Ans) :- is_betrayed(Pred), assertz(betrayed(Ans)).
save_to_kb(Pred,Ans) :- is_sex(Pred), assertz(sex(Ans)).

% Confirms whether something is a name, sports, etc.
is_name(name).
is_sports(sports).
is_cheat(cheat).
is_murder(murder).
is_betrayed(betrayed).
is_sex(sex).

% Possible profile options. The answers given select the profile according to the logic below.
get_results(denny) :- sports(football), cheat(no), murder(no), betrayed(no).
get_results(johnny) :- sports(football), cheat(no), murder(no), betrayed(yes).
get_results(mark) :- sports(football), cheat(no), murder(yes), betrayed(no).
get_results(mark) :- sports(football), cheat(yes), murder(yes), betrayed(no).

get_results(peter) :- sports(_), cheat(no), murder(no), betrayed(no).
get_results(claudette) :- sports(_), cheat(no), murder(no), betrayed(yes).
get_results(mark) :- sports(_), cheat(no), murder(yes), betrayed(no).
get_results(lisa) :- sports(_), cheat(yes), murder(no), betrayed(no).
get_results(random_party_guy) :-sports(_), cheat(yes), murder(no), betrayed(yes).
get_results(lisa) :- sports(_), cheat(yes), murder(yes), betrayed(no).
get_results(chris_r) :- sports(_), cheat(no), murder(yes), betrayed(yes).
get_results(chris_r) :- sports(_), cheat(yes), murder(yes), betrayed(yes).
get_results(random_party_guy) :- sports(_), cheat(_), murder(_), betrayed(_).
