% Basic NLP structure and chatbot process
% based on Poole and Mackworth's "Artificial Intelligence 2E: Foundations of Computational Agents"
% and section 6.2 of Bratko's "Prolog Programming for Artificial Intelligence"

:- dynamic name/1, likes_football/1.

% question([is|L0],Ind) :- noun_phrase(L0,L1,Ind),mp(L1,[],Ind).
% question([who,is|L0],Ind) :- mp(L0,[],Ind).
% question([who,is|L],Ind) :- noun_phrase(L,[],Ind).
% question([who,is|L],Ind) :- adjectives(L,[],Ind).
% question([which|L0],Ind) :- noun_phrase(L0,[is|L1],Ind),mp(L1,[],Ind).

%ask(Q,A) :- question(Q,[],A).
s --> np, vp.
np --> det, n.
vp --> v, np.
vp --> v.

det --> [Word], {lex(Word, det)}.
n --> [Word], {lex(Word, n)}.
v --> [Word], {lex(Word, v)}.

lex(the, det).
lex(a, det).
lex(woman, n).
lex(man, n).
lex(shoots, v).
