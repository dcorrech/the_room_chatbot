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
    % ...
    % write(get_result()).

%Can repeat logic below with any predicates that we want to save to KB
save_to_kb(Pred,Ans) :- is_name(Pred), assertz(name(Ans)).
    
prompt(start, 'have you seen Danny?').


% Johnny's starting new venture, bad life coach
%Asks lots of questions and in the end have a list of diff result(X,Y) with replies