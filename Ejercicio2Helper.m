classdef Ejercicio2Helper
    
    %EJERCICIO2HELPER Esta clase se encarga de armar diferentes necesidades
    %del ejercicio n?mero del trabajo pr?ctico
    %
    %   Una de sus tareas es la generaci?n de una matriz a partir del
    %   vector clase del conjunto de datos vinos, seg?n correponda con la
    %   funci?n a aplicar: logsig, tansig o purelin.
    
    
    properties
    end
    
    methods
    end
    
    methods(Static)
        function [T] = TransformarClaseATansig(ConjuntoDatos)
            
            T = ConjuntoDatos.Clase;
        end
    end
    
    
end

