%% pancake-cigar, Hamish Dickson 24/01/2015

%
%% implementation 2 - a random walk
%

%
% ok, so what happens here is particles all start out close, with a gaussian distribution of momenta (they are still
% all the same mass, call that one, so the momentum is proportional to the velocity). When they are close, they are
% more likely to collide with another particle and change direction, so this model assumes
% 1) particles are more likely to change direction if they are close to the center
% 2) the new momentum ~ old momentum + gaussian "walk"
%

%
% note: I'm aware this doesn't really fit with a strict definition of a random walk (ie it's not that random), but it's
% how I came to think about this model
% 

%% Initialization
clear ; close all; clc

AXIS_SCALE = [-20 20 -20 20];
PARTICLES = 1000;
SQUISH = 5;

%% first off - start with a ball - how would a ball expand?

p_x = randn(PARTICLES, 1);
p_y = randn(PARTICLES, 1) / SQUISH;

%u_x = randn(PARTICLES,1);
%u_y = randn(PARTICLES,1);

c = sqrt((p_x / SQUISH).^2 + p_y.^2);

scatter(p_x, p_y, 20, c, 'filled')
axis (AXIS_SCALE);
