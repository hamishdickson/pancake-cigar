%% pancake-cigar, Hamish Dickson 24/01/2015

%
%% implementation 2 - a random walk
%

%
% ok, so what happens here is particles all start out close, with a gaussian distribution of momenta (they are still
% all the same mass, call that one, so the momentum is proportional to the velocity). When they are close, they are
% more likely to collide with another particle and change direction, so this model assumes
% 1) particles are more likely to change direction if they are close to the center
% 2) the new momentum ~ old momentum + gaussian "walk" (ie perturbation)
%

%
% note: I'm aware this doesn't really fit with a strict definition of a random walk (ie it's not that random), but it's
% how I came to think about this model
% 

%% Initialization
clear ; close all; clc

AXIS_SCALE = [-20 20 -20 20];
PARTICLES = 1000;
SQUISH = 100;
TIME_INCREMENT = 0.001;

%% first off - start with a ball - how would a ball expand?

p_x = randn(PARTICLES, 1);
p_y = randn(PARTICLES, 1) / SQUISH;
%p_y = randn(PARTICLES, 1);

% so, every particle has a velocity to start with
u_x = randn(PARTICLES,1);
u_y = randn(PARTICLES,1);

c = sqrt(u_x.^2 + u_y.^2);

%% initial state
scatter(p_x, p_y, 20, c, 'filled')
axis (AXIS_SCALE);
hold on;

pause (1);

p_x = u_x * TIME_INCREMENT + p_x;
p_y = u_y * TIME_INCREMENT + p_y;

clf;
scatter(p_x, p_y, 20, c, 'filled')
axis (AXIS_SCALE);

pause (1);

% after each time chunk, each particle has a probablity that it will "walk". The probablity is based on
% how dense the material around it is (the denser the material - the more likely it is to have a walk)

% lets assume the size of the walk is the same (we're dealing with very high evergy plasmers here)

% guess - probability of walk = 1 / sqrt((p_x / SQUISH).^2 + p_y.^2) ie the closer in it is, the more dense
% the material

%
% note: this doesn't do what I expected that could be for two (well 3) reasons
% 1) Dyson's model could be different - the particles in the centre could "explode" first, causing a chain
% 	reaction down the device. I am increaingly confident this is what he was talking about (it makes sense
%	in terms of neutrinos)
% 2) This model is way too simplistic. A good example would be momentum isn't conserved here
% 2) This could require a level of "fine tuning" which I've not found yet. This is possible, but I would have
%   expected this to be pretty robust
% 3) I suck a programming/physics in general. Pretty possible.
%

count = 0;

for t=1:5000
	count++;

	% if it's on the y axis, pretend it's actually further away - ie it will be in a region of lower
	% density, so it will perturbate less
	prob = (1 / sqrt((p_x).^2 + (p_y * SQUISH).^2))';

	u_x = u_x + prob .* (randn(PARTICLES,1) + u_x); % old speed + some random perturbation
	u_y = u_y + prob .* (randn(PARTICLES,1) + u_y);

	p_x = u_x * TIME_INCREMENT + p_x;
	p_y = u_y * TIME_INCREMENT + p_y;

	% print every 100th one
	if count == 1000
		count = 0;

		% ie the magnitude of the speed
		% red = hot
		% blue = cold
		c = sqrt(u_x.^2 + u_y.^2); 

		clf;
		scatter(p_x, p_y, 20, c, 'filled')
		axis (AXIS_SCALE);

		pause (1);
	end
end
