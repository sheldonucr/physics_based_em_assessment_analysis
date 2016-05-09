%
% Author: VSCLAB,UCR
% Date: 03/07/2016   
% Purpose    : 1. void nucleation phase 2. void growth phase
% Return     : time to failure (10% increase of the wire resistance or 10% IR drop)

clc
clear

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Model parameters:                                                             %
% B: Effective bulk elasticity modulus                                          %
% Omega: Atomic lattice volume                                                  %
% kB: Boltzmann constant                                                        %
% rstress: Residual stress (e.g. thermal stress)                                %
% q*Z: Effective charge of migrating atoms                                      %
% EV, EVD: Activation energy for vacancy formation and diffusion                %
% f: Ratio of volumes occupied by vacancy and lattice atom                      %
% Da: Effective atomic diffusivity                                              %
% resistivity_Cu: Resistivity of Copper                                         %
% resistivity_Ta: Resistivity of Ta/TaN                                         %
% T: Temperature                                                                %
% curden: Current density                                                       %
% rstress: Residual stress (e.g. thermal stress)                                %
% stress: Steady state stress (EM stress + residual stress)                     %
% cstress: Critial stress, stress needed for void initiation                    %
%                                                                               % 
% Geometry:                                                                     %  
% L: Length of metal wire                                                       %
% H: Height of metal wire                                                       %
% hTa: Thickness of diffusion barrier                                           %
% W: Width of metal wire                                                        %             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B = 1e11; %(Pa)
Omega = 1.66e-29; %(m^3)
kB = 1.38e-23; %(m^2.kg.s^2.K^-1)
Z = 10; 
q = 1.6e-19; %(C)
resistivity_Cu = 3e-8; %(Ohm.m)
resistivity_Ta = 3e-5; %(Ohm.m)
D0 = 7.56e-5; % (m^2.s^-1) 
EV = 0.75*q; 
EVD = 0.65*q;
f = 0.9;    
T = 373; %(K)
curden = 2e10; %(A.m^-2)
rstress = 4e8; %(Pa) From residual stress simulation
cstress = 5e8; %(Pa)

L = 5e-5; %(m) 
H = 1.2e-7; %(m)
W = 2e-7; %(m)
hTa = 1e-8; %(m)
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nucleation Phase                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
D = D0*exp(-(EV+EVD)/kB/T);
kappa = D*B*Omega/kB/T;
% Single confined wire:
stress = q*Z*resistivity_Cu*curden*L/2/Omega+rstress;
% Interconnect tree: stress is obtained from tree based stress simulation
t_nuc = L^2/kappa*exp(-f*Omega/kB/T*stress)*log((stress-rstress)/(stress-cstress));
%disp(['Steady state tensile stress at cathode end: ', num2str(stress*1e-6), ' MPa']);
disp(['Nucleation time: ', num2str(t_nuc/24/365/3600), ' years']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Growth Phase                                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Drift velocity of void edge
velocity = D*q*Z*resistivity_Cu*curden/kB/T;
% Voiding induced resistance increase
R_incr_rate = velocity*(resistivity_Ta/hTa/(2*H+hTa)-resistivity_Cu/H/W);

% 10% resistance increase
R0 = resistivity_Cu*L/W/H;
t_grow = 0.1*R0/R_incr_rate;
disp(['Growth time: ', num2str(t_grow/24/365/3600), ' years']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% time to failure                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ttf = t_nuc+t_grow;
disp(['Time to failure: ', num2str(ttf/24/365/3600), ' years']);


