ts = 1e-9;        
fs = 1 / ts;     
T = 1e-5;         
tau = 1e-6;   
alpha=0.5;
C=3e8;
t = 0:ts:T;       
tlen = length(t); 
R_orig=450;
t_d=2*R_orig/C;
x = zeros(1, tlen);
one_value = 1:round(tau/ts);
x(one_value) = 1;
y=zeros(1,tlen);
start_td=round(t_d/ts)+1;
end_tau=round((t_d+tau)/ts)+1;
y(start_td:end_tau)=alpha*ones(1,end_tau-start_td+1);

ro=zeros(1,tlen-round(tau/ts));
for i=1:tlen-round(tau/ts)
    ro(i)=innerproduct(y(i:i+round(tau/ts)-1),x);
end

[val,ind]=max(ro);
td=(ind-1)*ts;
R_calculated=C*td/2;
fprintf("calculated distance is :%.4f \n",R_calculated);
figure
plot(t(1:tlen-round(tau/ts)),ro,'LineWidth',2)
xlabel('Time')
ylabel('Correlation')
grid on

