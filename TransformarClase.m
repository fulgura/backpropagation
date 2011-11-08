%% TransformarClase
% Prepara un conjunto de datos del dataset drug5.csv para que la clase
% sea Tansig o Logsig.
%
%
function [nuevaClase] = TransformarClase(CantidadPatrones, Clase, Funcion)

modificador = min(feval(Funcion,'output'));

nuevaClase = ones(CantidadPatrones, 5) .* modificador;
for index = 1:CantidadPatrones
    nuevaClase(index, Clase(index)) = 1;
end

end
