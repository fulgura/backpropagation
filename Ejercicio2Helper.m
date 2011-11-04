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
        %% LeerArchivo
        % Lee un archivo pasado como par?metros y retorna un dataset
        % asociado.
        % filename: es el nombre del archivo utilizado para leer el dataset
        %
        % D : es la matriz dataset obtenida a partir del archivo
        function [D] = LeerArchivo(filename)
            D = csvread(filename);
        end
        %% LeerFilasArchivo
        % Lee un archivo pasado como par?metros y retorna un subset del dataset
        % asociado. Lee desde la primer fila hasta el n?mero de fila
        % indicado como par?metro.
        %
        % filename: es el nombre del archivo utilizado para leer el dataset
        % CantFilas : cantidad de filas que se deben leer del archivo.
        %
        % D : es la matriz dataset obtenida a partir del archivo
        function [D] = LeerFilasArchivo(filename, CantFilas)
            D = csvread(filename);
            D = D(1:CantFilas,:);
        end
        %% TransformarClase
        % Prepara un conjunto de datos del dataset drug5.csv para que la clase
        % sea Tansig o Logsig.
        %
        % CD : inatancia de la clase ConjunoDatos
        % Funcion : funcion utilzada para generar la nueva estructura de
        % clase.
        % 
        % nuevaClase : es una mattriz con unos o menos unos seg?n
        % corresponda en la ubicaci?n del n?mero de droga a aplicar.
        function [nuevaClase] = TransformarClase(CD, Funcion)
            
            modificador = min(feval(Funcion,'output'));
            
            nuevaClase = ones(CD.CantidadPatrones, 5) .* modificador;
            for index = 1:CD.CantidadPatrones
                nuevaClase(index, CD.Clase(index)) = 1;
            end
            
        end
    end
end

