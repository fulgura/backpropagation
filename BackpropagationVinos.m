% % Backpropagation usando el dataset de vinos
% 
%

clear all
clc

% datos = csvread('Vinos.csv');
% datos = mezclar(datos);
% 
% [CantPatrones, CantAtrib] = size(datos);
% 
% P = datos(:, 2:CantAtrib);
% T = datos(:, 1);

[P T CantPatrones CantAtrib] = leerDatos('Vinos.csv', true, 1, 2, 14);

P = P(1:10,1:12);
T = T(1:10,:);

P = P';

Ocultas = 4;
Salidas = 3;

Entradas = CantAtrib - 1;
T2 = ones(CantAtrib - 1, Salidas) .*(-1)
T2 = T2(T(1,:),:) 

funcionOculta='tansig';
funcionSalida='purelin';

% Inicializar la red
w1 = rand(Ocultas,Entradas) - 0.5 * ones(Ocultas,Entradas);
b1 = rand(Ocultas,1) - 0.5 * ones(Ocultas,1);

w2 = rand(Salidas,Ocultas) - 0.5 * ones(Salidas, Ocultas);
b2 = rand(Salidas,1) - 0.5 * ones(Salidas,1);









