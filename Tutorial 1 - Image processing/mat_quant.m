%fonction qui fabrique la matrice de quantification
%a partir de l'indice de qualite, on construit une matrice 8x8 que la 
%fonction retourne
function [Q] = mat_quant(Fq)

for i=1:8
    for j=1:8
        Q(i,j)= 1 + (( 1 + (i-1) + (j-1)) * Fq);
    end;
end;