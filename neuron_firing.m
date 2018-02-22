%% Problem Set 2 
% Cathy Wang  2/22/18

%% Constants

k1 = 0.022;
k0 = 0.025;
theta = pi / 4;

%% Part 1 Distribution Comparison

% simulation of 100 randomly distributed neurons
r_100 = zeros(1,100);
theta_p_100 = 2 * pi .* rand(100,1)';

for i = 1:length(r_100)
    r_100(i) = k1 * cos(theta_p_100(i) - theta) + k0;
end

% calculate PV of each 100
PV_100 = zeros(2,100);
for i = 1:length(PV_100)
    PV_100(1, i) = r_100(i) * cos(theta_p_100(i));
    PV_100(2, i) = r_100(i) * sin(theta_p_100(i));
end

figure
plotv(PV_100)
title('Randomly Distributed Neural Preferred Directions')

% simulation of 100 uniformly distributed neurons
r_100_unif = zeros(1,100);
theta_p = linspace(0, 2*pi, 100)';

for i = 1:length(r_100_unif)
    r_100_unif(i) = k1*cos(theta - theta_p(i)) + k0;
end

% calculate PV of each 100
PV_100_unif = zeros(2,100);
for i = 1:length(PV_100_unif)
    PV_100_unif(1,i) = r_100_unif(i) * cos(theta_p(i));
    PV_100_unif(2,i) = r_100_unif(i) * sin(theta_p(i));
end

figure
plotv(PV_100_unif)
title('Uniformly Distributed Neural Preferred Directions')

%% Part 2 10^N Simulations

% simulation of 10 randomly distributed neurons
r_1 = zeros(1,10);
theta_p_1 = 2*pi .* rand(10,1)';

% calculate PV of each 10
PV_1 = zeros(1,10);
for i = 1:length(PV_1)
    r_1(i) = k1*cos(theta - theta_p_1(i)) + k0;
    PV_1(i) = r_1(i) * theta_p_1(i);
end

% calculate PV of each 100
PV_2 = zeros(1,100);
for i = 1:length(PV_2)
    PV_2(i) = r_100(i) * theta_p_100(i);
end

% simulation of 1000 randomly distributed neurons
r_3 = zeros(1,1000);
theta_p_3 = 2*pi .* rand(1000,1)';

% calculate PV of each 1000
PV_3 = zeros(1,1000);
for i = 1:length(PV_3)
    r_3(i) = k1*cos(theta - theta_p_3(i)) + k0;
    PV_3(i) = r_3(i) * theta_p_3(i);
end

% simulation of 10000 randomly distributed neurons
r_4 = zeros(1,10^4);
theta_p_4 = 2*pi .* rand(10^4,1)';

% calculate PV of each 10000
PV_4 = zeros(1,10^4);
for i = 1:length(PV_4)
    r_4(i) = k1*cos(theta - theta_p_4(i)) + k0;
    PV_4(i) = r_4(i) * theta_p_4(i);
end

% simulation of 10^5 randomly distributed neurons
r_5 = zeros(1,10^5);
theta_p_5 = 2*pi .* rand(10^5,1)';

% calculate PV of each 10^5
PV_5 = zeros(1,10^5);
for i = 1:length(PV_5)
    r_5(i) = k1*cos(theta - theta_p_5(i)) + k0;
    PV_5(i) = r_5(i) * theta_p_5(i);
end

% simulation of 10^6 randomly distributed neurons
r_6 = zeros(1,10^6);
theta_p_6 = 2*pi .* rand(10^6,1)';

% calculate PV of each 10^6
PV_6 = zeros(1,10^6);
for i = 1:length(PV_6)
    r_6(i) = k1*cos(theta - theta_p_6(i)) + k0;
    PV_6(i) = r_6(i) * theta_p_6(i);
end

%% Part 3 Finding RMSE

% summation of PV components
PV_tot_1 = sum(atan(PV_1)); 
PV_tot_2 = sum(atan(PV_2)); 
PV_tot_3 = sum(atan(PV_3)); 
PV_tot_4 = sum(atan(PV_4)); 
PV_tot_5 = sum(atan(PV_5));
PV_tot_6 = sum(atan(PV_6));

% find RMSE
RMSE = zeros(0,5);
RMSE(1) = sqrt(mean((atan(PV_1) - theta).^2));
RMSE(2) = sqrt(mean((atan(PV_2) - theta).^2));
RMSE(3) = sqrt(mean((atan(PV_3) - theta).^2));
RMSE(4) = sqrt(mean((atan(PV_4) - theta).^2));
RMSE(5) = sqrt(mean((atan(PV_5) - theta).^2));
RMSE(6) = sqrt(mean((atan(PV_6) - theta).^2));

RMSE(1) = sqrt(mean((PV_tot_1 - theta).^2));
RMSE(2) = sqrt(mean((PV_tot_2 - theta).^2));
RMSE(3) = sqrt(mean((PV_tot_3 - theta).^2));
RMSE(4) = sqrt(mean((PV_tot_4 - theta).^2));
RMSE(5) = sqrt(mean((PV_tot_5 - theta).^2));
RMSE(6) = sqrt(mean((PV_tot_6 - theta).^2));

plot(1:6,RMSE)
title('RMSE for 10^N neurons')
xlabel('N')
ylabel('RMSE')
