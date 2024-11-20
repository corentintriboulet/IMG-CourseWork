%ecriture d'une matrice RGB dans un fichier au format bmp 
function [] = ecriture_bmp(BMP,nom)

BMPuint8 = uint8(BMP);

%ecriture de l'image
imwrite(BMPuint8,nom,'bmp');
