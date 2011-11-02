classdef BackPropagation
    %% BACKPROPAGATION Implementacion de una red neuronal tipo
    %backpropagation
    %   Este objeto es la implementaci?n del algoritmo de backpropagation
    % utilizado para hacer predicciones en una red neuronal multiperceptr?n.
    
    %% Definici?n de propiedades
    properties
        %% Matriz de Patrones
        P
        %% Matriz con la clase (Para tansig o logsig)
        T
        %% Cantidad de Patrones que posee la matriz P
        CantidadPatrones
        %% Cantidad de atributos que posee la matriz P
        CantidadAtributos
        %% Funci?n utilizada para calcular la salida de la capa oculta
        % aplicada a los valores netos de la capa oculta.
        FuncionOculta
        %% Funci?n utilizada para calcular la salida de la capa de salida
        % aplicada a los valores netos de la capa de salida.
        FuncionSalida
        %% Cantidad de neuronas en la capa oculta
        Ocultas
        %% Cantidad de neuronas en la capa de salida
        Salidas
    end
    
    methods
        %% Crea una nueva instancia de la red neuronal multiperceptr?n que
        % procesa los patrones utilizando un algoritmo de backpropagation.
        %
        % P : es la matriz de patrones
        % T : es la matriz de clases
        % FuncionOculta : funci?n utilizada para calcular la salida de la
        % capa de oculta
        % FuncionSalida : funci?n utilizada para calcular la salida de la
        % capa de salida.
        % Ocultas:  Cantidad de neuronas a utilizar en la capa oculta
        % Salidas : Cantidad de neuronas a utilizar en la capa de salida
        function self = BackPropagation(P, T, FuncionOculta, FuncionSalida, Ocultas, Salidas)
            self.P = P;
            self.T = T;
            self.FuncionOculta = FuncionOculta ;
            self.FuncionSalida = FuncionSalida;
            self.Ocultas = Ocultas;
            self.Salidas = Salidas;
            
            [self.CantidadAtributos, self.CantidadPatrones] = size(self.P);
            
        end
        %% Procesar(...)
        %
        % Procesa los datos con los que fu? creada: 
        % {P, T, FuncionOculta, FuncionSalida, Ocultas, Salidas} 
        % con los par?metros necesarios para poder correr la red:
        %
        % Alfa : Alfa utilizado para correr el algoritmo
        % CotaError : Valor de la cota de error m?xima soportada
        % MAX_ITE : Cantidad m?xima de iteraciones que el algoritmo puede
        % realizar
        %
        % Valores de retorno:
        % W1 : ?ltimo vector de pesos obtenido para la capa oculta cuando 
        %      el algortimo haya finalizado de procesar 
        % b1 : ?ltimo bias obtenido para la capa oculta.
        % W2 : ?ltimo vector de pesos obtenido para la capa de salida cuando 
        %      el algortimo haya finalizado de procesar 
        % b2 : ?ltimo bias obtenido para la capa oculta.
        % iteracion : n?mero de la ?ltima iteraci?n realizada antes que 
        %             el algortimo haya finalizado de procesar 
        % AVGError : ?ltimo error promedio obtenido al procesar por 
        %            ?ltima vez los patrones antes que el algoritmo 
        %            haya finalizado de procesar.
        
        function [W1 b1 W2 b2 iteracion AVGError] = Procesar(self, Alfa, CotaError, MAX_ITE)
            
            
            W1 = rand(self.Ocultas,self.CantidadAtributos) - 0.5 * ones(self.Ocultas,self.CantidadAtributos);
            b1 = rand(self.Ocultas,1) - 0.5 * ones(self.Ocultas,1);
            
            W2 = rand(self.Salidas,self.Ocultas) - 0.5 * ones(self.Salidas, self.Ocultas);
            b2 = rand(self.Salidas,1) - 0.5 * ones(self.Salidas,1);
            
            AVGError = 1;
            iteracion = 0;
            
            while ( AVGError > CotaError ) & ( iteracion < MAX_ITE  )
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
        %% CalcularResultados
        % Evalua el resultado de un procesamieno y calcula la cantidad de
        % correctamente clasificados
        %
        % P : es la matriz de patrones
        % T : es la matriz de clases
        % W1 : ?ltimo vector de pesos obtenido para la capa oculta cuando 
        %      el algortimo haya finalizado de procesar 
        % b1 : ?ltimo bias obtenido para la capa oculta.
        % W2 : ?ltimo vector de pesos obtenido para la capa de salida cuando 
        %      el algortimo haya finalizado de procesar 
        % b2 : ?ltimo bias obtenido para la capa de salida.
        % FuncionOculta : funci?n utilizada para calcular la salida de la
        %                 capa de oculta
        % FuncionSalida : funci?n utilizada para calcular la salida de la
        %                 capa de salida.
        % 
        % Valores de retorno:
        % 
        % CantidadCorrectos : Cantidad de patrones correctamente
        %                     clasificados.
        function [CantidadCorrectos] = CalcularResultados(P, T, W1, b1, W2, b2, FuncionOculta, FuncionSalida)
            
            [Entradas, CantPatrones] = size(P);
            NETA_OCULTA = (W1 * P) + b1 * ones(1, CantPatrones);
            F_NETA_OCULTA = feval(FuncionOculta, NETA_OCULTA);
            
            NETA_SALIDA = W2 * F_NETA_OCULTA + b2 * ones(1, CantPatrones);
            Y = feval(FuncionSalida, NETA_SALIDA);
            
            falso = 0;
            verdadero = 1;
            if(strcmp(FuncionSalida,'tansig') > 0)
                falso = -1;
            end
            
            indices = Y >= (falso - 0.2) & Y <= (falso + 0.2);
            Y(indices) = falso;
            
            indices = Y >= (verdadero - 0.2) & Y <= (verdadero + 0.2);
            Y(indices) = verdadero;
            
            
            %Calculo solo la cantidad de correctos
            CantidadCorrectos = sum(all(Y == T,1));
        end
    end
    
    
end

