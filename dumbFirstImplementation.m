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
% there are a few improvements that could be made here to make this run smoother, but it's really not worth it for 
% such a simple model
% 

%% Initialization
clear ; close all; clc

MAX_TIME = 3;
TIME_INCREMENT = 1;
SLOW_DOWN_FACTOR = 0.0001;

PAUSE_TIME = 0; % turns out you don't really need this - octave takes ages to create a graph of 1000 particles!

PARTICLES = 1000;

AXIS_SCALE = [-20 20 -20 20];

% give each a random position on the line
p_x = randn(PARTICLES, 1);
p_y = zeros(PARTICLES, 1);

% get 100 random velocities in the x dirn, but slow them down
u_x = SLOW_DOWN_FACTOR * randn(PARTICLES,1);

% get 100 random velocities in the y dirn
u_y = randn(PARTICLES,1);

c = sqrt(u_x.^2 + u_y.^2);

for t = 0 : TIME_INCREMENT*MAX_TIME;
	time = t*TIME_INCREMENT

	% I don't care about acceleration
	p_x = u_x * time + p_x;
	p_y = u_y * time + p_y;

	scatter(p_x, p_y, 20, c, 'filled')
	axis (AXIS_SCALE);
	
	title ('Dumb implementation of pancake expanding into a cigar - actually not that bad ');
	pause (PAUSE_TIME);
	hold on;

	if t = TIME_INCREMENT*MAX_TIME;
		hold off
	else
		clf;
	end
end

hold off;