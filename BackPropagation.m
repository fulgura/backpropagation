classdef BackPropagation
    %% BACKPROPAGATION Implementacion de una red neuronal tipo
    %backpropagation
    %   Detailed explanation goes here
    
    properties
        P
        T
        CantidadPatrones
        CantidadAtributos
        
        FuncionOculta
        FuncionSalida
        Ocultas
        Salidas
    end
    
    methods
        %% Crea una nueva instancia de la red neuronal backpropagation
        function self = BackPropagation(P, T, FuncionOculta, FuncionSalida, Ocultas, Salidas)
            self.P = P;
            self.T = T;
            self.FuncionOculta = FuncionOculta ;
            self.FuncionSalida = FuncionSalida;
            self.Ocultas = Ocultas;
            self.Salidas = Salidas;
            
            [self.CantidadAtributos, self.CantidadPatrones] = size(self.P);
            
        end
        %% Procesa los datos con los que fu? creada: {P, T, FuncionOculta,
        % FuncionSalida, Ocultas, Salidas} con los par?metros necesarios
        % para poder correr la red:
        %
        % Alfa : Alfa utilizado para correr el algoritmo
        % CotaError
        % MAX_ITE
        %
        % Retorna los siguientes valores
        % W
        % b
        % iteracion
        
        function [W1 b1 W2 b2 iteracion AVGError] = Procesar(self, Alfa, CotaError, MAX_ITE)
            
            
            W1 = rand(self.Ocultas,self.CantidadAtributos) - 0.5 * ones(self.Ocultas,self.CantidadAtributos);
            b1 = rand(self.Ocultas,1) - 0.5 * ones(self.Ocultas,1);
            
            W2 = rand(self.Salidas,self.Ocultas) - 0.5 * ones(self.Salidas, self.Ocultas);
            b2 = rand(self.Salidas,1) - 0.5 * ones(self.Salidas,1);
            
            AVGError = 1;
            iteracion = 0;
            
            while ( AVGError > CotaError ) & ( iteracion <= MAX_ITE  )
                iteracion = iteracion + 1;
                AVGError = 0;
                for patr = 1:self.CantidadPatrones;
                    
                    % Calcular el error de c/u de las neuronas de salida
                    % Calcular el error de c/u de la neuronas ocultas
                    
                    respuesta_capa_oculta = W1 * self.P(:,patr) + b1;
                    f_activacion_respuesta_capa_oculta = feval(self.FuncionOculta, respuesta_capa_oculta);
                    
                    respuesta_capa_salida = W2 * f_activacion_respuesta_capa_oculta + b2;
                    f_activacion_respuesta_capa_salida = feval(self.FuncionSalida, respuesta_capa_salida);
                    
                    
                    % Multiplico por la derivada de la funcion de salida
                    ErrorSalida = (self.T(:,patr) - f_activacion_respuesta_capa_salida);
                    DeltaSalida = feval([ 'd' self.FuncionSalida], respuesta_capa_salida, f_activacion_respuesta_capa_salida).* ErrorSalida;
                    DeltaOculta = feval([ 'd' self.FuncionOculta], respuesta_capa_oculta, f_activacion_respuesta_capa_oculta).* (W2' * ErrorSalida);
                    
                    AVGError = AVGError + sum(ErrorSalida .^2);
                    
                    % actualizar los pesos (W y B)
                    W2 = W2 + Alfa * DeltaSalida * f_activacion_respuesta_capa_oculta';
                    b2 = b2 + Alfa * DeltaSalida;
                    
                    W1 = W1 + Alfa * DeltaOculta * self.P(:,patr)' ;
                    b1 = b1 + Alfa * DeltaOculta;
                    
                    
                end
                
                [iteracion AVGError];
            end
            
        end
        
    end
    %% Seccion para los m?todos de clase
    methods(Static)
        %% Evalua el resultado de un procesamieno y calcula la cantidad de
        % correctamente clasificados
        function [CantidadCorrectos] = CalcularResultados(P, T, W1, b1, W2, b2, FuncionOculta, FuncionSalida)
            
            [Entradas, CantPatrones] = size(P);
            
            NETA_OCULTA = (W1 * P) + b1 * ones(1, CantPatrones);
            F_NETA_OCULTA = feval(FuncionOculta, NETA_OCULTA);
            
            NETA_SALIDA = W2 * F_NETA_OCULTA + b2 * ones(1, CantPatrones);
            Y = feval(FuncionSalida, NETA_SALIDA);
            
            clases = feval(FuncionSalida, 'output');
            cant = length(clases);
            
            for index = 1:cant
                clase = clases(index);
                indices = Y >= (clase - 0.2) & Y <= (clase + 0.2);
                Y(indices) = clase;
            end
            
            %Calculo solo la cantidad de correctos
            correctos = T == 1;
            CantidadCorrectos = sum( Y(correctos) == 1);
        end
    end
    
    
end

