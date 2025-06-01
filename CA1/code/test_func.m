t=1:1000;
x=rand(1,1000)*(2+1)-1;
tlen=length(t);
sigma=0.5;
noise=sigma*randn(1,tlen);
y=2.3*x-1.2;
y=y+noise;

[alpha,beta]=p2_4(x,y);
fprintf('alpha: %.4f\n', alpha);
fprintf('beta: %.4f\n', beta);

figure
plot(x,y,'.')
title('system');
xlabel('input x')
ylabel('output y')