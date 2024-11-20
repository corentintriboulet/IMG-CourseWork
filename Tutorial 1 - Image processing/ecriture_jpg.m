%ecriture du pseudo jpg dans un fichier 
function [] = ecriture_jpg(JPG,nom,qualite)

%ouverture du fichier
fid = fopen(nom,'w');
%lecture de la taille de la matrice
taille = size(JPG);
%ecriture dans le fichier de la taille de l'image
count = fwrite(fid,taille(1),'double');
count = fwrite(fid,taille(2),'double');
%ecriture de la qualite
count = fwrite(fid,qualite,'double');
%ecriture de la matrice dans le fichier au format entier signe de 16
%bits
count = fwrite(fid,JPG,'int8');
%fermeture du fichier
fclose(fid);
