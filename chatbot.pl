:- [nlp].
:- [content].
:- dynamic name/1, sports/1, cheat/1, murder/1, betrayed/1. %need to declare every predicate we want to learn as dynamic up here!

% Main predicate.
start :-
  welcome_user,
  gather_data(1).

% Welcome user, retrieve name, and then save to dynamic database.
welcome_user :-
    retrieve_content(ask_for_name, Y),
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
    readln(Input), search_input(Input,State, Ans), %parsenoun(Input,Ans)
    save_to_kb(Pred,Ans),
    NextState is (State + 1),
    gather_data(NextState).

% Finished asking questions.
gather_data(5) :-
      communicate_test_results.

% Communicates the test results to the user and then exits program.
communicate_test_results :-
      nl,
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

restart_test(yes) :-
   retractall(sports(_)),
   retractall(cheat(_)),
   retractall(murder(_)),
   retractall(betrayed(_)),
   gather_data(1).
restart_test(no) :-
   retrieve_content(start_chat, X),
   write(X),
   nl,
   chat.

%    write("Well, I still have some time before I need to go pick up flowers for my new sweetie. Let's chat for a bit. Do you have any questions for me?"),
%    chat.

% chat :-
%       repeat, nl,
%       readln(Input), parse_input(Input,Object,Content),
%       reply(Content, Object, Output),
%       write(Output).

% reply(bye,_,_) :-
%       write("Why? Why? Why? Why is this happening to me! I can't deal with this any more! It's over! It's over!"),
%       nl, write("Get out of my life, "), name(Name), write(Name), write("!"),
%       halt(0).
% reply(quit,_,_) :-

chat :-
      repeat,
      readln(Input), parse_input(Input,Object,Content),
      reply(Content, Object, Output),
      write(Output),nl,fail.

reply(help, _, String) :-
      retrieve_content(help, _, String).      
reply(bye, _, _) :-
      write("Why? Why? Why? Why is this happening to me! I can't deal with this any more! It's over! It's over!"),
      nl, write("Get out of my life, "), name(Name), write(Name), write("!"),nl,
      halt(0).
reply(quit, _, _) :-
      write("Why? Why? Why? Why is this happening to me! I can't deal with this any more! It's over! It's over!"),
      nl, write("Get out of my life, "), name(Name), write(Name), write("!"),nl,
      halt(0).
reply(how_are_you, _,  String) :-
      random_between(1, 3, Int),
      retrieve_content(how_are_you, Int, String).
reply(who_is, Object, String) :-
      retrieve_content(who_is, Object, String).
reply(do_you_like, Object, String) :-
    retrieve_content(do_you_like, Object, String).
reply(tell_me, _, String) :-
    random_between(1, 3, Int),
    retrieve_content(tell_me, Int, String).

% Saves predicates to dynamic database.
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
