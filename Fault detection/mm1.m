clc; clear all; close all;
format long 

%% Exercise 1 

% 1) A system consists of 10 identical components in series. What is 
% the system reliability if each component has a reliability of 
% 0.95?

n = 10;
R1 = 0.95^n


% 2) A system requires 200 identical components in series. If the 
% overall reliability must not be less than 0.99, what is the 
% minimum reliability of each component?


syms x
R2 = nthroot(0.99,200)


% 3)A system consists of 4 components in parallel with reliabilities 
% of 0.99, 0.95, 0.98, and 0.97. What is the system reliability?

R3 = 1 - (1-0.99)*(1-0.95)*(1-0.98)*(1-0.97)

% 4) Plot the relative improvement (in %) of adding extra parallel 
% components for a system with 1-5 components, each with a 
% reliability of 0.6.

n = 5;
for k=1:n
    x(k) = 1 - (1-0.6)^k;
end
figure
plot(x)
title('Relaibility increases when more in parallel')
for k = 1:n-1
    improvement(k) = 1 - (x(k)/x(k+1));
end
figure
plot(improvement)
title('Highist increase is from first component added in %')
% 5) A system is designed with an overall reliability of 0.999 using 
% parallel components, having individual reliabilities of 0.7. How 
% many parallel components are needed?

syms x
number_components = ceil(solve(1 - (1-0.7)^x == 0.999,x))


%% Exercise 2

% 6) Derive a general expression of the system reliability of the 
% system in the upper figure and evaluate for the case where all 
% components have a reliability of 0.9

R = 0.9;
n1 = 4;
n2 = 4;

serie1 = R^n1;  
serie2 = R^n2;

Parallel = 1 - (1-serie1)*(1-serie2)

% 7) Derive a general expression of the system reliability for the 
% system in the lower figure and evaluate for the case where all 
% components have a reliability of 0.8.

R = 0.8;

Parallel1 = 1 - (1-R)*(1-R)*(1-R);
serie = Parallel1 * R * R;

R7 = 1 - (1-serie)*(1-R) 

% 8) Repeat the above (question 7) parallel components 3, 4, and 5 
% are required. (binomial case)

X = 2;
N = 3;

Parallel = binopdf(X,N,R) * (1 - (1-R)*(1-R)*(1-R));
serie = Parallel* R * R;
R8 = 1 - (1-serie)*(1-R)


