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
        
        function [W1 b1 W2 b2 b iteracion] = Procesar(self, Alfa, CotaError, MAX_ITE)
            
            
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
                    
                    neta_oculta = W1 * self.P(:,patr) + b1;
                    f_neta_oculta = feval(self.FuncionOculta, neta_oculta);
                    
                    
                    neta_salida = W2 * f_neta_oculta + b2;
                    f_neta_salida = feval(self.FuncionSalida, neta_salida);
                    
                    
                    
                end
                
            end
            
        end
    end
    
end

