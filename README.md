# Background
Reliability is becoming a limiting constraint in high-performance nanometer VLSI chip designs due to the high failure rates in deep submicron and nanoscale devices. It was expected that the future chips will show sign of reliability-induced age much faster than the previous generations. Among of many reliability effects, electromigration (EM)-induced reliability has become a major design constraint due to aggressive transistor scaling and increasing power density.

Electromigration (EM) is a physical phenomenon of the oriented migration of metal (Cu) atoms along a direction of applied electrical field due to the momentum exchange between atoms and the conducting electrons. Migration of atoms results in metal density depletion or accumulation, which leads to build-up of hydrostatic stresses across the conductor. EM can degrade both global interconnects such as power grid networks and signal wires when the current densities are sufficiently high (about 1MA/cm^2). However, the power grid networks are more susceptible to EM effects due to the conduction of unidirectional currents.
The motivations of this project

# The new physics-based EM models
The site contains the recently developed physics-based predictable EM models for general multi-branch interconnect trees and structures which can consider varying current and temperature stressing for both normal and stream stressing conditions. The new physics-based EM models and full-chip assessment techniques can perform model validation for accurate, yet efficient EM sign-off analysis at design stage and EM-aware reliability management at run time for nanometer VLSI chips. 

The first new physics-accurate EM models was developped for single wire based on the first-principle based stress evolution phyiscs. The work was published in DAC'14. The model can predict the mean time to fialure (MTTF) of single wire stressed by constant current dentisty and temperature. 

The secon physics-based EM model is an extension of the first EM models (DAC'14) for considering the time-varying current density and temperature. We call it dynamic EM models. The work has been published in ASPDAC'16. 

# Matlab codes for the newly developed phyiscs-based EM models:

I Matlab codes for DAC'14 [1]

    time_to_failure.m
    
        TTF (time_to_failure) = t_nuc (nucleation time) + t_grow (growth time)
   
        t_nuc: eq(5)
   
        t_grow: eq(7)

II Matlab codes for ASP-DAC'16 [2]

    1. constant.m
    
        Stress evolution model with constant current and temperature.

    2. random.m
        
        Stress evolution model wth the arbitrary piecewise constant currents (eq(7)).
  
    3. switch_off.m

        Stress relaxation after switching off the electric current.
   
    4. periodic_pulse.m:
        
        Stress evolution model for pulsed or bidirectional current loads (eq(8)-(11)).
   
    NOTE: random.m describes the general case. It gets the same results as model 1, model 2 and model 3 provided the same current and temperature waveforms.
    

III related_papers: contain the relevant papers published


IV References:
    
    [1] X. Huang, T. Yu, V. Sukharev and S. X.-D. Tan, “Physics-Based
    Electromigration Assessment for Power Grid Networks,” in
    Proc. Design Automation Conf. (DAC’14), San Francisco, June 2014. [dac14em_ana_ACM.pdf]
    
    [2] X. Huang, V. Sukharev, T. Kim, H. Chen and S. X.-D. Tan,
    “Electromigration Recovery Modeling and Analysis under
    Time-Dependent Current and Temperature Stressing," in Proc. Asia
    South Pacific Design Automation Conf. (ASP-DAC’16), Macao,
    Jan, 2016. [aspdac16em_dyn.pdf]
