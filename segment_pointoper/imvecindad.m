function  vecindad = imvecindad( matriz, punto, vert , horiz )
%autor Nelson Duranhona 10/09/2014 D/M/Y
%imvencidad devuelve la matriz vecindad de un punto.
%Recibe como parametros: 
% -una matriz que representa a la imagen ,  
% -el punto como [fila, columna],
% -el alto de la ventana /2 
% -el ancho de la ventana /2
%y retorna la vecindad

[M ,N] = size(matriz);

f1 = punto(1) - vert ;
c1 = punto(2) - horiz;

f2 = punto(1) + vert ;
c2 = punto(2) + horiz ;

if f1 < 1
    f1 = punto(1);
end
if c1 < 1
    c1 = punto(2);
end
if f2 > M
    %f2 = punto(1);
    f2 = M; 
end
if c2 > N
    %c2 = punto(2);
    c2 = N ;
end

vecindad = matriz(f1:f2,c1:c2);

end
