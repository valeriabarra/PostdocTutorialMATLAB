%% Postdoc Tutorial: MATLAB
% Instructor: Valeria Barra
%%
% Friday 12/06/19

%% Introduction

clear all; close all

% our very first displayed string
disp('Hello World!')

% you can also concatenate strings by separating them by commas and
% enclosing in brackets
disp(['Hello ','World ','again!'])

% you can also concatenate numerical values and strings
my_name = 'Valeria'; % if you forget the ";" you will display the value of the variable
disp(['Hello, my name is ',my_name,' and I am ',num2str(32),' years old'])

% fprintf allows you to specify the format
fprintf('X is %4.2f meters or %8.2f mm\n',12.34,1234)

%% Arrays and Matrices

A = [1 2 3]; % a row-array that stores the numbers 1, 2, 3 
             % (the entries in each row can also be separated by commas).
             % Spaces before and after the equal sign are not considered, nor necessary

B = [4; 5; 6]; % a column-array that stores the numbers 4, 5, 6

a2 = A(2); % it assigns the second entry of the array A to the variable a2

D = [1 2 3; 4 5 6]; % a 2 x 3 matrix called D

E(1,2) = D(2,3); % it references the second row and third column entry of the
                 % matrix D and assigns it to the first row and second column of the matrix E

F = 1:10; % it creates an array of integers equally spaced (the default spacing is 1)
          % and assigns it to the variable F
G(1,2:11) = F; % it assigns the array F to the first row of G, from the second to
               % the eleventh column
H = 0:0.1:1; % it creates an array that has as first entry a 0, that it is uniformly
             % spaced with spacing 0:1, and it has as last entry 1.
             
% Q: How many entries does H have? A: If you are not sure, you can retrieve the length of any array by simply
% using the command length

lenH = length(H);
disp(['The length of H is: ',num2str(lenH)])
disp(H)

% Operations with arrays and matrices
I = A.*B'; % the component-wise product of the arrays A and B transposed (note
           % the transposition of the vector B by the ' operator) is stored inside of an array I

L = A*B; % the row-by-column matrix multiplication between the 13 array A and
         % the 31 array B produces a scalar, as a result of the scalar product or \dot product"
         % between vectors

M = B.^2; % it elevates to the power 2 each entry of the array B

%% Loops
% for loops
for i=2:9 % if no spacing is specified, the default one is +1
    A(i) = 2*i; % every time it multiplies 2 * i and assigns it to the ith entry of a
                % variable A (hence, it will allocate from the second to
                % the ninth entry of A).
                % Note how A only had 3 entries earlier. MATLAB has no
                % problem in extending it. Lengths are not fixed and preallocated unlike in C
end

for j=0:2:8 % the index j starts from 0, and, with spacing 2, goes up to 8
    B(j+1) = 2^j; % it stores the even powers of 2 from 20 to 28 inside of the
                  % 1st, 5th, 7th, 9th entries of B
end

% while loops
i = 10; % the scalar i is initialized at 10
while i >= 0 % until i is greater or equal to 0, do:
    i = i-2; % every time it subtract 2 to i
end
% Q: What will be the final value of the variable i?

%% Functions

% Let's write a function that computes the summation of the first n
% integers, in a separate file. Then I call it from here with any desired
% argument

S1 = MySum(5);

for i=1:10
    S(i) = MySum(i); % It assigns the output of the call of the function MySum
                     % with the argument i that varies at every loop iteration
end
 
%% Exercise 1
% Problem statement: Write a MATLAB program calculating
% 
% $$S=\sum_{k=0}^{100}\frac{(-1)^k}{k!} .$$

% *Solution:* 
n=100; % How far we’re summing up to

S2 = myExponentialSeries(n);

% Note: How do we check that this result is correct? Knowing from Calculus
% that the series represents the $e^{-x}$, in this case with x=1, ie
% $e^{-1}$.
CheckResult=exp(-1);
disp(['the actual sum up to 5 precision digits is: ',num2str(CheckResult)]);

