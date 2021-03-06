% Trabajo pr?ctico en clase.
%
%   Implementaci?n de Backpropagation
%
%
%

clear all;
clc;

P = [ -1 -1	1 1;
    -1 1 -1 1]
T = [ 0 1 1 0 ];
T2 = [-1 1 1 -1];

plotpv(P,T);


[Entradas, CantPatrones] = size(P);
Ocultas = 2;
Salidas = 1;

% probar varias combinaciones
% oculta ------ salida
% 
% tansig        purelin
% logsig        tansig
% purelin       logsig
% tansig        tansig
funcionOculta='tansig';
funcionSalida='purelin';

% Inicializar la red
w1 = rand(Ocultas,Entradas) - 0.5 * ones(Ocultas,Entradas);
b1 = rand(Ocultas,1) - 0.5 * ones(Ocultas,1);

w2 = rand(Salidas,Ocultas) - 0.5 * ones(Salidas, Ocultas);
b2 = rand(Salidas,1) - 0.5 * ones(Salidas,1);
% El plot exige que los w esten en la fila.
linea = plotpc(w1,b1);

% calculo del error
respuesta_capa_oculta = w1 * P + b1 * ones(1,CantPatrones);

funcion_activacion_aplicable_capa_oculta = feval ( funcionOculta, respuesta_capa_oculta );
salida_capa_final = w2 * funcion_activacion_aplicable_capa_oculta + b2; 

ErrorSalida = (T2 - salida_capa_final);
AVGError = sum(ErrorSalida .^2);

% Algoritmo

alfa = 0.02;
CotaError = 0.0001;
MAX_ITERA = 2000;
itera = 0;

while ( AVGError > CotaError ) & ( itera <= MAX_ITERA );
    

    for patr=1:CantPatrones;
    
        itera = itera + 1;
        % Calcular el error de c/u de las neuronas de salida
        respuesta_capa_oculta = w1*P(:,patr) + b1; % es el Y
        f_activacion_respuesta_capa_oculta = feval ( funcionOculta, respuesta_capa_oculta ); % f (Y)
        
        respuesta_capa_salida = w2 * f_activacion_respuesta_capa_oculta + b2;
        f_activacion_respuesta_capa_salida = feval ( funcionSalida, respuesta_capa_salida ); 
        
        % Calcular el error de c/u de la neuronas ocultas
        ErrorSalida = (T2(patr) - f_activacion_respuesta_capa_salida);
        
        DeltaOculta = feval ( [ 'd' funcionOculta ], respuesta_capa_oculta, f_activacion_respuesta_capa_oculta ) .* (w2' * ErrorSalida);
        DeltaSalida = ErrorSalida * feval ( [ 'd' funcionSalida ], respuesta_capa_salida, f_activacion_respuesta_capa_salida );
        
        % actualizar los pesos (W y B)
        w2 = w2 + alfa * DeltaSalida * f_activacion_respuesta_capa_oculta';
        b2 = b2 + alfa * DeltaSalida;
        
        w1 = w1 + alfa * DeltaOculta * P(:,patr)' ;
        b1 = b1 + alfa * DeltaOculta;
        
    end;
    % Graficar la recta
    
    linea = plotpc(w1,b1, linea); pause(0.01);    
    [itera AVGError]
    
end;