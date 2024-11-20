%Programme principal de decompression d'un pseudo jpg en image bmp 
%Entrees : 
%	- nom de l'image créé au format pseudo jpg
%   - nom du fichier bmp qui sera forme à partir de ce fichier pseudo jpg
%Sortie : 
%   - temps du traitement en seconde
function[duree_traitement]=main_decompression(nom_source_jpg, nom_destination_bmp)

temps_debut = cputime;

%lecture jpg
[JPG,qualite] = lecture_jpg(nom_source_jpg);

%reconversion de la matrice : application de la i-DCT sur la matrice
BMP = conversion_frequentiel_spatial(JPG,qualite);

%ecriture de la matrice traitee par la i-DCT dans un fichier
ecriture_bmp(BMP, nom_destination_bmp);

temps_fin = cputime;
duree_traitement = temps_fin - temps_debut;