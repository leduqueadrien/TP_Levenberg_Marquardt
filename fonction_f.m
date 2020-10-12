
function [F, gradF]=fonction_f(a, X)
%F valeur de la fonction f
%gradF gradient de la fonction f

p = length(X);
n = length(a);
M = n/3;

F = ones(p, 1);
A = reshape(a, 3, M);
x = (X(:,ones(M, 1)))';    %copie de la premiere ligne m fois
A1 = A(1,:)';
A1 = A1(:,ones(1,p));   %copie de la premiere colonne n fois
A2 = A(2,:)';
A2 = A2(:,ones(1,p));
A3 = A(3,:)';
A3 = A3(:,ones(1,p));
tmp1 = (x-A2)./A3;
tmp2 = exp(-tmp1.^2);
F = sum(A1.*tmp2)';

if nargout > 1
    gradF = ones(p,n);
    gradF(:,1:3:n-2) = tmp2';
    gradF(:,2:3:n-1) = (2 * tmp1.*A1./A3.* tmp2)';
    gradF(:,3:3:n) = (2 * A1./ A3 .* tmp1.^2 .* tmp2)';
end

