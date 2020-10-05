
function [e,ge, Je]=fonction_e(a, X, Y)
%e la valeur de l'ecart
%Je le gradient de e
%ge l'approxiamtion de la hessienne

F = ones(length(X), 1);

if (nargout == 1)
    F = fonction_f(0, a, X, Y);
    e = 1/2*(F')*F;
else
    [F, gradF] = fonction_f(a, X, Y)
    e = 1/2*(F')*F;
    Je = gradF'*F;
    ge = gradF'*gradF;
end

