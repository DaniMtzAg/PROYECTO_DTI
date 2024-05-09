function [result] = ntest(data,n)
%NTEST Summary of this function goes here
%   Detailed explanation goes here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Generación de los histogramas para las variables analizadas
% Análisis de la anisotropía fraccional
figure(1)
subplot(3,2,1) 
histogram(data.ad(:,2),n)
title('Sujetos con enfermedad de Alzheimer (EA)')
xlabel('Anisotropía fraccional')
ylabel('Frecuencia absoluta')
subplot(3,2,2)
histogram(data.cnad(:,2),n)
title('Controles del grupo con EA')
xlabel('Anisotropía fraccional')
ylabel('Frecuencia absoluta')
subplot(3,2,3)
histogram(data.dcl(:,2),n)
title('Sujetos con deterioro cognitivo leve (DCL)')
xlabel('Anisotropía fraccional')
ylabel('Frecuencia absoluta')
subplot(3,2,4)
histogram(data.cndcl(:,2),n)
title('Controles del grupo con DCL')
xlabel('Anisotropía fraccional')
ylabel('Frecuencia absoluta')
subplot(3,2,5)
histogram(data.por(:,2),n)
title('Grupo de portadores sanos')
xlabel('Anisotropía fraccional')
ylabel('Frecuencia absoluta')
subplot(3,2,6)
histogram(data.npor(:,2),n)
title('Grupo de no portadores sanos')
xlabel('Anisotropía fraccional')
ylabel('Frecuencia absoluta')

% Análisis de la difusividad media
figure(2)
subplot(3,2,1)
histogram(data.ad(:,1),n)
title('Sujetos con enfermedad de Alzheimer (EA)')
xlabel('Difusividad media')
ylabel('Frecuencia absoluta')
subplot(3,2,2)
histogram(data.cnad(:,1),n)
title('Controles del grupo con EA')
xlabel('Difusividad media')
ylabel('Frecuencia absoluta')
subplot(3,2,3)
histogram(data.dcl(:,1),n)
title('Sujetos con deterioro cognitivo leve (DCL)')
xlabel('Difusividad media')
ylabel('Frecuencia absoluta')
subplot(3,2,4)
histogram(data.cndcl(:,1),n)
title('Controles del grupo con DCL')
xlabel('Difusividad media')
ylabel('Frecuencia absoluta')
subplot(3,2,5)
histogram(data.por(:,1),n)
title('Grupo de portadores sanos')
xlabel('Difusividad media')
ylabel('Frecuencia absoluta')
subplot(3,2,6)
histogram(data.npor(:,1),n)
title('Grupo de no portadores sanos')
xlabel('Difusividad media')
ylabel('Frecuencia absoluta')

% Análisis de la difusividad axial
figure(3)
subplot(3,2,1)
histogram(data.ad(:,3),n)
title('Sujetos con enfermedad de Alzheimer (EA)')
xlabel('Difusividad axial')
ylabel('Frecuencia absoluta')
subplot(3,2,2)
histogram(data.cnad(:,3),n)
title('Controles del grupo con EA')
xlabel('Difusividad axial')
ylabel('Frecuencia absoluta')
subplot(3,2,3)
histogram(data.dcl(:,3),n)
title('Sujetos con deterioro cognitivo leve (DCL)')
xlabel('Difusividad axial')
ylabel('Frecuencia absoluta')
subplot(3,2,4)
histogram(data.cndcl(:,3),n)
title('Controles del grupo con DCL')
xlabel('Difusividad axial')
ylabel('Frecuencia absoluta')
subplot(3,2,5)
histogram(data.por(:,3),n)
title('Grupo de portadores sanos')
xlabel('Difusividad axial')
ylabel('Frecuencia absoluta')
subplot(3,2,6)
histogram(data.npor(:,3),n)
title('Grupo de no portadores sanos')
xlabel('Difusividad axial')
ylabel('Frecuencia absoluta')

% Análisis de la difusividad radial
figure(4)
subplot(3,2,1)
histogram(data.ad(:,4),n)
title('Sujetos con enfermedad de Alzheimer (EA)')
xlabel('Difusividad radial')
ylabel('Frecuencia absoluta')
subplot(3,2,2)
histogram(data.cnad(:,4),n)
title('Controles del grupo con EA')
xlabel('Difusividad radial')
ylabel('Frecuencia absoluta')
subplot(3,2,3)
histogram(data.dcl(:,4),n)
title('Sujetos con deterioro cognitivo leve (DCL)')
xlabel('Difusividad radial')
ylabel('Frecuencia absoluta')
subplot(3,2,4)
histogram(data.cndcl(:,4),n)
title('Controles del grupo con DCL')
xlabel('Difusividad radial')
ylabel('Frecuencia absoluta')
subplot(3,2,5)
histogram(data.por(:,4),n)
title('Grupo de portadores sanos')
xlabel('Difusividad radial')
ylabel('Frecuencia absoluta')
subplot(3,2,6)
histogram(data.npor(:,4),n)
title('Grupo de no portadores sanos')
xlabel('Difusividad radial')
ylabel('Frecuencia absoluta')

%% Pruebas de bondad de ajuste para determinar la normalidad en la distribución de las métricas para cada grupo analizado
% Determinación de los estadísticos de prueba para cada variable y cada
% grupo
T = zeros(6,4);
% Grupo de sujetos con enfermedad de Alzheimer
for k = 1:4
    T(1,k) =  kstest((data.ad(:,k) - mean(data.ad(:,k)))/std(data.ad(:,k)));
end
% Grupo de control para enfermedad de Alzheimer
for k = 1:4
    T(2,k) =  kstest((data.cnad(:,k) - mean(data.cnad(:,k)))/std(data.cnad(:,k)));
end
% Grupo de sujetos con deterioro cognitivo leve
for k = 1:4
    T(3,k) =  kstest((data.dcl(:,k) - mean(data.dcl(:,k)))/std(data.dcl(:,k)));
end
% Grupo de control para deterioro cognitivo leve
for k = 1:4
    T(4,k) =  kstest((data.cndcl(:,k) - mean(data.cndcl(:,k)))/std(data.cndcl(:,k)));
end
% Grupo de sujetos sanos portadores 
for k = 1:4
    T(5,k) =  kstest((data.por(:,k) - mean(data.por(:,k)))/std(data.por(:,k)));
end
% Grupo de sujetos sanos no portadores
for k = 1:4
    T(6,k) =  kstest((data.npor(:,k) - mean(data.npor(:,k)))/std(data.npor(:,k)));
end
% Prueba de las distribuciones a partir del valor de los estadísticos
% obtenidos

if sum(T) == 0
    result = "De acuerdo a la prueba Kolmogorov-Smirnov todas las variables\nde todos los grupos presentan una distribución aproximadamente\nnormal.";
else
    result = zeros(6,4);
    for k = 1:6
        for l = 1:4
            if T(k,l) == 1
                result(k,l) = 1;
            end
        end
    end
end

