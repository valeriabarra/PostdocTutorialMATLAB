function [S] = myExponentialSeries(n)
S=0; % The sum variable S starts out at 0
for k = 0 : n % Loop over values of k from 1 to n
    if mod(k,2) == 0 % if k is even, the next line is executed
        S = S + 1 / factorial(k);
    else % otherwise, k is odd, the following line is executed:
        S = S - 1 / factorial(k);
    end % end of “if” statement
end % end of the for loop
disp( ['for k=', num2str(k), ': the last partial sum equals ', num2str(S) ]); 
% Show only the result. the last partial sum
end

