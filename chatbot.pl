:- [nlp].
:- [content].
:- dynamic name/1, sports/1, cheat/1, murder/1, betrayed/1. %need to declare every predicate we want to learn as dynamic up here!

% Run this predicate to start the program.
start :-
  welcome_user,
  gather_data(1).

% This predicate welcomes the user, retrieves the user's  name, and then saves the name  to dynamic database.
welcome_user :-
    retrieve_content(ask_for_name, Y),
    write(Y),
    nl, nl,
    readln([X|_]),
    nl,
    write("Oh hi "), write(X), write('!'),
    nl, nl,
    retrieve_content(intro, Z),
    write(Z),
    nl,
    assertz(name(X)).

% Ask's the user a given question and then stores the answer in the dynamic database.
gather_data(State) :-
    nl,
    question(State,Question,Pred),
    write(Question),
    nl, nl,
    readln(Input), search_input(Input,State, Ans),
    save_to_kb(Pred,Ans),
    NextState is (State + 1),
    gather_data(NextState).

% All questions have been asked. Now communicate the results.
gather_data(5) :-
      communicate_test_results.

% Communicates the test results to the user and then asks if the user wishes to retake the test or leave.
communicate_test_results :-
      write("Ha Ha Ha, what a story "), name(Name), write(Name), write("!"),
      nl, nl,
      get_results(X),
      retrieve_content(start_test_communication, String),
      write(String),
      nl, nl,
      lookup_profile(X, Y), write(Y),
      nl, nl,
      write("Would you like to take my amazing test again?"),
      nl, nl,
      readln([Z|_]),
      restart_test(Z).

% Clear the dynamic database and then restart the test from the beginning.
restart_test(yes) :-
   retractall(sports(_)),
   retractall(cheat(_)),
   retractall(murder(_)),
   retractall(betrayed(_)),
   gather_data(1).

% Write a message indicating the chat is beginning and then enter the chat.
restart_test(no) :-
   retrieve_content(start_chat, X), nl,
   write(X),
   nl,
   chat.

% Read input, parse the input (and, in the process, categorize the input), and then call the correct reply
% for the given input. Recurse on itself at the end.
chat :-
      nl, readln(Input), parse_input(Input,Object,Content),
      reply(Content, Object), nl, chat.

% All of the possible replies of the chatbot.
reply(help, _) :-
      nl, retrieve_content(help, String),
      write(String), nl.
reply(bye, _) :-
      nl, write("Why? Why? Why? Why is this happening to me! I can't deal with this any more! It's over! It's over!"),
      nl, nl, write("Get out of my life, "), name(Name), write(Name), write("!"),nl,nl,
      halt(0).
reply(quit, _) :-
      nl, write("Why? Why? Why? Why is this happening to me! I can't deal with this any more! It's over! It's over!"),
      nl, nl, write("Get out of my life, "), name(Name), write(Name), write("!"),nl,nl,
      halt(0).
reply(how_are_you, _) :-
      nl, random_between(1, 3, Int),
      retrieve_content(how_are_you, Int, String),
      write(String).
reply(who_is, Object) :-
      nl, retrieve_content(who_is, Object, String),
      write(String), nl.
reply(do_you_like, Object) :-
    nl, retrieve_content(do_you_like, Object, String),
    write(String), nl.
reply(tell_me, _) :-
    nl, random_between(1, 3, Int),
    retrieve_content(tell_me, Int, String),
    write(String), nl.
reply(error, _) :-
     nl,
     random_between(1, 10, Random),
     error_messages(Random, ErrorMsg),
     write(ErrorMsg).

% Save the given answer to the given predicate in the dynamic database.
save_to_kb(Pred,Ans) :- is_name(Pred), assertz(name(Ans)).
save_to_kb(Pred,Ans) :- is_sports(Pred), assertz(sports(Ans)).
save_to_kb(Pred,Ans) :- is_cheat(Pred), assertz(cheat(Ans)).
save_to_kb(Pred,Ans) :- is_murder(Pred), assertz(murder(Ans)).
save_to_kb(Pred,Ans) :- is_betrayed(Pred), assertz(betrayed(Ans)).

% Confirms whether something is a name, sports, etc.
is_name(name).
is_sports(sports).
is_cheat(cheat).
is_murder(murder).
is_betrayed(betrayed).

% All of the possible profile options, based on the answers to the questions asked by the chatbot.
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
