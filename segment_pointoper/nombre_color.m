
function [ respuesta ] = nombre_color( IM )
% %Alumno : Nelson Durañona - 2da parcial 2014 Materia : PDI I 
%  Se trabaja con la imagen con el modelo HSI.
%  Se probaron DOS METODOS DIFERENTES , ambos trabajan con el matiz:

%  A- Hallar el matiz promedio de la imagen y segun este valor determinar 
%  el color primario .
%  --------------------------------

%  B- Clasificar cada punto segun intervalos de matiz.
%  Cada color primario tiene un intervalo
%  Entonces se tiene tres intervalos, se cuenta cuantos puntos se
%  encuentran en cada intervalo.



%hallamos los limites para los intervalos de cada color primario
[ matiz_R s i] = rgb2hsv([[255,0,0]]) ; %esto por ejemplo da 0
[ matiz_G s i]= rgb2hsv([[0,255,0]]) ;
[ matiz_B s i]= rgb2hsv([[0,0,255]]) ;

%%--------------CRITERIO A-------------


%halla la matiz promedio de todos los puntos 
IMhsv = 	(IM); 
matiz_media = mean(mean(IMhsv(:,:,1))) ;

%verificamos en que intervalo se encuentra matriz promedio
if matiz_media >= matiz_R && matiz_media < matiz_G
    nombrecolorA = 'ROJO';
end

if matiz_media >= matiz_G && matiz_media < matiz_B
    nombrecolorA = 'VERDE';
end
if matiz_media >= matiz_B 
    nombreco    lorA = 'AZUL';
end
disp('Segun el metodo del matiz promedio es :')
disp(nombrecolorA )

%%--------------CRITERIO B-------------

[NF, NC, c] = size(IM); 
CONTEO_R =0;
CONTEO_G = 0;
CONTEO_B =0 ;

for f = 1 : NF 
    for c = 1 :NC
        m = IMhsv(f,c,1);
        
        if m >= matiz_R && m < matiz_G
            CONTEO_R = CONTEO_R + 1;
        end
        if m >= matiz_G && m < matiz_B
            CONTEO_G = CONTEO_G + 1 ;
        end
        if m >= matiz_B 
            CONTEO_B = CONTEO_B + 1; 
        end
    end
end
%una vez clasificados todos los puntos segun su matiz
respuestas = {'ROJO','VERDE', 'AZUL'};
conteos = [CONTEO_R,CONTEO_G, CONTEO_B  ];
pos = conteos >= max(conteos);
nombrecolorB = respuestas(pos);             

disp('Segun el metodo clasificar y contar es :')
disp(nombrecolorB )

respuesta = {nombrecolorA,char(nombrecolorB)};

end

