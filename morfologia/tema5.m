function tema5 
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


I = im2bw( imread('binquad2.bmp') );

%me resulta mas sencillo
Ic = ~I;

[L, num ] = bwlabel(Ic,8);
AR = 1: num  ;
%fila 1 de min y max para num de etiqueta y fila 2 para el area 
%max en orden descendente



for i=1:num
    area = sum(sum(L == i));
    AR(i) = area;
       
end

ARX = AR;

[MAX1 , IMAX1] = max(ARX);
ARX(IMAX1) = 0 ;
[MAX2 , IMAX2] = max(ARX);
Ic= Ic - (L==IMAX1);
Ic= Ic - (L==IMAX2);
fprintf('\n etiquetas a eliminar:   %d , %d ', IMAX1, IMAX2);


ARX = AR;
%evita que las etiquetas con conteo 0 intefieran con el conteo 
ARX(ARX==0) = MAX1;
[MIN1 , IMIN1] = min(ARX);
ARX( IMIN1 ) =  MAX1 ;
[MIN2, IMIN2] = min(ARX);
ARX( IMIN2 ) =  MAX1 ;
[MIN3, IMIN3] = min(ARX);
Ic= Ic - (L==IMIN1);
Ic= Ic - (L==IMIN2);
Ic= Ic - (L==IMIN3);

Ic = ~Ic ;

fprintf('\n etiquetas a eliminar: %d , %d ,%d', IMIN1, IMIN2 , IMIN3);
fprintf('\n conteos : %d , %d ,%d', MIN1, MIN2 , MIN3);


imshow(I)
figure ;
imshow(Ic); 


end

