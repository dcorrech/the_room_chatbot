main :- start_chat.

start_chat :-
    write('I did NOT hit her, I did nooooot- Oh hi. What is your name?'),nl,
    readln([X|_]),
    write('Oh hi '),write(X),write('! I am your new life coach.'),
    assertz(name(X)).
    process(X, start),
    % ...
    write(get_result()).

% process(X, State) :-
%     repeat,
%     write(X),write(', '), write(prompt(State,Prompt)),
%     read()
    
prompt(start, 'have you seen Danny?').


process(bye) :- !.


% Johnny's starting new venture, bad life coach
%Asks lots of questions and in the end have a list of diff result(X,Y) with replies