%% Exercise 2
% Problem statement: Write a MATLAB program calculating $\sum_{k=0}^{\infty}\frac{(-1)^k}{k!}$ with an error
% tolerance of 10^(-6).

% *Solution:*
tolerance = 1e-6; % Set the error tolerance to 10^(-4)

S3 = myExponentialTolerance(tolerance);

%% Plots

x = linspace(0,10,1000); % it creates an array x with 1000 linearly equispaced
                         % points between 0 and 10 that will be used as domain of our curves
figure(1)
plot(x,sin(x),'--r','LineWidth',2); % plot of sin(x) with a dashed red line of
                                    % width 2 (the default value for LineWidth is 1)
hold on % this is the command to plot more curves in the same figure
plot([1:10],cos(1:10),'or','MarkerFaceColor','r','MarkerSize',4); % plot of ten discrete red dots along a cosine curve
hold on
plot(x,cos(x),'b'); % plot of a cosine blue solid curve
xlabel('x'); % sets the x-axis label
ylabel('y'); % sets the y-axis label
title('Our first figure'); % sets the title as a character string
legend({'$\sin(x)$','Discrete Data along the cosine curve','$\cos(x)$'},...
'interpreter','latex','location','SouthWest'); % the different legend entries need to be grouped inside of curly parentheses. The legend, as other commands,
                                               % has some options.

%% Exercise 3
% Problem statement: plot the function $f (x)= \sin x / (x ^ 2 +1)$ on the
% interval $[- \pi; \pi]$

% *Solution:* 
X = -pi:0.01:pi; % Create a set of x values between -1 and 1, with a step of 0.01
Y=sin(X)./(X.^2 + 1); % The period in “.^” ensures that the operation is performed 
                           %on each element
figure(2) %opens a new figure
plot(X,Y,'r','LineWidth',1); % Plot y against x, note the plot option for line color
                                 % and width
box on % to put a nice frame around your plot
axis([-pi pi -.5 .5]); % min and max delimiters for axes values to display
xlabel('$x$','interpreter','latex','fontsize',14); % label the plot and use 
                                              % math fonts in latex 
                                %(for nice visualization of math symbols!)
ylabel('$y=\frac{\sin x}{x^2 +1}$','interpreter','latex','fontsize',14);
legend({'$f(x)=\frac{\sin x}{x^2 +1}$'},'interpreter','latex','fontsize',12,...
    'location','best');
title('Plot of function $f(x) = \frac{\sin x}{x^2 +1}$','interpreter','latex',...
    'fontsize',14);

%% Exercise 4
% Problem Statement: Calculate $f(x)=\sum_{k=0}^{\infty} (-1)^k \frac{x^k}{k!}$ and plot the values of the function for a set of 80 
%  values of x on the interval [-1; 1]
%%
% *Solution:* 
N = 80; % Number of points in the plot
X = linspace(-1, 1, N); % Create a set of N values between -1 and 1
Y = zeros(N, 1); % create the corresponding Y array where we store the summation 
                       % for each value of little x
tolerance= 1e-5;

for i = 1 : N % Main part of the program: calculate the sum for each of the 
                   % N x-values
x = X(i); % Assign the next x-value to the variable x
S = 0; % initialize
k = 0; % first term corresponds to k=0
sgn = 1; % initialize as positive for the first term in the series
term=1; % initialize to a big enough value

    while abs(term) > tolerance % repeat until the next term is less than the 
                                   % error tolerance
    % put here all commands needed to calculate the sum “S” for each value of x
    term = (sgn.*(x.^(k))) ./ factorial(k); % calculate the next (k-th) term
        % note: here little x is a scalar, so we don't actually need the .
        % operator, but it is a good practice
    S = S + term; % add k-th term to the sum variable S
    k = k + 1;
    sgn = -sgn; % this assignment avoids the use of the "if-else" statement 
                   % used in the previous exercise
    end
Y(i) = S; %; store the result in the appropriate element of the y-array

