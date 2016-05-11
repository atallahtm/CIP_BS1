function [ phmin,phplus] = phai1icip1(xxx,h)
%PHAI Summary of this function goes here
%   Detailed explanation goes here
% syms xx
phmin = xxx + 2*xxx^2/h + xxx^3/h^2;
phplus = xxx - 2*xxx^2/h + xxx^3/h^2;
end

