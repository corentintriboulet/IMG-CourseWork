%fonction qui permet d'ajouter ou de retrancher une certaine valeur à tous
%les coefficients d'une matrice
%parametres d'entree
%   -m la matrice sur laquelle va porter le calcul
%   -valeur la valeur a ajouter (ou retrancher si nombre negatif)
%parametres de sortie
%   -res la matrice du resultat 
function [res] = ajoute(m,valeur)

%recuperation de la taille de la matrice
taille = size(m);

%construction d'une matrice que l'on va ajouter à m
temp = ones(taille(1),taille(2)) * valeur;

res = m + temp;
