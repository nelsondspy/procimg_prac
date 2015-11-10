function tema3( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
I = im2bw( imread('binumero.bmp') );

Ic = ~I;

[L, num ] = bwlabel(Ic,4);

%elementos estructurantes
ES1= ones(4,4);
ES1(2:4,1:3) = 0;

ES2= zeros(3,5);
ES2(1,1)=1;ES2(2,2)=1;ES2(3,3)=1;ES2(4,2)=1;ES2(5,3)=1;

for i=1:num
    [f,c ] = find(L==i);
   
    min_max_f  = min(f):max(f);
    min_max_c = min(c):max(c);
    Elemento = Ic( min_max_f  ,min_max_c );
        
    %R1 = imerode(Elemento, ES1);
    R2 = imerode(Elemento, ES1);
    
    figure; imshow(R2);
    %break;

end


