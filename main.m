% Análisis de la información de las métricas de difusividad en sujetos con riesgo genético para enfermedad de Alzheimer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% En este anáisis preliminar se obtendrán los estadísticos necesarios para realizar una prueba de hipótesis paramétrica 
% con respecto a la diferencia de medias poblacionales con varianzas desconocidas y diferentes para las distintas métricas 
% entre los grupos de estudio.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
close all
clear all
% Importación de los datos a partir del archivo de Excel que contiene los datos armonizados.
A = readtable('DATOS_FINALES_ARMONIZADOS.xlsx');

%% Función que genera las matrices para el análisis de los datos
[data] = dataprep(A);

%% Función que genera los histogramas y las pruebas de normalidad de las variables analizadas para cada uno de los grupos
[result] = ntest(data,15);
fprintf(result)