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
function [CantidadCorrectos] = BackPropagationCalcularResultados(P, T, W1, b1, W2, b2, FuncionOculta, FuncionSalida)

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
