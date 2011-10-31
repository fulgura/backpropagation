%% Inicializaci?n del workspace
clear
clear all
clc

%% Lectura de los datos de entrada: Archivos drugs.csv

CD = ConjuntoDatos(Ejercicio2Helper.LeerFilasArchivo('drug5.csv', 20), 1, 6, 7);
CD.Escalar;
[Training Test] = CD.Separar(0.8);


claseTansig = Ejercicio2Helper.TransformarClase(Training, 'tansig');

BP = BackPropagation(Training.Patrones', claseTansig', 'tansig', 'tansig', 4, 5);

BP.Procesar(0.3, 0.0001, 100)



