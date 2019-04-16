%%codigo desenvolvido por Iaslan Nascimento
%

pkg load image
clear all 
close all 
x=1;
%criação do arquivo com os resultados 
C = "Comeco"
    saida = 'C:\Users\user\Documents\MATLAB\Projeto cacau 2\ResultadosPlated_White.csv';
    fid = fopen(saida,'a');
    fclose(fid);
    delete(saida);
    
    addpath(genpath('Functions'));
    fid = fopen(saida,'a');
    texto = ['ID' ,';', 'ALONGAMENTO',';','AREA',';','CIRCUNFERENCIA',';','COMPRIMENTO',';',...
        'DIAMETRO',';','DIAMETRO EQUIVALENTE',';','EXCENTRICIDADE',';','ESFERICIDADE',';',...
        'RAIO',';','\r\n'];
    texto = char(texto);
    fprintf(fid,texto);
    fclose(fid);
    %Leitura de imagens 
    
    for i=1:100
      im = imread(strcat('.\Imagens\Plated_White\','\',num2str(i),'.jpg'));
      
       imR = im(:,:,1);
         imBW = im2bw(imR);
         %funcoes
         %alongamento 
         al = descAlongamento(im);
         %area
         a = descArea(im);
         %circularidade
         ci = descCircularidade(imBW);
         %comprimento
         co = descComprimento(imBW);
         %diametro
         d = descDiametro(imBW);
         %diametro equivalente
         de = descDiametroEquiv(imBW);
         %diametro max de feret
         %excentricidade
         ex = descEcentricidade(imBW);
         %esfericidade
         esf = descEsfericidade(imBW);
         %raio
         r = descRaio(imBW);
         %conversao dos valores para string
         %identificador das sementes
         I = num2str(i);
         Al = num2str(al);
         A = num2str(a);
         CI = num2str(ci);
         CO = num2str(co);
         D = num2str(d);
         DE = num2str(de);
         EX = num2str(ex);
         ESF = num2str(esf);
         R = num2str(r);
         i
     fid = fopen(saida,'a');
     texto2 = [I ';',Al,';',A,';', CI,';',CO,';',D,';',DE,';',EX,';',ESF,';',R,';','\r\n'];
     texto2 = char(texto2);
     fprintf(fid,texto2);
     fclose(fid);
     x=x+1;
    endfor
T = "Fim"