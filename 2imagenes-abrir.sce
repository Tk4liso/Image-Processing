//Manipulación básica de imágenes, By A. Olvera 2022

clc;
clear; //limpiar todas las variables
a= uigetfile("*.*","select");  //abrir cuadro de diálogo
Im=imread(a);
Tam=size(Im);
if length(Tam)==3 then
    disp ('Imagen en color con dimensiones: ')
else
    disp ('Imagen en escala de gris con dimensiones: ')
end

disp(Tam);
imshow(Im);


input("Presiona Enter para continuar...");


//calcular negativo
Neg=imcomplement(Im)
//Neg=255-Im;
imshow(Neg);


input("Presiona Enter para continuar....");


//primero se convierte a grises y después se binariza

if length(Tam)==3 then
    ImG=rgb2gray(Im); //convertir a grises 
    imshow(ImG);
else
    ImG=Im;  //la imágen abierta ya estaba en grises
  
end

input("Presiona Enter para Binarizar");


//binarizar
Tresh=90; 

for i=1:Tam(1)
    for j=1:Tam(2)
        if (ImG(i,j)<=Tresh)
            x(i,j)=0;
        else
            x(i,j)=255;
        end
    end
end
imshow(x);


input("Presiona Enter para visualizar bordes");
//se aplica el detector de bordes Sobel
filtro=fspecial('sobel');
Bord=imfilter(ImG,filtro);
imshow(Bord);
input("Presiona Enter");


