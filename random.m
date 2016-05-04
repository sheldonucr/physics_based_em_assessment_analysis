%
% Author: VSCLAB,UCR
% Date: 03/07/2016   
% Purpose    : Stress evolution under arbitrary time-varying current
% density and temperature stressing (piecewise constant)
% Return     : stress (EM stress+residual stress)

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
% resistivity_Cu: Copper resistivity                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B = 1e11; %(Pa)
Omega = 1.66e-29; %(m^3)
kB = 1.38e-23; %(m^2.kg.s^2.K^-1)
L = 1e-4; %(m) 
rstress=0; %(Pa) 
Z = 10; 
q = 1.6e-19; %(C)
Ea = 0.86*q; 
resistivity_Cu = 3e-8; %(Ohm.m)
D0 = 7.56e-5; % (m^2.s^-1) 
theta = 4*q*Z*resistivity_Cu/Omega/L;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulation parameters:                                                        %
% curden: Current density                                                       %
% loc: Coordinate along the wire                                                %
% tmax: Maximum stress time                                                     %
% tstep: Time step                                                              %
% T: Temperature                                                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
curden0 = 5e9; %(A.m^-2)
tmax = 1e5; %(s);
tstep = 1e3; %(s)
t = 0:tstep:tmax;
loc = 0; % cathode end
M = size(t,2);
curden = zeros(M,1); %current density
T = zeros(M,1); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Current density and temperature waveform example                              %
% Piese-wise constant                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:M
    if t(i) == 0
       curden(i) = 0;   
       T(i) = 300;  
    elseif t(i) <= 0.2*tmax
       curden(i) = curden0;   
       T(i) = 370;
    elseif t(i) <= 0.3*tmax
       curden(i) = 0.2*curden0;
       T(i) = 340;
    elseif t(i) <= 0.6*tmax
       curden(i) = 0.5*curden0;
       T(i) = 350;
    elseif t(i) <= 0.7*tmax
       curden(i) = 0.6*curden0;
       T(i) = 355;
    elseif t(i) <= 0.8*tmax
       curden(i) = 0.875*curden0;
       T(i) = 365; 
    else
       curden(i) = 0.4*curden0;
       T(i) = 345;
    end
end
Da = D0*exp(-Ea/kB./T);
kappa = Da*B*Omega/kB./T;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calculate stress (EM stress + residual_stress) at cathode end                 %                                                          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
stress = zeros(M,1);
N = 100;
eta = (1:2:2*N-1)'*pi/L;
phi = zeros(N,1);
for i = 1:M
    tao = tstep;
    term1 = exp(-eta.^2*kappa(i)*tao);
    phi = cos(eta*loc).*eta.^-2.*(curden(i).*(1-term1))+term1.*phi;  
    stress(i) = theta*sum(phi)+rstress;
end

figure
plot(t,stress*1e-6,'-.ob','linewidth',1.5)
xlabel('stress time(s)','fontsize',16)
ylabel('stress(MPa)','fontsize',16)
set(gca,'fontsize',12)
title('Stress evolution under arbitrary time-varying current')
grid on
