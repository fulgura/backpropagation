classdef Ejercicio2Helper
    
    %% EJERCICIO2HELPER Esta clase se encarga de armar diferentes necesidades
    % del ejercicio n?mero del trabajo pr?ctico
    %
    %   Una de sus tareas es la generaci?n de una matriz a partir del
    %   vector clase del conjunto de datos vinos, seg?n correponda con la
    %   funci?n a aplicar: logsig, tansig o purelin.
    
    
    properties
    end
    
    methods
    end
    
    methods(Static)
        %% Lee un archivo y retorna un dataset
        function [D] = LeerArchivo(filename)
            D = csvread(filename);
        end
        %% Lee un archivo y retorna desde 1 hasta CantFilas del dataset
        function [D] = LeerFilasArchivo(filename, CantFilas)
            D = csvread(filename);
            D = D(1:CantFilas,:);
        end
        %% Prepara Un conjunto de datos del dataset drug5.csv para que la clase
        % sea Tansig
        function [nuevaClase] = TransformarClase(CD, Funcion)
            
            modificador = min(feval(Funcion,'output'));
            
            nuevaClase = ones(CD.CantidadPatrones, 5) * modificador;
            for index = 1:CD.CantidadPatrones
                nuevaClase(index, CD.Clase(index)) = 1;
            end
            
        end
    end
end

