function [ fi] = inner1icip1( xi,h,ff1)
%INNER Summary of this function goes here
%   Detailed explanation goes here
syms xx
ff = subs(ff1,xx);
[phmini,phplusi] = phai1icip1((xx-xi),h);
fi = int(phmini*ff,xx,xi-h,xi) + int(phplusi*ff,xx,xi,xi+h);
end

