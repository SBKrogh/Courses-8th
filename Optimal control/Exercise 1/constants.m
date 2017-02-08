%********************************************************************************
%
% CONSTANTS
%
%********************************************************************************

clear; close all

%********************************************************************************
% Parameters and operating point values
%********************************************************************************

Ts = 5;              % Sampling time [sec]

A    = pi*0.1*0.1;      % Area of vessel
tau  = 10;           % Time constant of temperature transducer

H30 = 0.40;          % state operating point
T3mix0 = 30;
T30 = 30;

V30 = 0.00030;       % diturbance operating point
T10 = 10;
T20 = 60;


Hs = [1 0 0
      0 0 1];        % output matrix
    
%**************************************************************************
% Initialisations
%********************************************************************************
    
H3 = 0.35;
T3mix = 25;          %Initial values of state
T3 = 25;

Xs = [H3;T3mix;T3];  % Initial state vector

Y = Hs*Xs;           % Initial output

xshat = [0;0;0];     % initial state estimator (small signals!)

xi = [0;0];          % initial integral state (small signal)

%********************************************************************************
% Saturations
%********************************************************************************

Umax = [0.0010;0.0005];
Umin = [0;0];

%********************************************************************************
% Sequences for simulation
%********************************************************************************

Usekv = [ones(1,75)*0.00010 ones(1,75)*0.00020
         ones(1,75)*0.00020 ones(1,75)*0.00010];
       
       
Dsekv = [ones(1,40)*0.00030 ones(1,5)*0.00036 ones(1,105)*0.00030
         ones(1,120)*10     ones(1,5)*15      ones(1,25)*10
	 ones(1,130)*60     ones(1,5)*55      ones(1,15)*60];
       
Rsekv = [ones(1,60)*0.40    ones(1,90)*0.45
         ones(1,80)*30      ones(1,70)*35];