%fonction qui lit l'image composée de coefficients DCT 
function [JPG,qualite] = lecture_jpg(nom)
%ouverture du fichier contenant les matrices traitees par la DCT
fid = fopen(nom,'r');

%lecture de la hauteur et la largeur de la matrice traitee
taille(1) = fread(fid,1,'double');
taille(2) = fread(fid,1,'double');
nb_lignes = taille(1);
nb_colonnes = taille(2);

%lecture de la qualite employe pour transformer ce pseudo jpg
qualite = fread(fid,1,'double');

%on recupere les 3 matrices R G B
for j=1:3
    %on recupere les infos depuis le fichier, colonne par colonne
    for i=1:nb_colonnes
    	%on lit dans le fichier les infos d'une colonne que l'on range dans une matrice
        %on lit des entiers non signes codes sur 8 bits et on ecrit la meme
        %chose dans la matrice au format double
        JPGint16(:,i,j) = fread(fid,nb_lignes,'int8');
    end
end

JPG = double(JPGint16);

%fermeture du fichier
fclose(fid);