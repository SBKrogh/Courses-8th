clc; clear all; close all;
format long 

%% Parity methods - 27/02/17
% Exercise 3 consider a two-cart system given as 

k = 5;
m1 = 1;
m2 = 2;
b1 = 3;
b2 = 4;

A = [0 0 1 0;
     0 0 0 1;
     -k/m1 k/m1 -b1/m1 0;
     k/m2 -k/m2 0 -b2/m2];
 
B = [0; 0; 1/m1; 0];
C = [1 0 0 0;
     0 1 0 0;
     1 -1 0 0];
D = [0 0 0];
E = [0 0 1 1]';
F = [0 0;
     1 0;
     0 0;
     0 0];

%%
% Step one: Find O, Td,q and Tu,q - slide 36
Obs = obsv(A,C); % Observability 
Tuq = [D 0; C*B D]