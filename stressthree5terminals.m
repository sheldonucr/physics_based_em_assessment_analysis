% stressthree.m
function f = stressthree5terminals(k,G1,G2,G3,G4,x,t,L)
% n = 2;
n = 1;
f = 0;

for i = 1 : n
    temp31 = (3+4*(i-1))*L-x;
    stress31 = -4*G3*gfunction(k,temp31,t);
        
    temp32 = (2+4*(i-1))*L-x;
    stress32 = (G1-G2+G3-G4)*gfunction(k,temp32,t);
    
    temp33 = (1+4*(i-1))*L-x;
    stress33 = 2*(-G1+G2+G3+G4)*gfunction(k,temp33,t);
    
    temp34 = (4*(i-1))*L-x;
    stress34 = (G1-G2+G3-G4)*gfunction(k,temp34,t);
    
    temp35 = (4+4*(i-1))*L+x;
    stress35 = (G1-G2+G3-G4)*gfunction(k,temp35,t);
        
    temp36 = (3+4*(i-1))*L+x;
    stress36 = 2*(-G1+G2+G3+G4)*gfunction(k,temp36,t);
    
    temp37 = (2+4*(i-1))*L+x;
    stress37 = (G1-G2+G3-G4)*gfunction(k,temp37,t);
    
    temp38 = (1+4*(i-1))*L+x;
    stress38 = -4*G3*gfunction(k,temp38,t);
   
    f = f-(stress31+stress32+stress33+stress34+stress35+stress36+stress37+stress38)/4;
end
    
    
    
    
    