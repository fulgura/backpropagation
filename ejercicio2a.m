%% Inicializaci?n del workspace
clear
clear all
clc

%% Lectura de los datos de entrada: Archivos drugs.csv

CD = ConjuntoDatos(Ejercicio2Helper.LeerFilasArchivo('drug5.csv', 10), 1, 6, 7);
CD.Escalar;

% CD.Datos
% CD.Patrones
%%CD.Clase

Ejercicio2Helper.TransformarClase(CD, 'tansig')
Ejercicio2Helper.TransformarClase(CD, 'logsig')


