function [ G ] = filtro( f, m, n )

%  
[fil , col , Z ] = size(f);

G  = uint8(zeros(fil, col));

for i = 1 : fil
    for j = 1 : col
        %obtiene los elementos de la vecindad llamando a la funcion
        vecind = imvecindad(f , [i,j] , m,n);
        [vf, vc] = size(vecind);
        
        for s = 1 : vf
            for t = 1 : vc
                
              G(i,j)= 0.5 * ( max(max( vecind )) + min(min( vecind )) );  
            
            end
        end
        
        
    end
end
