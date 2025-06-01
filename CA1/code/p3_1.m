ts = 1e-9;        
fs = 1 / ts;     
T = 1e-5;         
tau = 1e-6;   

t = 0:ts:T;       
tlen = length(t); 

x = zeros(1, tlen);
one_value = 1:round(tau/ts);
x(one_value) = 1;

figure;
plot(t, x,'r',LineWidth=5);
xlabel('Time ');
ylabel('input');
title('Input Signal');
grid on;