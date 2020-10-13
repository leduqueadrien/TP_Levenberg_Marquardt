
function [e,Ge, He]=fonction_e(a, X, Y)
%e la valeur de l'ecart
%Ge le gradient de e
%He l'approxiamtion de la hessienne
%gradF le gradient de F

if nargout == 1
    [F, gradF] = fonction_f(a,X);
    F = F - Y;
    e = 1/2*norm(F)^2;
end

if nargout > 1
    [F, gradF] = fonction_f(a,X);
    F = F - Y;
    e = 1/2*norm(F)^2;
    Ge = gradF'*F;
end


if nargout == 3
    He = gradF'*gradF;
end
