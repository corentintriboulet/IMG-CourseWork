%fonction qui permet de passer sur tous les blocs de 8x8 de la matrice
%et d'appliquer la i-DCT 
function [M] = conversion_frequentiel_spatial(matrice,qualite)

%recuperation des dimensions de la matrice (hauteur, largeur)
dim = size(matrice(:,:,1));

%on suppose que les images ont des dimensions qui sont des multiples de 8
%nombre de matrice 8x8 dans la largeur de l'image
nb_mat8_larg = dim(1)/8;
%nombre de matrice 8x8 dans la hauteur de l'image
nb_mat8_haut = dim(2)/8;

%fabrication de la matrice 8x8 de quantification
M_Q = mat_quant(qualite);

for k=1:3
    for i=0:(nb_mat8_larg-1)
	    for j=0:(nb_mat8_haut-1)
		  %matrice 8x8 temporaire sur laquelle on va faire la IDCT
		  M88 = matrice((1+8*i):(8*(i+1)),(1+8*j):(8*(j+1)),k);
           	  %on multiplie cette matrice par la matrice de quantification
          	  M88_dequantifie = M88 .* M_Q;
          	  %calcul de la IDCT
         	  M88IDCT = m_IDCT2(M88_dequantifie);
         	  %on ajoute 128 a tous les coefficients de la matrice
          	  M88IDCT_128 = ajoute(M88IDCT,128);
          	  %on place la matrice 8x8 dans la matrice retournee par la
          	  %fonction
          	  M((1+8*i):(8*(i+1)),(1+8*j):(8*(j+1)),k) = M88IDCT_128;
             end;
    end;
end;