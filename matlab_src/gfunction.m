% gfunction.m
function y = gfunction(diffcoef,location,time)
y = 2*sqrt(diffcoef*time/pi)*exp(-location*location/4/diffcoef/time)-location*erfc(location/2/sqrt(diffcoef*time));



