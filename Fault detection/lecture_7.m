clc; clear all; close all; 
%%
% Go to Christoffers lecture notes page 51 - 52. There is an example how to
% calculate exercise one.
%% System Description
%dx/dt = Ax + Bu + Exd + Fxf
%y = Cx + Du + Eyd + Fyf;

% System matrix
A = [2 2.5 1.5;
     1 2.5 2.5;
     1 4.5 2.5];
% Input matrix
B = eye(3);
% Output matrix
C = [1 1 0;
     0 1 1];
 
n = size(A,1); % Number of states
m = size(B,2); % Number of inputs
p = size(C,1); % Number of measurements
% Disturbance input matrix
Ex = [ 0.5  0.5;
      -0.5  0.5;
       0.5 -0.5];
% Fault input matrices
Fx = [1 0 0 0 0;
      0 1 0 0 0;
      0 0 1 0 0];
Fy = [0 0 0 1 0;
      0 0 0 0 1];

%%

Q = null((C*Ex)') % Left nullspace
H = Q'*C
Ac = A-K