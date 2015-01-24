%% pancake-cigar, Hamish Dickson 24/01/2015

%
% Dumb implementation - what happens if you have a (large) pancake shaped collection of identical 
% particles with a gaussian distribution of velocities and limit the speed in one plane
%
% if you think about it, this isn't THAT dumb (it's just simple) as a first guess - stuff is in the way in the x-axis
% (other explosive material, going at a similar momentum)
%
% start out with a 2d "pancake" - ie a line on the x axis
% 

%% Initialization
clear ; close all; clc

% give each a random position on the line
p_x = randn(1000, 1);
p_y = zeros(1000, 1);

% plot em in a scatter graph
%scatter(p_x, p_y, [], sqrt(p_x.^2 + p_x.^2))

% get 100 random x's
u_x = randn(1000,1);

% get 100 random y's
u_y = randn(1000,1);

% I don't care about acceleration
t = 10;
slow_down_factor = 0.0001;

p_x = slow_down_factor * u_x * t + p_x;
p_y = u_y * t + p_y;
scatter(p_x, p_y, 20, sqrt(p_x.^2 + p_x.^2), 'filled')
