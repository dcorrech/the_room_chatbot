:- dynamic name/1. %need to declare every predicate we want to learn as dynamic up here!
begin_your_journey :- welcome_user, gather_data.

welcome_user :- write('I did NOT hit her, I did nooooot- Oh hi. What is your name?'),
                            nl,
                            readln([X|_]),
                            write('Oh hi '),
                            write(X),
                            write('! I am your new life coach.'),
                            nl,
                            assertz(name(X)).

gather_data(State) :-
    question(State,Question,Pred),
    write(Question),
    nl,
    readln(Ans),
    save_to_kb(Pred,Ans),
    NextState is (State + 1),
    gather_data(NextState).
    % ...
    % write(get_result()).

%Can repeat logic below with any predicates that we want to save to KB
save_to_kb(Pred,Ans) :- is_name(Pred), assertz(name(Ans)).

question(1, "Do you poop?", poop).
question(2, "Do you eat apples?", apples).
% Johnny's starting new venture, bad life coach
%Asks lots of questions and in the end have a list of diff result(X,Y) with replies
