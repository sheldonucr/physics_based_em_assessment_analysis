% stresstwo.m
function f = stresstwo5terminals(k,G1,G2,G3,G4,x,t,L)
% n = 2;
n = 1;
f = 0;

for i = 1 : n
    temp21 = (4+4*(i-1))*L-x;
    stress21 = (G1-G2+G3-G4)*gfunction(k,temp21,t);
        
    temp22 = (3+4*(i-1))*L-x;
    stress22 = -2*(G1+G2+G3-G4)*gfunction(k,temp22,t);
    
    temp23 = (2+4*(i-1))*L-x;
    stress23 = (G1-G2+G3-G4)*gfunction(k,temp23,t);
    
    temp24 = (1+4*(i-1))*L-x;
    stress24 = 4*G2*gfunction(k,temp24,t);
    
    temp25 = (3+4*(i-1))*L+x;
    stress25 = 4*G2*gfunction(k,temp25,t);
        
    temp26 = (2+4*(i-1))*L+x;
    stress26 = (G1-G2+G3-G4)*gfunction(k,temp26,t);
    
    temp27 = (1+4*(i-1))*L+x;
    stress27 = -2*(G1+G2+G3-G4)*gfunction(k,temp27,t);
    
    temp28 = (4*(i-1))*L+x;
    stress28 = (G1-G2+G3-G4)*gfunction(k,temp28,t);
   
    f = f-(stress21+stress22+stress23+stress24+stress25+stress26+stress27+stress28)/4;
end
    
    
    
    
    