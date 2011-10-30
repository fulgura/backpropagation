%% Inicializaci?n del workspace
clear
clear all
clc

%% Lectura de los datos de entrada: Archivos drugs.csv

CD = ConjuntoDatos(csvread('drug5.csv'), 1, 6, 7);
CD.Escalar;

CD.Datos
