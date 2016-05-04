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
    

related_papers: contain the relevant papers published


References:
    
    [1] X. Huang, T. Yu, V. Sukharev and S. X.-D. Tan, “Physics-Based
    Electromigration Assessment for Power Grid Networks,” in
    Proc. Design Automation Conf. (DAC’14), San Francisco, June 2014. [dac14em_ana_ACM.pdf]
    
    [2] X. Huang, V. Sukharev, T. Kim, H. Chen and S. X.-D. Tan,
    “Electromigration Recovery Modeling and Analysis under
    Time-Dependent Current and Temperature Stressing," in Proc. Asia
    South Pacific Design Automation Conf. (ASP-DAC’16), Macao,
    Jan, 2016. [aspdac16em_dyn.pdf]
