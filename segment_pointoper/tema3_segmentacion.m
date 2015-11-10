%Alumno : Nelson Durañona - 2da parcial 2014 Materia : PDI I
%Utiliza como base el codigo fuente proveido en clase por el profesor

IM=imread('rio.tif'); 
subplot(2,2,1);imshow( IM ); 

[nf nc c] = size(IM); 


%colormoda = [ 200 ; 200; 200 ]; 

%para hallar el color que aparece con mas frecuencia usamos los histogramas
%de cada canal , obtenemos las intensidades en la posicion con mayores repeticiones.
[Rocurr, Rint ]= imhist(IM(:,:,1));
[Gocurr, Gint ]= imhist(IM(:,:,2));
[Bocurr, Bint ]= imhist(IM(:,:,3));
Tocurr = Rocurr + Gocurr + Bocurr;
max_ocurr = max(Tocurr);
pos = find(Tocurr >= max_ocurr);
colormoda = [ Rint(pos); Gint(pos); Bint(pos)]; 


%matriz identidad para que la distancia de mahalanobis se comporte como
%distancia euclidea 
MC=[1 0 0;0 1 0;0 0 1]; 

MCi=inv(MC); 
IM2=IM; 

for f=1:nf 
    for c=1:nc 
        z=[IM(f,c,1); IM(f,c,2); IM(f,c,3)]; 
        d2=DMaha( z, colormoda , MCi ); 
        if d2>0.12, 
        IM2(f,c,:)=[0 0 0]; 
        end; 
    end; 
end; 
subplot(2,2,2);imshow(IM2); 
