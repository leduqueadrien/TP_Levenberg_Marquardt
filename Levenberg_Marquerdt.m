
X = [0.01; 1.93; 2.95; 3.26; 4.18; 5.73; 6.29; 7.70; 8.91; 9.12];
Y = [0.98; 0.84; 0.80; 0.78; 0.82; 0.78; 0.80; 0.85; 0.90; 0.95];
M = 6;
a = ones(M*3,1);
epsilone = 0.01;
IterMax = 100;
lambda = 0.001;
n = length(a);
I = eye(n);
k = 0;

[e, Ge, He] = fonction_e(a, X, Y)
while norm(Ge) >= epsilone && k <= IterMax
	d = (He+lambda*I)\(-Ge);
	[e2, Ge2, He2] = fonction_e(a+d, X, Y)
	
	if e2 < e
		lambda = lambda/10;
		a = a + d;
        e = e2;
		Ge = Ge2;
		He2 = He;
	else
		lambda = 10 * lambda;
	end

	k = k + 1;
end
k