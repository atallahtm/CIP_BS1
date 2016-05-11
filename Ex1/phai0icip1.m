function [ phmin,phplus] = phai0icip1(xxx,h)
%PHAI Summary of this function goes here
%   Detailed explanation goes here
% syms xx
phmin = 1 - 3*xxx^2/h^2 -2*xxx^3/h^3;
phplus = 1 - 3*xxx^2/h^2 +2*xxx^3/h^3;
end

