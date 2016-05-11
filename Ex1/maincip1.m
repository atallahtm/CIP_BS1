%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                   Numerical solution of 1D Poisson equation  
%                           y'' + 4*y = 4*x^2 + 2
%                        BC y(0) = 0, y(1) = 1
%                        Exact solution y = x^2 
%                       by CIP-BS1 method
%                    coded by Atallah Elshenawy 2016.4.2
%                     
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Refs:
% [1] Utsumi, T., Yabe, T., Koga, J., Aoki, T., Sekine, M. "Accurate basis set
%     by the CIP method for the solutions of the Schr?dinger equation" 
%       Comput. Phys. Comm. 157 (2004): 121–138
% [2] DOI:10.1016/S0010-4655(03)00496-X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all  %#ok<CLSCR>
close all
% format long
format short 
syms xxx
ff = 4*xxx^2 +2;
%% trial data
n = 10;
a = 0;
b = 1;
h = (b-a)/n; 
%% Enter the knot sequences
x = linspace(a,b,n+1);
%% Boundary conditions
a1 = 0; % at f(a)= a1
b1 = 1; % at f(b) = b1
%% compose matrix of R.H.S.
f1 = zeros(n+1,1);
f2 = zeros(n+1,1);
for  i = 2:n
 f1(i) = inner0icip1(x(i),h,ff); 
end
[phmin,phplus] = phai0icip1(xxx,h);
phpmin2        = subs(phmin,xxx,(xxx-b));
f1(1)          = int(phplus*(ff),xxx,a,a+h);
f1(n+1)        = int(phpmin2*(ff),xxx,b-h,b);
for  i = 2:n
 f2(i) = inner1icip1(x(i),h,ff); 
end
[phmin,phplus] = phai1icip1(xxx,h);
phpmin2        = subs(phmin,xxx,(xxx-b));
f2(1)          = int(phplus*(ff),xxx,a,a+h);
f2(n+1)        = int(phpmin2*(ff),xxx,b-h,b);
f = [f1 ; f2]; 
%% the coeff matrix
[ ph00, ph01, ph10, ph11, phdash00, phdash01, phdash10, phdash11,...
    ph2dash00, ph2dash01, ph2dash10, ph2dash11] =...
    matriciescip1( n,h );
A00 = ph2dash00 + 4*ph00;
A01 = ph2dash01 + 4*ph01;
A10 = ph2dash10 + 4*ph10;
A11 = ph2dash11 + 4*ph11;
AA  = [A00 A01; A10 A11];
 %% Exact
Exactcip1 = zeros(n+1,1);
Exactdashcip1= zeros(n+1,1);
for i = 1:n+1
   Exactcip1(i) = (x(i))^2; 
   Exactdashcip1(i) = 2*x(i);
end
%% Error
coeffcip1 = AA\f; 
%% Plot two figures
plot(x,Exactcip1,'-ro',x,coeffcip1(1:n+1),'-.b')
h = legend('Exact','Approximate',2);
set(h,'Interpreter','none')
error = max(abs(Exactcip1-coeffcip1(1:n+1)))
errordash = max(abs(Exactdashcip1-coeffcip1(n+2:2*n+2)))
figure(2)
plot(abs(Exactcip1-coeffcip1(1:n+1)))
