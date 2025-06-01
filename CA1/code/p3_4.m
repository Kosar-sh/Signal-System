ts = 1e-9;        
fs = 1 / ts;     
T = 1e-5;         
tau = 1e-6;   
alpha = 0.5;
C = 3e8;
t = 0:ts:T;       
tlen = length(t); 
R1 = 450;
t_d = 2 * R1 / C;
x = zeros(1, tlen);
one_index = 1:round(tau/ts);
x(one_index) = 1;
y = zeros(1, tlen);
one_value = round(t_d/ts) + 1;
end_tau = round((t_d + tau)/ts) + 1;
y(one_value:end_tau) = alpha * ones(1, end_tau - one_value + 1);

max_noise = 4;
delta = 0.02;
num_noise_levels = round(max_noise / delta) + 1; 
noise_values = zeros(1, num_noise_levels);
noise_distance = zeros(1, num_noise_levels);
counter = 1;
tau_samples = round(tau/ts); 

for i = 0:delta:max_noise
    difference_distance = 0;
    for j = 1:101
        noise = i * randn(1, tlen);
        y_noisy = y + noise;
        ro = zeros(1, tlen - tau_samples);
        for m = 1:(tlen - tau_samples)
            ro(m) = dot(y_noisy(m:m + tau_samples - 1), x(1:tau_samples));
        end
        [value, index] = max(ro);
        td = (index - 1) * ts;
        R2 = C * td / 2;
        difference_distance = difference_distance + abs(R1 - R2);
    end
    distance_mean=difference_distance / 101;
    noise_values(counter) = i;
    noise_distance(counter) = distance_mean; 
    counter = counter + 1;
    if distance_mean<10
        fprintf('the noise value %.4f has the distance %.4f \n',i,distance_mean);
    else
        fprintf('the noise value %.4f is not in the range \n',i);
    end
end
figure;
plot(noise_values, noise_distance);
xlabel('Noise Strength');
ylabel('Average Distance');
title('3-4');
grid on;

