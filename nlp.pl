% Basic NLP structure and chatbot process
% based on Poole and Mackworth's "Artificial Intelligence 2E: Foundations of Computational Agents"

% question([is|L0],Ind) :- noun_phrase(L0,L1,Ind),mp(L1,[],Ind).
% question([who,is|L0],Ind) :- mp(L0,[],Ind).
% question([who,is|L],Ind) :- noun_phrase(L,[],Ind).
% question([who,is|L],Ind) :- adjectives(L,[],Ind).
% question([which|L0],Ind) :- noun_phrase(L0,[is|L1],Ind),mp(L1,[],Ind).

%ask(Q,A) :- question(Q,[],A).
s(s(NP,VP))  -->  np(NP),vp(VP).
s(s(NP))  -->  np(NP).
s(s(VP))  -->  vp(VP).

np(np(DET,N))  -->  det(DET),n(N).
np(np(N))  -->  n(N).

vp(vp(V,NP))  -->  v(V),np(NP).
vp(vp(V))  -->  v(V).

det(det(Word)) --> [Word], {lex(Word, det)}.
n(n(Word)) --> [Word], {lex(Word, n)}.
v(v(Word)) --> [Word], {lex(Word, v)}.

% Successfully grabbed noun from Input as Ans.
search_input(Input,_, Ans) :- parsenoun(Input, Ans).

%Unable to read input. Print error message to user and then re-ask question.
search_input(Input, State, Ans) :-
   \+ parsenoun(Input, Ans),
   nl,
   random_between(1, 10, Random),
   error_messages(Random, ErrorMsg),
   write(ErrorMsg),
   nl, nl,
   write("I did not understand what you said!"),
   nl,nl,
   gather_data(State).

parsenoun(Input,Ans) :- s(Tree,Input,[]), search_noun(Tree,Ans).

search_noun(s(np(_,n(N)),_), N) :- dif(N,'I'), dif(N,'How'), dif(N,'Who'), dif(N,'Where'), dif(N,'How'), dif(N,'Why').
search_noun(s(np(n(N)),_), N) :- dif(N,'I'), dif(N,'How'), dif(N,'Who'), dif(N,'Where'), dif(N,'How'), dif(N,'Why').
search_noun(s(np(n(N))), N) :- dif(N,'I'), dif(N,'How'), dif(N,'Who'), dif(N,'Where'), dif(N,'How'), dif(N,'Why').
search_noun(s(_,vp(_,NP)),N) :- search_noun(NP,N).
search_noun(np(_,n(N)),N) :- dif(N,'I'), dif(N,'How'), dif(N,'Who'), dif(N,'Where'), dif(N,'How'), dif(N,'Why').
search_noun(np(n(N)),N) :- dif(N,'I'), dif(N,'How'), dif(N,'Who'), dif(N,'Where'), dif(N,'How'), dif(N,'Why').
search_noun(vp(_,n(N)),N) :- dif(N,'I'), dif(N,'How'), dif(N,'Who'), dif(N,'Where'), dif(N,'How'), dif(N,'Why').
search_noun(vp(_,NP),N) :- search_noun(NP,N).

parse_input([bye],_,bye).
parse_input([quit],_,quit).
parse_input([how,are,you|_],_,how_are_you).
parse_input([how,are,things|_],_,how_are_you).
parse_input([],_,how_are_you).
parse_input(Input,Object,Ans) :-
    s(Tree,Input,[]),
    search_content(Tree,Ans),
    search_noun(Tree,Object).

% search_content(s(np(_,n(how)),vp(are,np(_,n(you)))), how_are_you).
% search_content(s(np(_,n(how)),vp(are,np(n(you)))), how_are_you).
% search_content(s(np(n(how)),vp(are,np(n(you)))), how_are_you).
% search_content(s(np(n(how)),vp(are,np(_,n(you)))), how_are_you).
% search_content(s(np(n('How')),vp(are,np(n(you)))), how_are_you).
% search_content(s(np(n('How')),vp(are,np(_,n(you)))), how_are_you).
% search_content(s(np(_,n(how)),vp(are,np(_,n(things)))), how_are_you).
% search_content(s(np(_,n(how)),vp(are,np(n(things)))), how_are_you).
% search_content(s(np(n('How')),vp(are,np(n(things)))), how_are_you).
% search_content(s(np(n('How')),vp(are,np(_,n(things)))), how_are_you).

% search_content(s(vp('Tell'),_), tell_me).
% search_content(s(_,vp(v(tell),_)), tell_me).

% search_content(s(np(_,n(who)),vp(is,_)), who_is).
% search_content(s(np(_,n(who)),vp(is,_)), who_is).
% search_content(s(np(n('Who')),vp(is,_)), who_is).
% search_content(s(np(n('Who')),vp(is,_)), who_is).

lex(the, det).
lex('The', det).
lex(a, det).
lex('Who', n).
lex('What', n).
lex('Where', n).
lex('When', n).
lex('Why', n).
lex('How', n).
lex(who, n).
lex(what, n).
lex(where, n).
lex(when, n).
lex(why, n).
lex(how, n).
lex(woman, n).
lex(man, n).
lex(boy, n).
lex(girl, n).
lex(person, n).
lex(i, n).
lex('I', n).
lex(football, n).
lex(soccer, n).
lex(volleyball, n).
lex(hockey, n).
lex(basketball, n).
lex(lacrosse, n).
lex(bowling, n).
lex(chess, n).
lex(swimming, n).
lex(lifting, n).
lex(wrestling, n).
lex(tennis, n).
lex(polo, n).
lex(curling, n).
lex(rugby, n).
lex(hacking, n).
lex(hunting, n).
lex(soccer, n).
lex(building, n).
lex(house, n).
lex(apartment, n).
lex(cellphone, n).
lex(phone, n).
lex(sex, n).
lex(fiance, n).
lex(girlfriend, n).
lex(boyfriend, n).
lex(husband, n).
lex(wife, n).
lex(money, n).
lex(yes,n).
lex('Yes',n).
lex(yeah, n).
lex('Yeah', n).
lex(yep, n).
lex(no,n).
lex('No', n).
lex(nah,n).
lex(never, n).
lex('Never', n).
lex(nope, n).
lex(things,n).
lex(thing, n).
lex(bye, n).
lex(goodbye, n).
lex(quit, n).
lex(shoots, v).
lex(is, v).
lex('Is', v).
lex(are, v).
lex('Are', v).
lex(am, v).
lex('Am', v).
lex(was, v).
lex(love, v).
lex(like, v).
lex(adore, v).
lex(would, v). % not always a verb...
lex(will, v).
lex(do, v).
lex(does, v).
lex(did, v).
lex(tell, v).
lex(can, v).
lex('Tell', v).
lex('Can', v).
% lex(shoots, v) :- shoot.
% lex(shoots, v) :- shot.
% lex(cheat, v) :- cheat.
% lex(cheat, v) :- cheated.
% lex(cheat, v) :- cheats.
% lex(betray, v) :- betray.
% lex(betray, v) :- betrays.
% lex(betray, v) :- betrayed.

%Who is... charaacters, if not characters, then he says he has no idea who that is
% Do you like....?
%Tell me... and thenhe says something wacky