function  tema2( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

MET1();

end


function MET2()

I = im2bw( imread('binquad4.bmp') );

%me resulta mas sencillo
Ic = ~I;

ES1 = strel('rectangle', [10,70]);
ES2= ~(ES1.getnhood());

R1= bwhitmiss(Ic, ES1, ES2);
imshow(R1);

R2 =  imreconstruct(R1, Ic );
R2 = Ic - R2 ;
R2 = ~R2;

figure; imshow(R2 );
end


function MET1()

I = im2bw( imread('binquad4.bmp') );
%me resulta mas sencillo
Ic = ~I;

ES1 = strel('disk', 20);
R1 = nimerosion(Ic,ES1,1);
imshow(R1);
R2 =  imreconstruct(R1, Ic );
R2 = ~R2;

figure; imshow(R2 );
end
