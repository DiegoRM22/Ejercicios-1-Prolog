%
% IA-ESIT-ULL: Ejemplo de hechos y reglas
%

% Hechos
%

% Sexo
femenino(petra).
femenino(carmen).
femenino(maria).
femenino(rosa).
femenino(ana).
femenino(cande).
masculino(angel).
masculino(pepe).
masculino(juan).
masculino(pedro).
masculino(enrique).
masculino(raul).
masculino(alfonso).

% Progenitor
progenitor(petra, juan).
progenitor(petra, rosa).
progenitor(carmen, pedro).
progenitor(maria, ana).
progenitor(maria, enrique).
progenitor(rosa, raul).
progenitor(rosa, alfonso).
progenitor(rosa, cande).
progenitor(angel, juan).
progenitor(angel, rosa).
progenitor(pepe, pedro).
progenitor(juan, ana).
progenitor(juan, enrique).
progenitor(pedro, raul).
progenitor(pedro, alfonso).
progenitor(pedro, cande).


% Reglas
%

nieto_a(X, Y) :- progenitor(V, X), progenitor(Y, V).
% X es hijo de Y %
hijo(X, Y) :- progenitor(Y, X), masculino(X).
hija(X, Y) :- progenitor(Y, X), femenino(X).

nieto(X, Y) :- masculino(X), progenitor(V, X), progenitor(Y, V).
nieta(X, Y) :- femenino(X), progenitor(V, X), progenitor(Y, V).

% X es hermanO de Y. %
hermano(X, Y) :- not(X = Y), masculino(X), (progenitor(V, X), progenitor(V, Y)).
hermana(X, Y) :- not(X = Y), femenino(X), (progenitor(V, X), progenitor(V, Y)).

% X es sobrino de Y. %
sobrino(X, Y) :- masculino(X), (progenitor(V,X), (hermano(Y,V); hermana(Y,V))).
sobrina(X, Y) :- femenino(X), (progenitor(V,X), (hermano(Y,V); hermana(Y,V))).

% X es primo de Y %
primo(X, Y) :- masculino(X), (progenitor(V,X) , progenitor(W,Y) , (hermano(V,W); hermana(V,W))).
prima(X, Y) :- femenino(X), (progenitor(V,X) , progenitor(W,Y) , (hermano(V,W); hermana(V,W))).

antepasado(X, Z) :- progenitor(X, Z).
antepasado(X, Z) :- progenitor(X, Y), antepasado(Y, Z).



