%
% Author: VSCLAB,UCR
% Date: 03/07/2016   
% Purpose    : Stress relaxation after switching off the electric current
% Return     : stress (EM stress+residual stress)

% clc
% clear

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Model parameters:                                                             %
% B: Effective bulk elasticity modulus                                          %
% Omega: Atomic lattice volume                                                  %
% kB: Boltzmann constant                                                        %
% L: Wire length                                                                %
% rstress: Residual stress                                                      %
% q*Z: Effective charge of migrating atoms                                      %
% Ea: Activation energy                                                         %
% Da: Effective atomic diffusivity                                              %
% resistivity_Cu: Copper resistivity                                            %
% T1: Temperature when current is on                                            %
% T2: Temperature when current is off                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B = 1e11; %(Pa)
Omega = 1.66e-29; %(m^3)
kB = 1.38e-23; %(m^2.kg.s^2.K^-1)
L = 1e-4; %(m) 
rstress=0; %(Pa) le
Z = 10; 
q = 1.6e-19; %(C)
resistivity_Cu = 3e-8; %(Ohm.m)
T1 = 363; %(K) 
T2 = 343; %(K)
T = [T1,T2];
D0 = 7.56e-5; % (m^2.s^-1) 
Ea = 0.86*q; 
kappa = D0*exp(-Ea/kB./T)*B*Omega/kB./T;
theta = 4*q*Z*resistivity_Cu/Omega/L;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulation parameters:                                                        %
% curden: Current density                                                       %
% tmax: Maximum stress time                                                     %
% tstep: Time step                                                              %
% loc: Coordinate along the wire                                                %
% t_crit: Turn off current at t=t_crit                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
curden = 3e9; %(A.m^-2)
tmax = 1e5; %(s);
tstep = 1e3; %(s)
t = 0:tstep:tmax;
loc=0; % cathode end
t_crit = tmax*1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calculate stress (EM stress + residual_stress) at cathode end                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M = size(t,2);
stress = zeros(M,1);
N = 100;
eta = (1:2:2*N-1)*pi/L;
for i = 1:M
        term1 = exp(-kappa(1)*eta.^2*t(i));
        if t(i) <= t_crit  
           phi = cos(eta*loc).*curden./eta.^2.*(1-term1);
        else 
           term2 = exp(kappa(2)*eta.^2*(-t(i)+t_crit));
           phi = cos(eta*loc).*curden./eta.^2.*(term2-term1); 
        end
    stress(i) = theta*sum(phi)+rstress;
end

%figure
plot(t,stress*1e-6,'-.ob','linewidth',1.5)
xlabel('stress time(s)','fontsize',16)
ylabel('stress(MPa)','fontsize',16)
set(gca,'fontsize',12)
title('stress relaxation after switching off the electric current')
grid on
