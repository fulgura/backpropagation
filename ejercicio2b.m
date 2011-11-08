%% Inicializaci?n del workspace
clear
clear all
clc

%% Lectura de los datos de entrada: Archivos drugs.csv
% CD = ConjuntoDatos(Ejercicio2Helper.LeerArchivo('drug5.csv'), 1, 6, 7);

DatosOriginales = csvread('drug5.csv');
ColumnaDesdeAtributos = 1;
ColumnaHastaAtributos = 6;
ColumnaClase = 7;

[CantidadPatrones, CantidadAtributos] = size(DatosOriginales);

%% CD.Escalar;
for index=ColumnaDesdeAtributos:ColumnaHastaAtributos
    minimo = min(DatosOriginales(:, index));
    maximo = max(DatosOriginales(:, index));
    DatosOriginales(:,index) = ((DatosOriginales(:,index) - minimo) ./ (maximo - minimo));
end
FuncionCapaOculta = 'logsig';
FuncionCapaSalida = 'tansig';

Alfa = 0.3;
CotaError = 0.000001;
MAX_ITER = 5000;

fprintf('indice,Alfa,CotaError,MAX_ITER,iteracion,FuncionCapaOculta,FuncionCapaSalida,CantidadCorrectosTraining,PorcentajeCorrectosTraining,CantidadCorrectosTest,PorcentajeCorrectosTest\n');

for indice = 1 : 5
    
    %% CD.Mezclar();
    Datos = DatosOriginales;
    mezcla = randperm(CantidadPatrones);
    Datos = Datos(mezcla,:);
 
    %% [Training Test] = CD.Separar(0.8);
    porcentaje = 0.8;
    sizeM = size(Datos);
    CantPatrones = sizeM(1);
    n = floor(CantPatrones*porcentaje);
    
    Training = Datos(1:n,:);
    sizeTraining = size(Training);
    TrainingCantidadPatrones = sizeTraining(1);
    TrainingPatrones = Training(:,1:6);
    
    Test = Datos((n+1):CantPatrones,:);
    sizeTest = size(Test);
    TestCantidadPatrones = sizeTest(1);
    TestPatrones = Test(:,1:6);
       
    %% Transformacion de la clase
    claseTrainingTansig = TransformarClase(TrainingCantidadPatrones, Training(:,7), FuncionCapaSalida);
    claseTestTansig = TransformarClase(TestCantidadPatrones, Test(:,7), FuncionCapaSalida);
    
    %% BP = BackPropagation(TrainingPatrones', claseTrainingTansig', FuncionCapaOculta, FuncionCapaSalida, 4, 5);
    [W1 b1 W2 b2 iteracion AVGError] = BackPropagationProcesar(TrainingPatrones', claseTrainingTansig', FuncionCapaOculta, FuncionCapaSalida, 1, 5, Alfa, CotaError, MAX_ITER);
    
    CantidadCorrectosTraining = BackPropagationCalcularResultados(TrainingPatrones', claseTrainingTansig', W1, b1, W2, b2, FuncionCapaOculta, FuncionCapaSalida);
    CantidadCorrectosTest = BackPropagationCalcularResultados(TestPatrones', claseTestTansig', W1, b1, W2, b2, FuncionCapaOculta, FuncionCapaSalida);
    
    fprintf('%d,%1.4f,%1.6f,%d,%d,%s,%s,%d,%1.4f,%d,%1.4f\n', indice,Alfa,CotaError,MAX_ITER,iteracion,FuncionCapaOculta,FuncionCapaSalida,CantidadCorrectosTraining,(CantidadCorrectosTraining/TrainingCantidadPatrones), CantidadCorrectosTest, (CantidadCorrectosTest/TestCantidadPatrones));    

end


for indice = 1 : 5
    
    %% CD.Mezclar();
    Datos = DatosOriginales;
    mezcla = randperm(CantidadPatrones);
    Datos = Datos(mezcla,:);
 
    %% [Training Test] = CD.Separar(0.8);
    porcentaje = 0.8;
    sizeM = size(Datos);
    CantPatrones = sizeM(1);
    n = floor(CantPatrones*porcentaje);
    
    Training = Datos(1:n,:);
    sizeTraining = size(Training);
    TrainingCantidadPatrones = sizeTraining(1);
    TrainingPatrones = Training(:,1:6);
    
    Test = Datos((n+1):CantPatrones,:);
    sizeTest = size(Test);
    TestCantidadPatrones = sizeTest(1);
    TestPatrones = Test(:,1:6);
       
    %% Transformacion de la clase
    claseTrainingTansig = TransformarClase(TrainingCantidadPatrones, Training(:,7), FuncionCapaSalida);
    claseTestTansig = TransformarClase(TestCantidadPatrones, Test(:,7), FuncionCapaSalida);
    
    %% BP = BackPropagation(TrainingPatrones', claseTrainingTansig', FuncionCapaOculta, FuncionCapaSalida, 4, 5);
    [W1 b1 W2 b2 iteracion AVGError] = BackPropagationProcesar(TrainingPatrones', claseTrainingTansig', FuncionCapaOculta, FuncionCapaSalida, 3, 5, Alfa, CotaError, MAX_ITER);
    
    CantidadCorrectosTraining = BackPropagationCalcularResultados(TrainingPatrones', claseTrainingTansig', W1, b1, W2, b2, FuncionCapaOculta, FuncionCapaSalida);
    CantidadCorrectosTest = BackPropagationCalcularResultados(TestPatrones', claseTestTansig', W1, b1, W2, b2, FuncionCapaOculta, FuncionCapaSalida);
    
    fprintf('%d,%1.4f,%1.6f,%d,%d,%s,%s,%d,%1.4f,%d,%1.4f\n', indice,Alfa,CotaError,MAX_ITER,iteracion,FuncionCapaOculta,FuncionCapaSalida,CantidadCorrectosTraining,(CantidadCorrectosTraining/TrainingCantidadPatrones), CantidadCorrectosTest, (CantidadCorrectosTest/TestCantidadPatrones));    
    
