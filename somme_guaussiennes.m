

function [sg, gradsg]=somme_guaussiennes(a, x)
%sg valeur en 1 point de la fonction somme guaussiennes
%gsg gradient selon a
M = length(a)/3;
A = reshape(a, 3, M)';
X = repmat(x, M, 1);

sg = A(:,1)'*exp(-( (X-A(:,2))./A(:,3)).^2);
if (nargout == 1)
    return;
end


gradsg = ones(M*3, 1);
for l=1:M
    gradsg(3*l-2) = exp(-((x-a(3*l-1))/a(3*l))^2);
    gradsg(3*l-1) = gradsg(3*l-2) * 2*a(3*l-2)*(x-a(3*l-1))/(a(3*l)^2);
    gradsg(3*l) = gradsg(3*l-1) * (x-a(3*l-1))/a(3*l);
end
