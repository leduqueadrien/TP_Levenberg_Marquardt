
function [a, iter, erreur] = LevenMarqu_Generique(X,Y,modele,M,epsilone,iterMax)
%LevenMarqu_Generique - Description
%
% Syntax: [a, iter, erreur] = LevenMarqu_Generique(X,Y,@modele,epsilone,iterMax)
%
% Long description


    plot(X,Y, '*')

    a = ones(3*M, 1);
    %a = (1:3*M)';
    n = length(a);
    lambda = 0.001;
    I = eye(n);
    iter = 0;

    [F, gradF] = feval(modele, a, X);
    Fa = F-Y;
    e = 1/2*norm(Fa)^2;
    Ge = gradF'*Fa;
    He = gradF'*gradF;
    while norm(Ge) >= epsilone && iter < iterMax
        d = (He+lambda*I)\(-Ge);
        [F, gradF] = feval(modele, a+d, X);
        Fa = F-Y; e2 = 1/2*norm(Fa)^2;

        if e2 < e
            lambda = lambda/10;
            a = a + d;
            e = e2; Ge = gradF'*Fa; He = gradF'*gradF;
        else
            lambda = 10 * lambda;
        end
        
        iter = iter + 1;
    end
    erreur = e;
    F =  feval(modele, a, X);
    hold on
    plot(X,F)
    Ge
end