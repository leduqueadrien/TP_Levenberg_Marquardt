tic
X = [0.01; 1.93; 2.95; 3.26; 4.18; 5.73; 6.29; 7.70; 8.91; 9.12];
Y = [0.98; 0.84; 0.80; 0.78; 0.82; 0.78; 0.80; 0.85; 0.90; 0.95];
X = [0.9;1.3;1.9;2.1;2.6;3.0;3.9;4.4;4.7;5.0;6.0;7.0;8.0;9.2;10.5;11.3;11.6;12.0;12.6;13.0;13.3];
Y = [1.3;1.5;1.85;2.1;2.6;2.7;2.4;2.15;2.05;2.1;2.25;2.3;2.25;1.95;1.4;0.9;0.7;0.6;0.5;0.4;0.25];
plot(X,Y, '*')

M = 3;
a = (1:3*M)';
epsilone = 0.01;
IterMax = 1000;
lambda = 0.001;
p = length(X);
n = length(a);
I = eye(n);
k = 0;


[e, Ge, He] = fonction_e(a, X, Y);
while norm(Ge) >= epsilone && iter < IterMax
	d = (He+lambda*I)\(-Ge);
	[e2, Ge2, He2] = fonction_e(a+d, X, Y);
	
	if e2 < e
		lambda = lambda/10;
		a = a + d;
        e = e2; Ge = Ge2; He = He2;
	else
		lambda = 10 * lambda;
	end

	k = k + 1;

end
hold on
plot(X, fonction_f(a,X))
norm(Ge)
toc