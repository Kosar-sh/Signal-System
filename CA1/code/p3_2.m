ts = 1e-9;        
fs = 1 / ts;     
T = 1e-5;         
tau = 1e-6;   
alpha=0.5;
C=3e8;

t = 0:ts:T;       
tlen = length(t); 

R=450;
t_d=2*R/C;
y=zeros(1,tlen);
start_td=round(t_d/ts)+1;
end_tau=round((t_d+tau)/ts)+1;
y(start_td:end_tau)=alpha*ones(1,end_tau-start_td+1);

figure;
plot(t, y,'r',LineWidth=4);
xlabel('Time ');
ylabel('input');
title('Input Signal');
grid on;