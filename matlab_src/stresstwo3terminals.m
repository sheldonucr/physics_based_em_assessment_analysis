% stresstwo.m
function f = stresstwo3terminals(k,G1,G2,x,t,L)
n = 2;
% n = 10;
f = 0;

for i = 1 : n
    temp21 = (4+4*(i-1))*L-x;
    stress21 = (G2-G1)*gfunction(k,temp21,t);
        
    temp22 = (3+4*(i-1))*L-x;
    stress22 = 2*G1*gfunction(k,temp22,t);
    
    temp23 = (2+4*(i-1))*L-x;
    stress23 = (G2-G1)*gfunction(k,temp23,t);
    
    temp24 = (1+4*(i-1))*L-x;
    stress24 = -2*G2*gfunction(k,temp24,t);
    
    temp25 = (3+4*(i-1))*L+x;
    stress25 = -2*G2*gfunction(k,temp25,t);
        
    temp26 = (2+4*(i-1))*L+x;
    stress26 = (G2-G1)*gfunction(k,temp26,t);
    
    temp27 = (1+4*(i-1))*L+x;
    stress27 = 2*G1*gfunction(k,temp27,t);
    
    temp28 = (4*(i-1))*L+x;
    stress28 = (G2-G1)*gfunction(k,temp28,t);
   
    f = f+(stress21+stress22+stress23+stress24+stress25+stress26+stress27+stress28)/2;
end
    
    
    
    
    