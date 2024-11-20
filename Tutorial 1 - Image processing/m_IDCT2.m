function [a] = m_IDCT2(m)
%Fonction calculant la DCT inverse d'une matrice 
%arguments d'entree: 
%	- m matrice 8*8 sur laquelle sera appliqu�e la dct inverse
%argument de sortie: 
%  	- a matrice 8*8 correspondant � la dct inverse appliqu�e sur m
%recuperation de la taille de la matrice m
a=idct2(m);