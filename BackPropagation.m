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
        function obj = BackPropagation(P, T, FuncionOculta, FuncionSalida, Ocultas, Salidas)
            obj.P = P;
            obj.T = T;
            obj.FuncionOculta = FuncionOculta ;
            obj.FuncionSalida = FuncionSalida;
            obj.Ocultas = Ocultas;
            obj.Salidas = Salidas;
            
            [obj.CantidadPatrones, obj.CantidadAtributos] = size(obj.P);
            
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
        
        function [W1 b1 W2 b2 b iteracion] = Procesar(obj, Alfa, CotaError, MAX_ITE)
            
            
            W1 = rand(obj.Ocultas,obj.CantidadPatrones) - 0.5 * ones(obj.Ocultas,obj.CantidadPatrones);
            b1 = rand(obj.Ocultas,1) - 0.5 * ones(obj.Ocultas,1);
            
            W2 = rand(obj.Salidas,obj.Ocultas) - 0.5 * ones(obj.Salidas, obj.Ocultas);
            b2 = rand(obj.Salidas,1) - 0.5 * ones(obj.Salidas,1);
            
            AVGError = 1;
            iteracion = 0;
            
            while ( AVGError > CotaError ) & ( iteracion <= MAX_ITE  )
                iteracion = iteracion + 1;
                AVGError = 0;
                
                
            end
            
        end
    end
    
end

