function [X] = synthetic_dataset(seed)

rng(seed);
% ----- Generate Swiss Roll with a Hole -----
n1 = 1000;  % Number of points
t = 3 * pi * (1 + 2 * rand(n1, 1));  % Random angles
h = 21 * rand(n1, 1);                % Heights
X_swiss = [t .* cos(t), h, t .* sin(t)];  % Swiss roll

% Remove points to create a hole
mask = ~(X_swiss(:, 1) > 8 & X_swiss(:, 1) < 12);
X_swiss = X_swiss(mask, :);

% ----- Generate Torus -----
n2 = 500;  % Number of points for the torus
theta = 2 * pi * rand(n2, 1);
phi = 2 * pi * rand(n2, 1);
r = 1;  % Minor radius
R = 5;  % Major radius
X_torus = [r * sin(theta), (R + r * cos(theta)) .* cos(phi), (R + r * cos(theta)) .* sin(phi)];

% ----- Generate Sphere -----
n3 = 250;  % Number of points for the sphere
[u, v] = meshgrid(linspace(0, 2 * pi, sqrt(n3)), linspace(0, pi, sqrt(n3)));
u = u(:);
v = v(:);
r_sphere = 2;  % Radius of the sphere
X_sphere = [r_sphere * sin(v) .* cos(u), r_sphere * sin(v) .* sin(u), r_sphere * cos(v)];

% Combine all shapes
X = [X_swiss; X_torus + [0 10 0]; X_sphere + [0 10 0]];

end