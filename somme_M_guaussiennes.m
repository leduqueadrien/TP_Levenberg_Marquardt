
function y=somme_M_gaussiennes(a,x)
  n = length(a)/3;
  y = 0;
  A = reshape(a, n, 3);
  X = repmat(x, n, 1);
  y = A(:,1)'*exp(-( (X-A(:,2))./A(:,3)).^2);
end