end
figure(3) %opens a new figure
plot(X,Y,'r','Linewidth',1)
box on % to put a nice frame around your plot
xlabel('$x$','interpreter','latex','fontsize',14); % label the plot and use 
                                              % math fonts in latex
ylabel('$y=\sum_{k=0}^{\infty}(-1)^k \frac{x^k}{k!}$','interpreter','latex',...
    'fontsize',14);
legend({'$f(x)=\sum_{k=0}^{\infty}(-1)^k \frac{x^k}{k!}$'},'interpreter','latex',...
    'fontsize',12,'location','best');
title('Plot of function $f(x) =\sum_{k=0}^{\infty}(-1)^k \frac{x^k}{k!}$',...
    'interpreter','latex','fontsize',14);

%% Some data analysis

r = -5 + (5+5)*rand(100,1);
figure(4)
plot([1:100],r)
title('Some random data');

rs = smooth(r,7);
figure(5)
plot([1:100],rs)
title('Smoothed data');

% load data from file
FolderToRead = './';

PeaksData = readtable([FolderToRead,'PeaksData7.dat'],'ReadVariableNames',false,'HeaderLines',1, 'Format','%f%f%f%f');

% number of droplets analysis
NumbPeaks = numel(PeaksData.Var1);

disp(['We have ',num2str(NumbPeaks),' peaks in this data set.'])
figure(6)
plot(1:NumbPeaks, PeaksData.Var2, 'or','MarkerFaceColor','r','MarkerSize',4)

xlabel('$x$','interpreter','latex','fontsize',14); 
ylabel('Peak locations','fontsize',14);
title('Some data','fontsize',14);

% let's save some of our plots
set(gcf,'PaperSize', [8 6]);
print(gcf, '-dpdf', './PeakLoc.pdf');

%% Symbolic functions

% this creates a symbolic function of two variables: c and x
g = @(c,x)(c*x.*(1-x));

% give a value to the variable c
c = 2.5;
% call the cobweb function (this will save an mp4 video!)
[ErrorCob, flagCob, iteratesCob] = cobweb(g, c);

%% Some image processing

% load the image
I = imread('Minion.jpg');

% show the loaded image
figure(8)
imshow(I);

% check how the image is stored:
whos I

% check the image contrast
figure(9)
imhist(I)

% increase the image contrast
I2 = histeq(I);
figure(10)
imshow(I2)

% compare with previous image histogram, it is more spread out
figure(11)
imhist(I2)
imhist(I2)

%% Bonus!
% Let's draw some pasta :)

for i = 0 : 80
    for j = 0 : 80
        alpha(i+1) = sin((7*i + 16)/40*pi);
        beta(i+1, j+1) = 7*j/16 + 4*sin(i/80*pi) - alpha(i+1)*sin((10-j)/20*pi);
        gamma(i+1, j+1) = 10 * cos((i+80)/80*pi) * (sin((j+110)/100*pi))^9;
        eta(i+1, j+1) = 7*j/16 - 4*sin(i/80*pi) - alpha(i+1)*sin((10-j)/20*pi);
        jota(i+1, j+1) = 7*j/16 + 4*sin(i/80*pi) - alpha(i+1)*sin((10-j)/20*pi);
        if 20 <= i && i <= 60
            Pi(i+1, j+1) = 3*i/8 + 7 * ((sin((i+40)/40*pi))^3) * (sin((j+110)/100*pi))^9;
        else
            Pi(i+1, j+1) = 3*i/8 + gamma(i+1, j+1);
        end
        if 10 <= j && j <= 70
            Theta(i+1, j+1) = beta(i+1, j+1) - 8*sin(i/80*pi) * sin((70-j)/120*pi);
        elseif j < 10
            Theta(i+1, j+1) = eta(i+1, j+1);
        else
            Theta(i+1, j+1) = jota(i+1, j+1);
        end        
        Kappa(i+1, j+1) = 3 * sin((i+10)/20*pi) * (sin(j/80*pi))^1.5;
    end
end

surf(Pi, Theta, Kappa);