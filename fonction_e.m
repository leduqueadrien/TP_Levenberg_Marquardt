
function [e,Ge, He]=fonction_e(a, X, Y)
%e la valeur de l'ecart
%Ge le gradient de e
%He l'approxiamtion de la hessienne

F = ones(length(X), 1);

if (nargout == 1)
    F = fonction_f(a, X, Y);
    e = 1/2*norm(F);
else
    [F, gradF] = fonction_f(a, X, Y);
    e = 1/2*norm(F)^2;
    Ge = gradF'*F;
    He = gradF'*gradF;
end

