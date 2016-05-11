# Physics-based Electromigration models and assessment software

## Introduction
Reliability is becoming a limiting constraint in high-performance nanometer VLSI chip designs due to the high failure rates in deep submicron and nanoscale devices. It was expected that the future chips will show sign of reliability-induced age much faster than the previous generations. Among of many reliability effects, electromigration (EM)-induced reliability has become a major design constraint due to aggressive transistor scaling and increasing power density.

Electromigration (EM) is a physical phenomenon of the oriented migration of metal (Cu) atoms along a direction of applied electrical field due to the momentum exchange between atoms and the conducting electrons. Migration of atoms results in metal density depletion or accumulation, which leads to build-up of hydrostatic stresses across the conductor. EM can degrade both global interconnects such as power grid networks and signal wires when the current densities are sufficiently high (about 1MA/cm^2). However, the power grid networks are more susceptible to EM effects due to the conduction of unidirectional currents.
The motivations of this project

## The new physics-based EM models
The site contains the recently developed physics-based predictable EM models for general multi-branch interconnect trees and structures which can consider varying current and temperature stressing for both normal and stream stressing conditions. The new physics-based EM models and full-chip assessment techniques can perform model validation for accurate, yet efficient EM sign-off analysis at design stage and EM-aware reliability management at run time for nanometer VLSI chips. 

It consists of three major parts:

The first part is the new physics-accurate EM model was developed for single wire based on the first-principle based stress evolution physics. The work was published in DAC'14 (dac14em_and_ACM.pdf) and TCAD'15 (tcad15_phy_em.pdf). The model can predict the mean time to failure (MTTF) of single wire stressed by constant current dentistry and temperature. 

The second part is the second physics-based EM model was an extension of the first EM models (DAC'14) for considering the time-varying current density and temperature. We call it dynamic EM models. The work has been published in ASPDAC'16 (aspdac16em_dyn.pdf). 

The third part of the codes is for the compact EM models for multl-branch interconnect wires. The detailed descriptions are given in the TCAD'16 (tcad16tree-em.pdf) paper shown below.

## Matlab codes for the newly developed physics-based EM models:


### I Matlab codes for DAC'14 [1] and TCAD'15

    time_to_failure.m
    
        TTF (time_to_failure) = t_nuc (nucleation time) + t_grow (growth time)
   
        t_nuc: eq(5)
   
        t_grow: eq(7)

### II Matlab codes for ASP-DAC'16 [2]

    1. constant.m
    
        Stress evolution model with constant current and temperature.

    2. random.m
        
        Stress evolution model wth the arbitrary piecewise constant currents (eq(7)).
  
    3. switch_off.m

        Stress relaxation after switching off the electric current.
   
    4. periodic_pulse.m:
        
        Stress evolution model for pulsed or bidirectional current loads (eq(8)-(11)).
   
    NOTE: random.m describes the general case. It gets the same results as model 1, model 2 and model 3 provided the same current and temperature waveforms.
    
### III Matlab codes for TCAD'16 [3]

    1. gfunction.m
    
        Computing the basis function (eq(16)).
 
    2. stress3terminals.m
    
        Computing the stress evolution for the 3-terminal interconnect tree.
        
    3. stressone3terminals.m
    
        Computing the stress evolution along the segment 1 of the 3-terminal interconnect tree (eq17).
    
    4. stresstwo3terminals.m
    
        Computing the stress evolution along the segment 2 of the 3-terminal interconnect tree (eq18).
        
    5. stress4terminals.m
    
        Computing the stress evolution for the 4-terminal interconnect tree.
        
    6. stressone4terminals.m
    
        Computing the stress evolution along the segment 1 of the 4-terminal interconnect tree (eq23).
    
    7. stresstwo4terminals.m   
        Computing the stress evolution along the segment 2 of the 4-terminal interconnect tree (eq24).
        
    8. stressthree4terminals.m   
        Computing the stress evolution along the segment 3 of the 4-terminal interconnect tree (eq25).
        
    9. stress5terminals.m
    
        Computing the stress evolution for the 5-terminal interconnect tree.
        
    10. stressone5terminals.m
    
        Computing the stress evolution along the segment 1 of the 5-terminal interconnect tree (eq26).
    
    11. stresstwo5terminals.m   
        Computing the stress evolution along the segment 2 of the 5-terminal interconnect tree (eq27).
        
    12. stressthree5terminals.m   
        Computing the stress evolution along the segment 3 of the 5-terminal interconnect tree (eq28).
        
    13. stressfour4terminals.m   
        Computing the stress evolution along the segment 4 of the 5-terminal interconnect tree (eq29).


### III related_papers: contain the relevant papers published


### IV References:
    
    [1] X. Huang, T. Yu, V. Sukharev and S. X.-D. Tan, “Physics-Based
    Electromigration Assessment for Power Grid Networks,” in
    Proc. Design Automation Conf. (DAC’14), San Francisco, June 2014. [dac14em_ana_ACM.pdf]
    
    [2] X. Huang, V. Sukharev, T. Kim, H. Chen and S. X.-D. Tan,
    “Electromigration Recovery Modeling and Analysis under
    Time-Dependent Current and Temperature Stressing," in Proc. Asia
    South Pacific Design Automation Conf. (ASP-DAC’16), Macao,
    Jan, 2016. [aspdac16em_dyn.pdf]
    
    [3] H. Chen, S. X.-D. Tan, X. Huang, T. Kim, V. Sukharev, 
    “Analytical modeling and characterization of electromigration effects 
    for multi-branch interconnect trees”, IEEE Transaction on Computer-Aided 
    Design of Integrated Circuits and Systems (TCAD), (in press) [tcad16tree-em.pdf]
