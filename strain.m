G = E / (2 * (1 + miu));             % 剪切模量

% 计算应变分量
epsilon_x = (sigma_x_surface - miu * sigma_y_surface) / E;
epsilon_y = (sigma_y_surface - miu * sigma_x_surface) / E;
gamma_xy = tau_xy_surface / G;        

%% 计算主应变与最大应变 (平面应力状态)
eps_mean = (epsilon_x + epsilon_y) / 2;
eps_diff = (epsilon_x - epsilon_y) / 2;
gamma_half = gamma_xy / 2;
radius = sqrt(eps_diff.^2 + gamma_half.^2);
epsilon1 = eps_mean + radius;
epsilon2 = eps_mean - radius;
% 最大绝对值的主应变 
epsilon_max = max(abs(epsilon1), abs(epsilon2));

% 绘制应变图 

% ε_x
figure;
surf(X, Y, epsilon_x, 'EdgeColor', 'none');
xlabel('x'); ylabel('y'); zlabel('\epsilon_x');
title('表面应变 \epsilon_x 分布');
colorbar;

% ε_y
figure;
surf(X, Y, epsilon_y, 'EdgeColor', 'none');
xlabel('x'); ylabel('y'); zlabel('\epsilon_y');
title('表面应变 \epsilon_y 分布');
colorbar;

% γ_xy
figure;
surf(X, Y, gamma_xy, 'EdgeColor', 'none');
xlabel('x'); ylabel('y'); zlabel('\gamma_{xy}');
title('表面剪应变 \gamma_{xy} 分布');
colorbar;

% 主应变 ε1
figure;
surf(X, Y, epsilon1, 'EdgeColor', 'none');
xlabel('x'); ylabel('y'); zlabel('\epsilon_1');
title('主应变 \epsilon_1 分布');
colorbar;

% 主应变 ε2
figure;
surf(X, Y, epsilon2, 'EdgeColor', 'none');
xlabel('x'); ylabel('y'); zlabel('\epsilon_2');
title('主应变 \epsilon_2 分布');
colorbar;

% 最大绝对值主应变 ε_max 分布
figure;
surf(X, Y, epsilon_max, 'EdgeColor', 'none');
xlabel('x'); ylabel('y'); zlabel('\epsilon_{max}');
title('最大主应变 (绝对值) 分布');
colorbar;

%%
fprintf('ε_x 绝对值最大值 = %.2e\n', max(abs(epsilon_x(:))));
fprintf('ε_y 绝对值最大值 = %.2e\n', max(abs(epsilon_y(:))));
fprintf('γ_xy 绝对值最大值 = %.2e\n', max(abs(gamma_xy(:))));
fprintf('ε_1 绝对值最大值 = %.2e\n', max(abs(epsilon1(:))));
fprintf('ε_2 绝对值最大值 = %.2e\n', max(abs(epsilon2(:))));
fprintf('ε_max = %.2e\n', max(epsilon_max(:)));