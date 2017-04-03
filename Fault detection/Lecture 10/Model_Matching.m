clc
clear
close all
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Model matching                || Based on algebraic relations   Slide 7
% Virtual sensors and actuators || Observaer based methoed        Slide 18
% Fault tolerant LQRs           || Switching between controllers 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% System Parameters
m1 = 2; % [kg]
m2 = 1; % [kg]
k = 2; % [N/m]
b1 = 3; % [N/(m/s)]
b2 = 4; % [N/(m/s)]

%% System Description
%dx/dt = Ax + Bu + Exd + Fxf
%y = Cx + Du + Eyd + Fyf;

% System matrix
A = [0 0 1 0;
     0 0 0 1;
     -k/m1 k/m1 -b1/m1 0;
     k/m2 -k/m2 0 -b2/m2];
n = size(A,1); % Number of states
% Input matrix
B = [0 0 0;0 0 2;1/m1 0 0;0 2/m2 0];
m = size(B,2); % Number of inputs
% Output matrix
C = eye(n);

%% Design nominal controller for the system

sys = ss(A,B,C,0); % D = 0 matrix
pole = -[1 2 3 4];
K = -place(A,B,pole);

cl_sys = ss(A+B*K,B,C,0)

step(sys,cl_sys)

%% Design appropriate accommodation strategies for sensor faults

% Two positions sensors which works and two velocity sensors which does not
% Is Observable since the velocities can be derived by differencation of position, there fore Virtual sensor can be used 
% Is not redundant.
Cf = [1 0 0 0;
      0 1 0 0;
      0 0 0 0;
      0 0 0 0];
  
P = C*pinv(Cf)
Cvs = C - P*Cf
  
% Two positions sensors which does not work and two velocity which does
% Is not observable since the initial state is not observable 
% Is not redundant
Cf = [0 0 0 0;
      0 0 0 0;
      0 0 1 0;
      0 0 0 1];

% Four sensors working. 
% The kernal of C and Cf are the within the   
Cf = [2 0 0 0;
      0 2 0 0;
      0 0 1 0;
      0 0 0 1];

%% Design appropriate accommodation strategies for  actuator faults
Bf = [0 0 0;
      0 0 2;
      0 0 0;
      0 0 0];
  
 Bf = [0 0 0;
       0 0 0;
       1/m1 0 0;
       0 2/m2 0];
  
 Bf = [0 0 0;
       0 0 0;
       1/m1 0 0;
       0 0 0];
   
%% Simulate one of the fault scenarios for which you have designed a virtual sensor.
