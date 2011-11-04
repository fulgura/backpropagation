%% Inicializaci?n del workspace
clear
clear all
clc

%% Lectura de los datos de entrada: Archivos drugs.csv

CD = ConjuntoDatos(Ejercicio2Helper.LeerFilasArchivo('drug5.csv', 10), 1, 6, 7);
CD.Escalar;
CD.Clase
[Training Test] = CD.Separar(0.8);

claseTrainingTansig = Ejercicio2Helper.TransformarClase(Training, 'tansig')


