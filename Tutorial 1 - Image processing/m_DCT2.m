function [a] = m_DCT2(m)
%Fonction calculant la DCT inverse d'une matrice 
%arguments d'entree: 
%	- m matrice 8*8 sur laquelle sera appliquée la dct inverse
%argument de sortie: 
%  	- a matrice 8*8 correspondant à la dct inverse appliquée sur m
%recuperation de la taille de la matrice m
a=dct2(m);