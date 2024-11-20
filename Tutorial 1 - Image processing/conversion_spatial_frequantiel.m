%Cette fonction permet de faire passer l'information des pixels du domaine spatial au 
%domaine frequentiel en appliquant la DCT sur tous les blocs de 8x8 l'image
%Entrées :
%   - matrice de l'image RGB codée en double
%   - qualite qui donne une matrice de quantification
%Sortie :
%   - L'image transformée sous forme de matrices DCT 

function [M] = conversion_spatial_frequantiel(matrice, qualite)

% On limite le facteur de qualite
if qualite<0
    qualite=1;
elseif qualite>25
    qualite=25;
end

%recuperation de la largeur et de la hauteur dans la dimensions
dimensions = size(matrice(:,:,1));

%on suppose que les images ont des dimensions qui sont des multiples de 8
%le nombre de blocs 8x8 pixels dans la largeur de l'image
nb_mat8_larg = dimensions(1)/8;
%le nombre de blocs 8x8 pixels dans la hauteurs de l'image
nb_mat8_haut = dimensions(2)/8;

%fabrication d'une matrice 8x8 de quantification
M_Q = mat_quant(qualite);

for k = 1:3
    for i = 0:(nb_mat8_larg-1)
	    for j = 0:(nb_mat8_haut-1)
    		  %matrice 8x8 temporaire sur laquelle on va faire la DCT
		      M88 = matrice((1+8*i):(8*(i+1)),(1+8*j):(8*(j+1)),k);
          	  %on retranche 128 à tous les coefficients de la matrice
         	  M88_128 = ajoute(M88,-128);
         	  %calcul de la DCT sur cette matrice
         	  M88DCT = m_DCT2(M88_128);
          	  %quantification : division de la matrice ayant subi la DCT par
           	  %la matrice de quantification
         	  M_quantifiee = round(M88DCT./M_Q);
           	  %placement du resultat dans la matrice qui sera retournee par
        	  %la fonction
           	  M((1+8*i):(8*(i+1)),(1+8*j):(8*(j+1)),k) = M_quantifiee;
        end
	end
end