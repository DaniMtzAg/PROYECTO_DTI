function [test] = mdiftest(data,alpha)
%MDIFTEST Summary of this function goes here
%   Detailed explanation goes here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cálculo de las medias aritméticas de cada una de las variables para cada
% uno de los grupos de estudio
% Las medias están guardadas en una estructura cuyos campos corresponden a
% los grupos de estudio
% tamaños de muestra
n = [size(data.ad,1) size(data.cnad,1) size(data.dcl,1) size(data.cndcl,1) size(data.por,1) size(data.npor,1)];
% Medias aritméticas
medias = [mean(data.ad,1);mean(data.cnad);mean(data.dcl,1);mean(data.cndcl,1);mean(data.por,1);mean(data.npor,1)];
% Varianzas
varianzas = [var(data.ad,1);var(data.cnad);var(data.dcl,1);var(data.cndcl,1);var(data.por,1);var(data.npor,1)];
% Se obtiene una matriz que almacena las diferencias de medias entre los
% grupos de interés
mdif = zeros(3,4);
for k = 1:2:5
    for l = 1:4
        mdif(k,l) = medias(k,l) - medias((k + 1),l);
    end
end
%% Cálculo de los estadísticos de prueba
t_test = zeros(4,3);
for k = 1:4 % Representa las variables
    for l = 1:3 % Representa los pares de muestras
        t_test(k,l) = mdif(l,k)/sqrt((varianzas(l,k)/n(l)) + (varianzas(2*l,k)/n(2*l)));
    end
end
%% Cálculo de los valores críticos
% Grados de libertad para las funciones t-Student
t_val = zeros(4,3);
for k = 1:4
    for l = 1:3
        v = ((varianzas(l,k)/n(l)) + (varianzas(2*l,k)/n(2*l)))^2/((varianzas(l,k)/n(l))^2/(n(l) - 1) + ((varianzas(2*l,k)/n(2*l)))^2/(n(2*l) - 1));
        t_val(k,l) = tinv(1 - alpha,v);
    end
end
%% Matriz de resultados de la prueba
for k = 2:4
    for l = 1:3
        if t_test(k,l) > t_val(k,l)
            test{k*l} = "Existe evidencia estadísticamente suficiente para\ndeterminar que la %s del grupo %s\nes significativamente mayor que la del grupo %s";
        else
            test{k*l} = "No existe evidencia estadísticamente suficiente para\ndeterminar que la %s del grupo %s\nes significativamente mayor que la del grupo %s";
        end
    end
end
end

