%Le programme principal de compression d'une image bitmap bas�e sur la DCT
%Entr�es :  
%   - la qualite de la de la quantification
%	- nom de l'image source sous forme de charact�res
%   - nom du fichier destination o� les matrices DCTs sont sauvegard�es

%Sortie : 
%   - temps du traitement en seconde

function [duree_traitement] = main_compression(qualite, nom_source_bmp, nom_destination_jpg)

%Initialisation de l'horloge
temps_debut = cputime;

%lecture de l'image source
imageBMP = lecture_image_bmp(nom_source_bmp);

%conversion de la matrice avec l'application de la DCT sur les blocs 8x8 de l'image bitmap source
imageJPG = conversion_spatial_frequantiel(imageBMP, qualite);

%ecriture de l'image DCTs dans un fichier
ecriture_jpg(imageJPG, nom_destination_jpg, qualite);

%terminaison de l'horloge � la fin du traitement
temps_fin = cputime;

duree_traitement = temps_fin - temps_debut;