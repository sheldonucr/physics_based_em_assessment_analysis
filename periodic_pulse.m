%
% Author: VSCLAB,UCR
% Date: 03/07/2016   
% Purpose    : Stress evolution under pulsed or bidirectional current
% loads
% Return     : stress (EM stress+residual stress)

clc
clear

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Model parameters:                                                             %
% B: Effective bulk elasticity modulus                                          %
% Omega: Atomic lattice volume                                                  %
% kB: Boltzmann constant                                                        %
% L: Wire length                                                                %
% rstress: Residual stress  (e.g. thermal stress)                               %
% q*Z: Effective charge of migrating atoms                                      %
% Ea: Activation energy                                                         %
% Da: Effective atomic diffusivity                                              %
% resistivity_Cu: Copper resistivity                                            % 
% T1: Temperature corresponding to current density1                             %
% T2: Temperature corresponding to current density2                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B = 1e11; %(Pa)
Omega = 1.66e-29; %(m^3)
kB = 1.38e-23; %(m^2.kg.s^2.K^-1)
L = 1e-4; %(m) 
rstress=0; %(Pa) 
Z = 10; 
q = 1.6e-19; %(C)
resistivity_Cu = 3e-8; %(Ohm.m)
T1 = 363; %(K) 
T2 = 353; %(K)
T = [T1,T2];
D0 = 7.56e-5; % (m^2.s^-1) 
Ea = 0.86*q; 
Da = D0*exp(-Ea/kB./T);
kappa = Da*B*Omega/kB./T;
theta = 4*q*Z*resistivity_Cu/Omega/L;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulation parameters:                                                        %
% curden: Current density                                                       %
% loc: Coordinate along the wire                                                %
% tmax: maximum stress time                                                     %
% P: Period                                                                     % 
% dc: Duty cycle                                                                % 
% tstep: Time step                                                              %
% T: Temperature                                                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
curden1 = 3e9; %(A.m^-2)
curden2 = 1e9;
curden = [curden1, curden2];
tmax = 1e5; %(s);
P = tmax/10; %(s)
dc = 0.5;
t1 = P*dc;
t2 = P-t1;
tstep = P/20;
t = 0:tstep:tmax;
loc = 0; % cathode end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calculate stress (EM stress + residual_stress) at cathode end                 %                                                         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M = size(t,2);
stress = zeros(M,1);
N = 100;
eta = (1:2:2*N-1)*pi/L;
for i = 1:M
    m = floor(t(i)/P);
    tao = mod(t(i),P);  
    if tao <= t1 % curden(1)
       term1 = exp(-kappa(1).*eta.^2*tao);
       term2 = exp(-eta.^2*(kappa(1)*(tao+t1)+kappa(2)*t2));
       term3 = exp(-eta.^2*(kappa(1)*tao+kappa(2)*t2));
       zeta = (1-exp(-eta.^2*m*(kappa(1)*t1+kappa(2)*t2)))./...
       (1-exp(-eta.^2*(kappa(1)*t1+kappa(2)*t2)));
       phi = cos(eta*loc).*eta.^-2.*(curden(1)*(1-term1)+zeta*curden(1)...
       .*(term3-term2)+zeta*curden(2).*(term1-term3));
    else % curden(2)
       tao = tao-t1;
       term1 = exp(-kappa(2)*eta.^2*tao);
       term2 = exp(-eta.^2*(kappa(1)*t1+kappa(2)*(tao+t2)));
       term3 = exp(-eta.^2*(kappa(1)*2*t1+kappa(2)*(tao+t2)));
       term4 = exp(-eta.^2*(kappa(1)*t1+kappa(2)*tao));
       zeta = (1-exp(-eta.^2*m*(kappa(1)*t1+kappa(2)*t2)))./...
       (1-exp(-eta.^2*(kappa(1)*t1+kappa(2)*t2)));
       phi = cos(eta*loc).*eta.^-2.*(curden(2)*(1-term1)+curden(1)...
           *(term1-term4)+zeta*curden(1).*(term2-term3)+zeta*curden(2).*(term4-term2));
    end
    stress(i) = theta*sum(phi)+rstress;
end

%% plot
figure
plot(t,stress*1e-6,'-.ob','linewidth',1.5)
xlabel('stress time(s)','fontsize',16)
ylabel('stress(MPa)','fontsize',16)
set(gca,'fontsize',12)
title('Stress evolution under pulsed or bidirectional current loads')
grid on
