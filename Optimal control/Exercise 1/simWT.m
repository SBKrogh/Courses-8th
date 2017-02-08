function Xs1 = simWT(Ts,Xs0,U,D,Area,tau)
% simWTzoh5.m
% Simulates water mixing system five seconds  
% with constant control signals
% and constant disturbances 
% current state is supposed to be Xs(k)
% next state in Xs(k+1)

H30    = Xs0(1);
T3mix0 = Xs0(2);
T30    = Xs0(3);

% Xs, U and D are aggregated into an statevector for simulation  
X0 = [H30;T3mix0;T30];
[t,X1] = ode45(@wtzoh,[0 Ts],X0);
X1 = X1(end,1:3);
Xs1 = X1';

function xdot = wtzoh(t,X)
  % water tank dynamics 
  % assuming zero order hold for control inputs
  % assuming zero order hold for disturbance input
  % Area of vessel
  %tau  = 10 % Time constant of temperature transducer
  H3 = X(1,1); 
  T3mix = X(2,1);
  T3 = X(3,1);
  V1 = U(1); V2 = U(2);
  V3 = D(1); T1 = D(2);  T2 = D(3);
  xdot = [(V1+V2-V3)/Area;
            (V1*T1+V2*T2-(V1+V2)*T3mix)/(Area*H3);
            (T3mix-T3)/tau];
end %xdot
end %simWT5