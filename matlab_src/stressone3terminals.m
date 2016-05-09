% stressone.m
function f = stressone3terminals(k,G1,G2,x,t,L)
n = 2;
% n = 10;
f = 0;

for i = 1 : n
    temp11 = (3+4*(i-1))*L-x;
    stress11 = 2*G1*gfunction(k,temp11,t);
        
    temp12 = (2+4*(i-1))*L-x;
    stress12 = (G2-G1)*gfunction(k,temp12,t);
    
    temp13 = (1+4*(i-1))*L-x;
    stress13 = -2*G2*gfunction(k,temp13,t);
    
    temp14 = (4*(i-1))*L-x;
    stress14 = (G2-G1)*gfunction(k,temp14,t);
    
    temp15 = (4+4*(i-1))*L+x;
    stress15 = (G2-G1)*gfunction(k,temp15,t);
        
    temp16 = (3+4*(i-1))*L+x;
    stress16 = -2*G2*gfunction(k,temp16,t);
    
    temp17 = (2+4*(i-1))*L+x;
    stress17 = (G2-G1)*gfunction(k,temp17,t);
    
    temp18 = (1+4*(i-1))*L+x;
    stress18 = 2*G1*gfunction(k,temp18,t);
   
    f = f+(stress11+stress12+stress13+stress14+stress15+stress16+stress17+stress18)/2;
end


    


% n = 10;
% y = zeros(1,n);
% 
% temp11 = zeros(1,n);
% temp12 = zeros(1,n);
% temp13 = zeros(1,n);
% temp14 = zeros(1,n);
% temp15 = zeros(1,n);
% temp16 = zeros(1,n);
% temp17 = zeros(1,n);
% temp18 = zeros(1,n);
% 
% stress11 = zeros(1,n);
% stress12 = zeros(1,n);
% stress13 = zeros(1,n);
% stress14 = zeros(1,n);
% stress15 = zeros(1,n);
% stress16 = zeros(1,n);
% stress17 = zeros(1,n);
% stress18 = zeros(1,n);
% 
% for i = 1 : n
%     temp11(i) = (3+4*(i-1))*L-x;
%     stress11(i) = 2*G1*gfunction(k,temp11(i),t);
%         
%     temp12(i) = (2+4*(i-1))*L-x;
%     stress12(i) = (G2-G1)*gfunction(k,temp12(i),t);
%     
%     temp13(i) = (1+4*(i-1))*L-x;
%     stress13(i) = -2*G2*gfunction(k,temp13(i),t);
%     
%     temp14(i) = (4*(i-1))*L-x;
%     stress14(i) = (G2-G1)*gfunction(k,temp14(i),t);
%     
%     temp15(i) = (4+4*(i-1))*L+x;
%     stress15(i) = (G2-G1)*gfunction(k,temp15(i),t);
%         
%     temp16(i) = (3+4*(i-1))*L+x;
%     stress16(i) = -2*G2*gfunction(k,temp16(i),t);
%     
%     temp17(i) = (2+4*(i-1))*L+x;
%     stress17(i) = (G2-G1)*gfunction(k,temp17(i),t);
%     
%     temp18(i) = (1+4*(i-1))*L+x;
%     stress18(i)= 2*G1*gfunction(k,temp18(i),t);
%    
%     y(i) = (stress11(i)+stress12(i)+stress13(i)+stress14(i)+stress15(i)+stress16(i)+stress17(i)+stress18(i))/2;
% end
% 
% f = 0;
% for i = 1 : n
%     f = f+y(i);
% end
    
    
    
    
    