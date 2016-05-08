% stressfour.m
function f = stressfour5terminals(k,G1,G2,G3,G4,x,t,L)
% n = 2;
n = 1;
f = 0;

for i = 1 : n
    temp41 = (4+4*(i-1))*L-x;
    stress41 = (G1-G2+G3-G4)*gfunction(k,temp41,t);
        
    temp42 = (3+4*(i-1))*L-x;
    stress42 = -2*(G1+G2+G3-G4)*gfunction(k,temp42,t);
    
    temp43 = (2+4*(i-1))*L-x;
    stress43 = (G1-G2+G3-G4)*gfunction(k,temp43,t);
    
    temp44 = (1+4*(i-1))*L-x;
    stress44 = 4*G2*gfunction(k,temp44,t);
    
    temp45 = (3+4*(i-1))*L+x;
    stress45 = 4*G2*gfunction(k,temp45,t);
        
    temp46 = (2+4*(i-1))*L+x;
    stress46 = (G1-G2+G3-G4)*gfunction(k,temp46,t);
    
    temp47 = (1+4*(i-1))*L+x;
    stress47 = -2*(G1+G2+G3-G4)*gfunction(k,temp47,t);
    
    temp48 = (4*(i-1))*L+x;
    stress48 = (G1-G2+G3-G4)*gfunction(k,temp48,t);
   
    f = f-(stress41+stress42+stress43+stress44+stress45+stress46+stress47+stress48)/4;
end
    