


function [F, gradF]=fonction_f(a, X, Y)
%F valeur de la fonction f
%gradF gradient de la fonction f

n = length(X);
F = ones(length(X), 1);
gradF = ones(n, length(a));


n = 3;
M = 2;

A = reshape(a, 3, M)';
F = (x(:,ones(M, 1))' - A(:,2*ones(n, 1)) )./ (A(:,3*ones(n, 1)))
F = (A(:,1)'*exp(-F.^2))'
F = F - Y
e = 1/2*norm(F)^2




if (nargout == 1)
    for i = 1:length(X)
        F(i) = somme_guaussiennes(a, X(i)) - Y(i);
    end
else
    for i = 1:n
        [sg, gsg] = somme_guaussiennes(a, X(i));
        F(i) = sg - Y(i);
        gradF(i,:) = gsg;
    end
end

