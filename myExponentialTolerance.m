function [S] = myExponentialTolerance(tolerance)
S = 0; % The sum variable S starts out at 0
term = 1; % Set to high enough value
k = 0; % first term corresponds to k=0
sgn = 1; 
while abs(term) > tolerance % repeat until the next term is less than the 
                               % error tolerance
term = sgn / factorial(k); % calculate the next (k-th) term
S = S + term; % add k-th term to the sum variable S
k = k + 1; % increment summation index k (in a “for” loop, this is done 
               % automatically)
sgn = -sgn; % this assignment avoids the use of the "if-else" statement 
               % used in the previous exercise
end
disp( ['for k=', num2str(k-1), ': the last partial sum equals ', num2str(S) ]);
% Show the final result

% show that we reached the desired tolerance
fprintf(['And we have reched the desired tolerance because the next term '...
'would\n have been:%e. \n'],term); % Note: the three low dots serve to continue 
                              % any long matlab command in multiple lines
end

