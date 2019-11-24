% Basic NLP structure
% based on Poole and Mackworth's "Artificial Intelligence 2E: Foundations of Computational Agents"
% and section 6.2 of Bratko's "Prolog Programming for Artificial Intelligence"

% :- dynamic name/1

% sentence(L0,L2,Num,s(NP,VP)) :- noun_phrase(L0,L1,Num,NP), verb_phrase(L1,L2,Num,VP).

% noun_phrase(L,L,Num,nonp).
% noun_phrase(L0,L4,Num,np(Det,Mods,Noun,PP)) :- det(L0,L1,Num,Det), adjectives(L1,L2,Mods), noun(L2,L3,Num,Noun), pp(L3,L4,PP).

% adjectives(L0,L2, Mods) :- adj(L0,L1), adjectives(L1,L2).

% pp(L,L,nopp)
% %pp(L0,L2,NP) :- preposition(L0,L1), noun_phrase(L1,L2,Num,NP).

% verb_phrase(L0,L3,Num,vp(V,NP,PP)) :- verb(L0,L1,Num,V), noun_phrase(L1,L2,N2,NP), pp(L2,L3,PP).

% %trans(Term,L0,L1) true if Term translates into words in diff list L0-L1

% det([a|L],L,singular,indefinite).
% det([the|L],L,Num,definite).

% question([is|L0],Ind) :- noun_phrase(L0,L1,Ind),mp(L1,[],Ind).
% question([who,is|L0],Ind) :- mp(L0,[],Ind).
% question([who,is|L],Ind) :- noun_phrase(L,[],Ind).
% question([who,is|L],Ind) :- adjectives(L,[],Ind).
% question([which|L0],Ind) :- noun_phrase(L0,[is|L1],Ind),mp(L1,[],Ind).

%ask(Q,A) :- question(Q,[],A).

start_chat :- 
    write('I did NOT hit her, I did nooooot- Oh hi. What is your name?'),nl,
    read(X),
    write('Oh hi '),writeq(X),write('!'),
    name_process(X).

name_process(N) :- 
    write('Oh hi '),write(N),write('!'),
    assertz(name(N)). %does this add the name to the KB?

process(bye) :- !.
