function tema4() 

IRGB = imread('Patrones.jpg');
%llama a la conversion recorriendo imagen completa 
tic;
conversion_completa( IRGB );
t = toc;
fprintf('Tiempo de conversion recorriendo toda la imagen:%f\n', t);

%llama a la conversion usando el patron 
tic;
conversion_patron( IRGB );
t = toc;
fprintf('Tiempo de conversion usando solo el patron:%f\n', t);

end


%funcion que realiza la conversion de la imagen completa
function conversion_completa(IRGB )
HSI = rgbtohsi(IRGB );
figure('Name','conversion recorriendo la imagen completa','NumberTitle','off');
imshow(HSI);
end

%funcion que realiza la conversion de sólo patron y luego lo concatena  en
%una misma matriz
function conversion_patron( IRGB )

PATRON = IRGB(1:57,:,:);
HPAT = rgbtohsi( PATRON );

HSIFINAL = cat(1, HPAT, HPAT, HPAT);
figure('Name','conversion usando el patron','NumberTitle','off');
imshow(HSIFINAL );

end 