end


for indice = 1 : 5
    
    %% CD.Mezclar();
    Datos = DatosOriginales;
    mezcla = randperm(CantidadPatrones);
    Datos = Datos(mezcla,:);
 
    %% [Training Test] = CD.Separar(0.8);
    porcentaje = 0.8;
    sizeM = size(Datos);
    CantPatrones = sizeM(1);
    n = floor(CantPatrones*porcentaje);
    
    Training = Datos(1:n,:);
    sizeTraining = size(Training);
    TrainingCantidadPatrones = sizeTraining(1);
    TrainingPatrones = Training(:,1:6);
    
    Test = Datos((n+1):CantPatrones,:);
    sizeTest = size(Test);
    TestCantidadPatrones = sizeTest(1);
    TestPatrones = Test(:,1:6);
       
    %% Transformacion de la clase
    claseTrainingTansig = TransformarClase(TrainingCantidadPatrones, Training(:,7), FuncionCapaSalida);
    claseTestTansig = TransformarClase(TestCantidadPatrones, Test(:,7), FuncionCapaSalida);
    
    %% BP = BackPropagation(TrainingPatrones', claseTrainingTansig', FuncionCapaOculta, FuncionCapaSalida, 4, 5);
    [W1 b1 W2 b2 iteracion AVGError] = BackPropagationProcesar(TrainingPatrones', claseTrainingTansig', FuncionCapaOculta, FuncionCapaSalida, 5, 5, Alfa, CotaError, MAX_ITER);
    
    CantidadCorrectosTraining = BackPropagationCalcularResultados(TrainingPatrones', claseTrainingTansig', W1, b1, W2, b2, FuncionCapaOculta, FuncionCapaSalida);
    CantidadCorrectosTest = BackPropagationCalcularResultados(TestPatrones', claseTestTansig', W1, b1, W2, b2, FuncionCapaOculta, FuncionCapaSalida);
    
    fprintf('%d,%1.4f,%1.6f,%d,%d,%s,%s,%d,%1.4f,%d,%1.4f\n', indice,Alfa,CotaError,MAX_ITER,iteracion,FuncionCapaOculta,FuncionCapaSalida,CantidadCorrectosTraining,(CantidadCorrectosTraining/TrainingCantidadPatrones), CantidadCorrectosTest, (CantidadCorrectosTest/TestCantidadPatrones));    
    
end

for indice = 1 : 5
    
    %% CD.Mezclar();
    Datos = DatosOriginales;
    mezcla = randperm(CantidadPatrones);
    Datos = Datos(mezcla,:);
 
    %% [Training Test] = CD.Separar(0.8);
    porcentaje = 0.8;
    sizeM = size(Datos);
    CantPatrones = sizeM(1);
    n = floor(CantPatrones*porcentaje);
    
    Training = Datos(1:n,:);
    sizeTraining = size(Training);
    TrainingCantidadPatrones = sizeTraining(1);
    TrainingPatrones = Training(:,1:6);
    
    Test = Datos((n+1):CantPatrones,:);
    sizeTest = size(Test);
    TestCantidadPatrones = sizeTest(1);
    TestPatrones = Test(:,1:6);
       
    %% Transformacion de la clase
    claseTrainingTansig = TransformarClase(TrainingCantidadPatrones, Training(:,7), FuncionCapaSalida);
    claseTestTansig = TransformarClase(TestCantidadPatrones, Test(:,7), FuncionCapaSalida);
    
    %% BP = BackPropagation(TrainingPatrones', claseTrainingTansig', FuncionCapaOculta, FuncionCapaSalida, 4, 5);
    [W1 b1 W2 b2 iteracion AVGError] = BackPropagationProcesar(TrainingPatrones', claseTrainingTansig', FuncionCapaOculta, FuncionCapaSalida, 7, 5, Alfa, CotaError, MAX_ITER);
    
    CantidadCorrectosTraining = BackPropagationCalcularResultados(TrainingPatrones', claseTrainingTansig', W1, b1, W2, b2, FuncionCapaOculta, FuncionCapaSalida);
    CantidadCorrectosTest = BackPropagationCalcularResultados(TestPatrones', claseTestTansig', W1, b1, W2, b2, FuncionCapaOculta, FuncionCapaSalida);
    
    fprintf('%d,%1.4f,%1.6f,%d,%d,%s,%s,%d,%1.4f,%d,%1.4f\n', indice,Alfa,CotaError,MAX_ITER,iteracion,FuncionCapaOculta,FuncionCapaSalida,CantidadCorrectosTraining,(CantidadCorrectosTraining/TrainingCantidadPatrones), CantidadCorrectosTest, (CantidadCorrectosTest/TestCantidadPatrones));    
    
end



