%
% Author: VSCLAB,UCR
% Date: 03/07/2016   
% Purpose    : Stress evolution under constant current density stressing
% Return     : Stress (EM stress+residual stress) 

clc
clear

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
% T: Constant temperature                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B = 1e11; %(Pa)
Omega = 1.66e-29; %(m^3)
kB = 1.38e-23; %(m^2.kg.s^2.K^-1)
L = 1e-4; %(m) 
rstress=0; %(Pa) 
Z = 10; 
q = 1.6e-19; %(C)
resistivity_Cu = 3e-8; %(Ohm.m)
T = 373; %(K) 
D0 = 7.56e-5; % (m^2.s^-1) 
Ea = 0.86*q; 
kappa = D0*exp(-Ea/kB/T)*B*Omega/kB/T;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulation parameters:                                                        %
% curden: Current density                                                       %
% tmax: Maximum stress time                                                     %
% tstep: Time step                                                              %
% loc: Coordinate along the wire                                                %                                        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
curden = 3e9; %(A.m^-2)
tmax = 1e5; %(s);
tstep = 1e3; %(s)
t = 0:tstep:tmax;
loc=0; % cathode end
G = q*Z*resistivity_Cu*curden/Omega;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calculate stress (EM stress + residual_stress) at cathode end                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M = size(t,2);
stress = zeros(M,1);
N = 100;
eta = (1:2:2*N-1)'*pi/L;
for i = 1:M
    phi = (cos(eta*loc))./(eta.^2*L^2.*exp(eta.^2.*kappa*t(i)));
    stress(i) = G*L*(0.5-loc/L-4*sum(phi))+rstress;
end

%figure
plot(t,stress*1e-6,'-.ob','linewidth',1.5)
xlabel('stress time(s)','fontsize',16)
ylabel('stress(MPa)','fontsize',16)
set(gca,'fontsize',12)
title('Stress evolution under constant current load')
grid on
