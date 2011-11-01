%% Inicializaci?n del workspace
clear
clear all
clc

%% Lectura de los datos de entrada: Archivos drugs.csv

CD = ConjuntoDatos(Ejercicio2Helper.LeerArchivo('drug5.csv'), 1, 6, 7);
CD.Escalar;

FuncionCapaOculta = 'logsig';
FuncionCapaSalida = 'tansig';

Alfa = 0.3;
CotaError = 0.000001;
MAX_ITER = 5000;

fprintf('indice,Alfa,CotaError,MAX_ITER,iteracion,FuncionCapaOculta,FuncionCapaSalida,CantidadCorrectosTraining,PorcentajeCorrectosTraining,CantidadCorrectosTest,PorcentajeCorrectosTest\n');

for indice = 1 : 5
    
    CD.Mezclar();
    [Training Test] = CD.Separar(0.8);
    claseTrainingTansig = Ejercicio2Helper.TransformarClase(Training, FuncionCapaSalida);
    claseTestTansig = Ejercicio2Helper.TransformarClase(Test, FuncionCapaSalida);
    
    BP = BackPropagation(Training.Patrones', claseTrainingTansig', FuncionCapaOculta, FuncionCapaSalida, 1, 5);
    
    [W1 b1 W2 b2 iteracion AVGError] = BP.Procesar(Alfa, CotaError, MAX_ITER);
    
    CantidadCorrectosTraining = BackPropagation.CalcularResultados(BP.P, BP.T, W1, b1, W2, b2, BP.FuncionOculta, BP.FuncionSalida);
    CantidadCorrectosTest = BackPropagation.CalcularResultados(Test.Patrones', claseTestTansig', W1, b1, W2, b2, BP.FuncionOculta, BP.FuncionSalida);
    
    fprintf('%d,%1.4f,%1.6f,%d,%d,%s,%s,%d,%1.4f,%d,%1.4f\n', indice,Alfa,CotaError,MAX_ITER,iteracion,FuncionCapaOculta,FuncionCapaSalida,CantidadCorrectosTraining,(CantidadCorrectosTraining/Training.CantidadPatrones), CantidadCorrectosTest, (CantidadCorrectosTest/Test.CantidadPatrones));
    
end


for indice = 1 : 5
    
    CD.Mezclar();
    [Training Test] = CD.Separar(0.8);
    claseTrainingTansig = Ejercicio2Helper.TransformarClase(Training, FuncionCapaSalida);
    claseTestTansig = Ejercicio2Helper.TransformarClase(Test, FuncionCapaSalida);
    
    BP = BackPropagation(Training.Patrones', claseTrainingTansig', FuncionCapaOculta, FuncionCapaSalida, 3, 5);
    
    [W1 b1 W2 b2 iteracion AVGError] = BP.Procesar(Alfa, CotaError, MAX_ITER);
    
    CantidadCorrectosTraining = BackPropagation.CalcularResultados(BP.P, BP.T, W1, b1, W2, b2, BP.FuncionOculta, BP.FuncionSalida);
    CantidadCorrectosTest = BackPropagation.CalcularResultados(Test.Patrones', claseTestTansig', W1, b1, W2, b2, BP.FuncionOculta, BP.FuncionSalida);
    
    fprintf('%d,%1.4f,%1.6f,%d,%d,%s,%s,%d,%1.4f,%d,%1.4f\n', indice,Alfa,CotaError,MAX_ITER,iteracion,FuncionCapaOculta,FuncionCapaSalida,CantidadCorrectosTraining,(CantidadCorrectosTraining/Training.CantidadPatrones), CantidadCorrectosTest, (CantidadCorrectosTest/Test.CantidadPatrones));
    
end


for indice = 1 : 5
    
    CD.Mezclar();
    [Training Test] = CD.Separar(0.8);
    claseTrainingTansig = Ejercicio2Helper.TransformarClase(Training, FuncionCapaSalida);
    claseTestTansig = Ejercicio2Helper.TransformarClase(Test, FuncionCapaSalida);
    
    BP = BackPropagation(Training.Patrones', claseTrainingTansig', FuncionCapaOculta, FuncionCapaSalida, 5, 5);
    
    [W1 b1 W2 b2 iteracion AVGError] = BP.Procesar(Alfa, CotaError, MAX_ITER);
    
    CantidadCorrectosTraining = BackPropagation.CalcularResultados(BP.P, BP.T, W1, b1, W2, b2, BP.FuncionOculta, BP.FuncionSalida);
    CantidadCorrectosTest = BackPropagation.CalcularResultados(Test.Patrones', claseTestTansig', W1, b1, W2, b2, BP.FuncionOculta, BP.FuncionSalida);
    
    fprintf('%d,%1.4f,%1.6f,%d,%d,%s,%s,%d,%1.4f,%d,%1.4f\n', indice,Alfa,CotaError,MAX_ITER,iteracion,FuncionCapaOculta,FuncionCapaSalida,CantidadCorrectosTraining,(CantidadCorrectosTraining/Training.CantidadPatrones), CantidadCorrectosTest, (CantidadCorrectosTest/Test.CantidadPatrones));
    
end



for indice = 1 : 5
    
    CD.Mezclar();
    [Training Test] = CD.Separar(0.8);
    claseTrainingTansig = Ejercicio2Helper.TransformarClase(Training, FuncionCapaSalida);
    claseTestTansig = Ejercicio2Helper.TransformarClase(Test, FuncionCapaSalida);
    
    BP = BackPropagation(Training.Patrones', claseTrainingTansig', FuncionCapaOculta, FuncionCapaSalida, 7, 5);
    
    [W1 b1 W2 b2 iteracion AVGError] = BP.Procesar(Alfa, CotaError, MAX_ITER);
    
    CantidadCorrectosTraining = BackPropagation.CalcularResultados(BP.P, BP.T, W1, b1, W2, b2, BP.FuncionOculta, BP.FuncionSalida);
    CantidadCorrectosTest = BackPropagation.CalcularResultados(Test.Patrones', claseTestTansig', W1, b1, W2, b2, BP.FuncionOculta, BP.FuncionSalida);
    
    fprintf('%d,%1.4f,%1.6f,%d,%d,%s,%s,%d,%1.4f,%d,%1.4f\n', indice,Alfa,CotaError,MAX_ITER,iteracion,FuncionCapaOculta,FuncionCapaSalida,CantidadCorrectosTraining,(CantidadCorrectosTraining/Training.CantidadPatrones), CantidadCorrectosTest, (CantidadCorrectosTest/Test.CantidadPatrones));
    
end



