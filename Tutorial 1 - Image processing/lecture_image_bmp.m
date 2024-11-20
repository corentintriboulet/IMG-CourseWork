%Fonction de lecture d'un fichier image au format bitmap
%L'image lue est cod�es en entiers courts, elle est convertie
%en double pour pouvoir lui appliquer des operations types *, /, etc.
%Entr�es :
%   - nom du fichier sous forme de cahine de charact�res
%Sortie :
%   - image sous forme matricielle RGB cod�e en double 

function [imageRGBdouble] = lecture_image_bmp(nom_fichier)

%lecture du fichier au format unsigned integer de 8 bits
imageRGBuint8 = imread(nom_fichier,'bmp');

%conversion des coefficients au format double
imageRGBdouble = double(imageRGBuint8);
