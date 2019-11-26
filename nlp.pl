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
n(n(Word)) --> [Word], {lex(Word, _, n)}.
v(v(Word)) --> [Word], {lex(Word, _, v)}.

parsenoun(Input,Ans) :- s(Tree,Input,[]), search(Tree,Ans).

search(s(np(_,n(N)),_), N) :- dif(N,'I').
search(s(np(n(N)),_), N) :- dif(N,'I').
search(s(np(n(N))), N) :- dif(N,'I').
search(s(_,vp(_,NP)),N) :- search(NP,N).
search(np(_,n(N)),N) :- dif(N,'I').
search(np(n(N)),N) :- dif(N,'I').

lex(the, det).
lex(a, det).
lex(woman, woman, n).
lex(man, man, n).
lex(boy, boy, n).
lex(girl, girl, n).
lex(person, person, n).
lex(i, i, n).
lex(football, football, n).
lex(soccer, soccer, n).
lex(volleyball, volleyball, n).
lex(hockey, hockey, n).
lex(basketball, basketball, n).
lex(lacrosse, lacrosse, n).
lex(bowling, bowling, n).
lex(chess, chess, n).
lex(swimming, swimming, n).
lex(lifting, lifting, n).
lex(wrestling, wrestling, n).
lex(tennis, tennis, n).
lex(polo, polo, n).
lex(curling, curling, n).
lex(rugby, rugby, n).
lex(hacking, hacking, n).
lex(hunting, hunting, n).
lex(soccer, soccer, n).
lex(building, building, n).
lex(house, house, n).
lex(apartment, apartment, n).
lex(phone, cellphone, n).
lex(phone, phone, n).
lex(sex, sex, n).
lex(fiance, fiance, n).
lex(girlfriend, girlfriend, n).
lex(boyfriend, boyfriend, n).
lex(husband, husband, n).
lex(wife, wife, n).
lex(money, money, n).
lex(yes, yes, n).
lex(yes, yeah, n).
lex(yes, yep, n).
lex(no, no,n).
lex(no, never, n).
lex(no, nope, n).
lex(shoots, shoots, v).
lex(is, is, v).
lex(am, am, v).
lex(are, are, v).
lex(love, love, v).
lex(like, like, v).
lex(adore, adore, v).
% lex(shoots, v) :- shoot.
% lex(shoots, v) :- shot.
% lex(cheat, v) :- cheat.
% lex(cheat, v) :- cheated.
% lex(cheat, v) :- cheats.
% lex(betray, v) :- betray.
% lex(betray, v) :- betrays.
% lex(betray, v) :- betrayed.
