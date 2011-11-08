function [ W1 b1 W2 b2 iteracion AVGError ] = BackPropagationProcesar( P, T, FuncionOculta, FuncionSalida, Ocultas, Salidas, Alfa, CotaError, MAX_ITE)
%BACKPROPAGATIONPROCESAR Summary of this function goes here
%   Detailed explanation goes here

[CantidadAtributos, CantidadPatrones] = size(P);

W1 = rand(Ocultas, CantidadAtributos) - 0.5 * ones(Ocultas, CantidadAtributos);
b1 = rand(Ocultas,1) - 0.5 * ones(Ocultas,1);

W2 = rand(Salidas, Ocultas) - 0.5 * ones(Salidas, Ocultas);
b2 = rand(Salidas,1) - 0.5 * ones(Salidas,1);

AVGError = 1;
iteracion = 0;

while ( AVGError > CotaError ) & ( iteracion < MAX_ITE  )
    
    iteracion = iteracion + 1;
    AVGError = 0;
    
    for patr = 1:CantidadPatrones;
        
        % Calcular el error de c/u de las neuronas de salida
        % Calcular el error de c/u de la neuronas ocultas
        
        respuesta_capa_oculta = W1 * P(:,patr) + b1;
        f_activacion_respuesta_capa_oculta = feval(FuncionOculta, respuesta_capa_oculta);
        
        respuesta_capa_salida = W2 * f_activacion_respuesta_capa_oculta + b2;
        f_activacion_respuesta_capa_salida = feval(FuncionSalida, respuesta_capa_salida);
        
        
        % Multiplico por la derivada de la funcion de salida
        ErrorSalida = (T(:,patr) - f_activacion_respuesta_capa_salida);
        DeltaSalida = feval([ 'd' FuncionSalida], respuesta_capa_salida, f_activacion_respuesta_capa_salida).* ErrorSalida;
        DeltaOculta = feval([ 'd' FuncionOculta], respuesta_capa_oculta, f_activacion_respuesta_capa_oculta).* (W2' * ErrorSalida);
        
        AVGError = AVGError + sum(ErrorSalida .^2);
        
        % actualizar los pesos (W y B)
        W2 = W2 + Alfa * DeltaSalida * f_activacion_respuesta_capa_oculta';
        b2 = b2 + Alfa * DeltaSalida;
        
        W1 = W1 + Alfa * DeltaOculta * P(:,patr)' ;
        b1 = b1 + Alfa * DeltaOculta;
        
        
    end
    
    [iteracion AVGError];
end
end

