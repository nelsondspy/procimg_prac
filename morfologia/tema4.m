function tema4
I = im2bw( imread('binstars.bmp') );

Ic = ~I;
[L, num ] = bwlabel(Ic,4);
Radio = 10;

IM6P = 0 * Ic ;
IM4P = IM6P ;
IM5P = IM6P ;
IM3P = IM6P ;



for i=1:num
    [f,c ] = find(L==i);
   
    min_max_f  = min(f):max(f);
    min_max_c = min(c):max(c);
    EstrellaOrig = Ic( min_max_f  ,min_max_c );
    
    
    ESTR_HM  = bwmorph(EstrellaOrig,'thin',Inf);
 
    RE = ESTR_HM(Radio:end-Radio, Radio:end-Radio);
        
    CANTPUNTAS = (sum(sum(endpoints( RE ))));
    
    if CANTPUNTAS == 3 
        IM3P(min_max_f ,min_max_c) = EstrellaOrig;
    end
    if CANTPUNTAS == 6 
        IM6P(min_max_f ,min_max_c) = EstrellaOrig;
        
    end
    if CANTPUNTAS == 5 
        IM5P(min_max_f ,min_max_c) = EstrellaOrig;
    end
    if CANTPUNTAS == 4 
        IM4P(min_max_f ,min_max_c) = EstrellaOrig;
    end
    
end

IM6P = ~IM6P;
IM4P = ~IM4P ;
IM5P = ~IM5P ;
IM3P = ~IM3P ;

imshow(IM3P);figure; imshow(IM4P);figure;imshow(IM5P);figure ;imshow(IM6P);

end