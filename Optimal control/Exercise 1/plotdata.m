%plotdata.m
tid = 0:Ts:Ts*length(U)-1;
figure(1)
Uplot = [1.0e5  0;0 1.0e5]*U;
Dplot = [1.0e5 0 0; 0 1 0;0 0 1]*D;
plot(tid,[Uplot' Dplot'],'LineWidth',2)
legend('V1*1.0e5','V2*1.0e5','V3*1.0e5','T1','T2',2)
axis([0 800 0 80])
grid

figure(2)
Xplot=[1.0e2 0 0;0 1 0;0 0 1]*Xs(:,1:length(U));
Rplot=[1.0e2 0;0 1]*R;
plot(tid,[Xplot' Rplot'],'LineWidth',2)
legend('H3*100','T3mix','T3','Href','Tref',1)
axis([0 800 10 60])
grid
