:- dynamic name/1.

main :- start_chat.

start_chat :-
    write('I did NOT hit her, I did nooooot- Oh hi. What is your name?'),nl,
    readln([X|_]),
    write('Oh hi '),write(X),write('! I am your new life coach.'),
    assertz(name(X)),
    process(1).

process(State) :-
    question(State,Question,Pred),
    write(Question),
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

question().

% Johnny's starting new venture, bad life coach
%Asks lots of questions and in the end have a list of diff result(X,Y) with replies