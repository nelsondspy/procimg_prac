function tema5()
IM = imread('futbol.jpg');
subplot(2,2,1);imshow(IM); 
title('Imagen Original'); 
[NF, NC, c]=size(IM); 

%llama a la funcion que selecciona  y devuelve los valores de los 
%puntos seleccionados y el valor medio 
[RSEL,GSEL,BSEL, VALMED] = seleciona_puntos( IM );

centroEsfera = VALMED;


MC = [1 0 0;0 1 0;0 0 1]; 
MCi=inv(MC); 
IM2=IM; 

%llama a la funcion que calcula el radio usando la misma formul distancia 
% de mahalanobis
RADIO = calcular_radio(RSEL,GSEL,BSEL, centroEsfera, MCi );
disp('RADIO') ; disp(RADIO);


disp('Espere unos segundos mientras se aplica el filtro esférico de color...'); 
for f=1:NF 
    for c=1:NC
        
        z=[IM(f,c,1); IM(f,c,2); IM(f,c,3)]; 
        
        %calcula la distancia
        d2 = DMaha(z , centroEsfera , MCi); 
        
        %si queda fuera de la esferas % anteriormente 0.12
        if d2 > RADIO, 
            IM2(f,c,:)=[0 0 0]; 
        end 
    end
end
subplot(2,2,2);imshow(IM2); 
title('Filtro Distancia Euclidiana'); 

end 

%funcion que retorna los puntos seleccionados y el valor
%medio 
function [ RM, GM, BM , VALMED] = seleciona_puntos( IM )
POINTS = input('Seleccione X puntos de color representativos para el filtro...');
RM=[];GM=[] ;BM=[];

for f=1:POINTS
     [x , y]=ginput(1);
     x=round(x); 
     y=round(y);
     
     RM = [ RM, IM(y,x,1) ];
     GM=  [ GM , IM(y,x,2) ];
     BM = [ BM , IM(y,x,3)]  ;
          
end 
 VALMED = [ round(mean(RM)) ; round(mean(GM)); round(mean(BM)) ]; 
 disp(VALMED);
 
end

%funcion que calcula el menor radio que contiene a todos los puntos 
%El radio empieza con el valor minimo que es 0 , luego empieza a
%expandirse para atrapar a mas puntos, sólo lo necesario para contener
%a todos los puntos

function RADIO = calcular_radio(R,G,B, puntocom , MCi )
    N = size(R , 2 ); %cantidad de puntos elegidos
    
    RADIO = 0 ;
    disp('puntocom' );disp(puntocom );
    for i = 1:N
    
        aux = DMaha( [R(i);G(i);B(i)]  , puntocom , MCi); 
        if aux > RADIO
            RADIO = aux;
        end
    end    
    
end