function  Gf  = multiescalemorph( g, B , M)
%MULTISCALEMORPH Implementacion de mejora del contraste utilizando un
% enfoque morfologico 
% Parametros : 
% g: imagen de entrada,
% B: elemento estructurante convexo 
% M: cantidad de veces que se escalara el elemento estructurante 

% Presentado por Susanta Mukhopadhyay, Bhabatosh Chanda en , 
% "A multiscale morphological approach to local contrast enhancement"
% (1999)

% Implementado por : Nelson Duranhona Ariel Mendez   
%  Definimos las funciones en funciones a ehosiones y dilataciones


if nargin < 1 
    test3()
    return ;
end

%Sa : almacena las sumatoria de las transformaciones con detalles brillantes   
%Sb : almacena las sumatoria de las transformaciones con detalles opacos 
Sa = 0*g;
Sc = Sa;

for n=1:M 
    
    nB =  ndilate(n , B);
    
    %basicamente es una transformacion top-hat con B escalado   
    FaB = g - apertura(g, nB);
    
    %basicamente es una transformacion bottom-hat con B escalado 
    FcB = cierre(g, nB) - g  ;
    
    Sa = Sa + FaB   ;
    Sc = Sc + FcB ;
end

%finalmente se asigna el mismo peso para cada sumatoria y se  suma a la
%imagen original.
Gf = g + (0.5* Sa) - (0.5* Sc) ;

end


function a= apertura(g, B)
  a =  imdilate(imerode(g,B),B);
end

function c= cierre(g, B)
  c =  imerode(imdilate(g,B),B);
end 



function Br = ndilate(n, B)
    %B: elemento estructurante
    
    Br = B.getnhood();
    
    for i = 1:n-1
        %expande la matriz del EE para permitir la dilatacion 
        [F, C ] = size(Br);
        Br = cat(2,zeros(F,1), Br );
        Br = cat(2, Br, zeros(F,1) );
        Br = cat(1,zeros(1,C+2 ),Br );
        Br = cat(1,Br,zeros(1,C+2 ));

        Br = imdilate(Br,B);
    end

end



%Set de pruebas con varias imagenes
function test1()
f = imread('brain.tif');
f= f(:,:,1);

%metodo propùesto implementado 
B= strel('disk',6);
G = multiescalemorph(f, B , 6);
figure ;imshow(G);

%ecualizacion de histograma global 
h = histeq(f);
figure ;imshow(h);

%
h2 = imadjust(f);
figure ;imshow(h2);

%comparacion de metricas 
%entropia 
fprintf( '\nEntropia segun metodo prop %d:' , entropy(G ));
fprintf( '\nEntropia segun ecualizacion %d:\n' , entropy(h));
fprintf( '\nEntropia segun ecualizacion por regiones %d:\n' , entropy(h2));


end

function test2()
f = imread('mamografia1.jpg');
f= f(:,:,1);

%metodo propùesto implementado 
B= strel('disk',2);
G = multiescalemorph(f, B , 4);
figure ;imshow(G);

%ecualizacion de histograma global 
h = histeq(f);
figure ;imshow(h);

%
h2 = imadjust(f);
figure ;imshow(h2);

%comparacion de metricas 
%entropia 
fprintf( '\nEntropia segun metodo prop %d:' , entropy(G ));
fprintf( '\nEntropia segun ecualizacion %d:\n' , entropy(h));
fprintf( '\nEntropia segun ecualizacion por regiones %d:\n' , entropy(h2));
end


function test3()
f = imread('mamografia2.jpg');
f= f(:,:,1);

%metodo propùesto implementado 
B= strel('disk',5);
G = multiescalemorph(f, B , 6);
figure ;imshow(G);

%ecualizacion de histograma global 
h = histeq(f);
figure ;imshow(h);

%
h2 = imadjust(f);
figure ;imshow(h2);

%comparacion de metricas 
%entropia 
fprintf( '\nEntropia segun metodo prop %d:' , entropy(G ));
fprintf( '\nEntropia segun ecualizacion %d:\n' , entropy(h));
fprintf( '\nEntropia segun ecualizacion por regiones %d:\n' , entropy(h2));


end


