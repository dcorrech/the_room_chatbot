:- dynamic name/1. %need to declare every predicate we want to learn as dynamic up here!
begin_your_journey :- welcome_user, start_chat.

welcome_user :- write('I did NOT hit her, I did nooooot- Oh hi. What is your name?'),
                            nl,
                            readln([X|_]),
                            write('Oh hi '),
                            write(X),
                            write('! I am your new life coach.'),
                            nl,
                            assertz(name(X)).

start_chat :-
    process(1).

process(State) :-
    question(State,Question,Pred),
    write(Question),
    nl,
    readln(Ans),
    save_to_kb(Pred,Ans),
    NextState is (State + 1),
    process(NextState).

% Final "base case" of process is where we return the result. get_result needs inputs from all predicates that we've saved to KB.
process(10) :- 
    name(X),
    get_result(X,Result),
    write(Result). %Will need to add next stage of Q/A later.

%Can repeat logic below with any predicates that we want to save to KB
save_to_kb(Pred,Ans) :- is_name(Pred), assertz(name(Ans)).

% Question KB
question(1, "Do you poop?", poop).
question(2, "Do you eat apples?", apples).
% Johnny's starting new venture, bad life coach
%Asks lots of questions and in the end have a list of diff result(X,Y) with replies
