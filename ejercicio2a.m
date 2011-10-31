%% Inicializaci?n del workspace
clear
clear all
clc

%% Lectura de los datos de entrada: Archivos drugs.csv

CD = ConjuntoDatos(Ejercicio2Helper.LeerFilasArchivo('drug5.csv', 100), 1, 6, 7);
CD.Escalar;
[Training Test] = CD.Separar(0.8);


claseTrainingTansig = Ejercicio2Helper.TransformarClase(Training, 'tansig');
claseTestTansig = Ejercicio2Helper.TransformarClase(Test, 'tansig');

BP = BackPropagation(Training.Patrones', claseTrainingTansig', 'tansig', 'tansig', 4, 5);

[W1 b1 W2 b2 iteracion AVGError] = BP.Procesar(0.3, 0.001, 100);


CantidadCorrectos = BackPropagation.CalcularResultados(BP.P, BP.T, W1, b1, W2, b2, BP.FuncionOculta, BP.FuncionSalida)
% CantidadCorrectos = BackPropagation.CalcularResultados(BP.P, BP.T, W1, b1, W2, b2, BP.FuncionOculta, BP.FuncionSalida)

