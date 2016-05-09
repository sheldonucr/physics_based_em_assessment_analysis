% stressone.m
function f = stressone5terminals(k,G1,G2,G3,G4,x,t,L)
% n = 2;
n = 1;
f = 0;

for i = 1 : n
    temp11 = (3+4*(i-1))*L-x;
    stress11 = -4*G1*gfunction(k,temp11,t);
        
    temp12 = (2+4*(i-1))*L-x;
    stress12 = (G1-G2+G3-G4)*gfunction(k,temp12,t);
    
    temp13 = (1+4*(i-1))*L-x;
    stress13 = 2*(G1+G2-G3+G4)*gfunction(k,temp13,t);
    
    temp14 = (4*(i-1))*L-x;
    stress14 = (G1-G2+G3-G4)*gfunction(k,temp14,t);
    
    temp15 = (4+4*(i-1))*L+x;
    stress15 = (G1-G2+G3-G4)*gfunction(k,temp15,t);
        
    temp16 = (3+4*(i-1))*L+x;
    stress16 = 2*(G1+G2-G3+G4)*gfunction(k,temp16,t);
    
    temp17 = (2+4*(i-1))*L+x;
    stress17 = (G1-G2+G3-G4)*gfunction(k,temp17,t);
    
    temp18 = (1+4*(i-1))*L+x;
    stress18 = -4*G1*gfunction(k,temp18,t);
   
    f = f-(stress11+stress12+stress13+stress14+stress15+stress16+stress17+stress18)/4;
end
    
    
    
    
    