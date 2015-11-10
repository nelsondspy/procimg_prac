function tema1()
   SOL1();
   
end

function SOL1()

I = im2bw( imread('binbolin.bmp') );

%para que los elementos de interes tengan valor 1 y resto 0 
Ic = ~I;
%elemento estructurante con forma de disco de radio 2
ES1 = strel('disk', 2);

%la erosion deja solo los circulos
R1= nimerosion(Ic, ES1, 1);
imshow(R1);

%se eliminan los circulos restandolos de la imagen principal, se dilata R1
%para compensar la erosion aplicada anteriormente
R2 = Ic - nimdilatacion(R1,ES1,1 );

%se vuelve a complementar para obtener elc color original
R2 = ~R2; 

%imagenes 
figure; 
imshow(R2);

end



function SOL2()

I = im2bw( imread('binbolin.bmp') );

%me resulta mas sencillo
Ic = ~I;

Eaux = strel('disk', 5);
ES1 = Eaux.getnhood();

ES1(ceil(size(ES1)/2) + 1:end,:) = 0 ;
ES1(ceil(size(ES1)/2) - 1,:) = 1 ;
C = zeros(size(ES1),size(ES1)); C(ceil(size(ES1)/2) - 1,:)=1 ;
ES1 = cat(2,C,ES1,C);
ES2 = ~ES1; 
disp(ES1);
disp(ES2);
R1 = nimerosion(Ic, ES1, 1);

R2 = Ic - nimdilatacion(R1,ES1,1 );
R2 = ~R2; 
 

%imagenes 
figure; 
subplot(2,1,1), imshow(I);
subplot(2,1,2), imshow(R1);
figure; imshow(R2);
end

