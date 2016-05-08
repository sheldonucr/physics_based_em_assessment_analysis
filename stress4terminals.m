%main.m
%Cu parameters 
clear;
clc;

%%%%%%%%%%%%%%%%%% Parameters%%%%%%%%%%%%%%%%%%%%%%%
% resis = 1.67*10^(-8);
resis = 3*10^(-8);
electric = 1.6*10^(-19);
valence = 10; 
volume = 8.78*10^(-30);

bulk_modulus = 1*10^(11);
boltzmann = 1.38*10^(-23);

% diff_zero = 7.56*10^(-5);
diff_zero = 5.2*10^(-5);
active_energy = 1.1*electric;

lenth1 = 2*10^(-5);
lenth2 = 2*10^(-5);
lenth3 = 2*10^(-5);
% using the same lenth, lenth1=lenth2=lenth
lenth = 2*10^(-5);

temprature1 = 373;
temprature2 = 353;
temprature3 = 363;
% using the same temperature, temprature1=temprature2=temprature
temprature = 363;


% current1 = 5*10^10;
% % current1 = 10^10;
% % current2 = 10^10;
% current2 = 0;
% % current3 = 5*10^10;
% current3 = 2.5*10^10;

current1 = 4*10^10;
% current1 = 10^10;
% current2 = 10^10;
current2 = 2*10^10;
% current3 = 5*10^10;
current3 = 1*10^10;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% diff_coff1 = diff_zero*exp(-active_energy/boltzmann/temprature1);
% diff_coff2 = diff_zero*exp(-active_energy/boltzmann/temprature2);
% using the same temperature, diff_coff1=diff_coff2=diff_coff
diff_coff = diff_zero*exp(-active_energy/boltzmann/temprature);

% k1 = diff_coff1*bulk_modulus*volume/boltzmann/temprature1;
% k2 = diff_coff2*bulk_modulus*volume/boltzmann/temprature2;
% using the same temperature, diff_coff1=diff_coff2=diff_coff, k1=k2=k
k = diff_coff*bulk_modulus*volume/boltzmann/temprature;

% L1 = lenth1;
% L2 = lenth2;
% using the same lenth, L2=L1=L;
L = lenth;

G1 = resis*current1*valence*electric/volume;
G2 = resis*current2*valence*electric/volume;
G3 = resis*current3*valence*electric/volume;
% using the same current, G1=G2=G
% G = resis*current*valence*electric/volume;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%% compute the stress of Line 1 %%%%%%%%%%%%%%%%%%%%
% -L<x1<0<x2<L
% x1 = -L;
% x2 = L;
% x3 = L;
x1 = 0;
x2 = 0;
x3 = 0;

% total_time = 4*10000000;
total_time = 10*10000000;

% M = 100; %number of time discretizaiton
M = 101; %number of time discretizaiton
N = 100; % number of space discretization

time= linspace(0,total_time,M);
lenth1 = linspace(-L,0,N);
lenth2 = linspace(0,L,N);
lenth3 = linspace(-L,0,N);

y1 = zeros(M,N);
y2 = zeros(M,N);
y3 = zeros(M,N);

y1(1,:) = 0;
y2(1,:) = 0;
y3(1,:) = 0;

for j = 2 : M
    for i = 1 : N
        y1(j,i) = stressone4terminals(k,G1,G2,G3,lenth1(i),time(j),L);
        y2(j,i) = stresstwo4terminals(k,G1,G2,G3,lenth2(i),time(j),L);
        y3(j,i) = stressthree4terminals(k,G1,G2,G3,lenth3(i),time(j),L);
    end
end
lenth = [lenth1 lenth2];
y=[y1 y2];







