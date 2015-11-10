function d2=DMaha(z,a,MCi) 
% z=[IM(f,c,1); IM(f,c,2); IM(f,c,3)]; 
% d2=DMaha(z,colormedio2,MCi); 
    
z=double(z)/255; 
a=double(a)/255; 
%d2=distancia al cuadrado 
d2=(z-a)'*MCi*(z-a);

end