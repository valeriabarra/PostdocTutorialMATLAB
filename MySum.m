function [ S ] = MySum( n )
% the body of the function here
S = 0;
for i=1:n
    S = S + i; % Note that every time the variable S is overwritten
end