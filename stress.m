sigma_x_surface = 6 * Mx / t^2;
sigma_y_surface = 6 * My / t^2;
tau_xy_surface = 6 * Mxy / t^2;

%%  应力分布绘图
% σ_x 表面
figure;
surf(X, Y, sigma_x_surface, 'EdgeColor', 'none');
xlabel('x'); ylabel('y'); zlabel('\sigma_{x, surface} (Pa)');
title('表面应力 \sigma_x 分布 (上表面拉应力)');
colorbar;

% σ_y 表面
figure;
surf(X, Y, sigma_y_surface, 'EdgeColor', 'none');
xlabel('x'); ylabel('y'); zlabel('\sigma_{y, surface} (Pa)');
title('表面应力 \sigma_y 分布 (上表面拉应力)');
colorbar;

% τ_xy 表面
figure;
surf(X, Y, tau_xy_surface, 'EdgeColor', 'none');
xlabel('x'); ylabel('y'); zlabel('\tau_{xy, surface} (Pa)');
title('表面剪应力 \tau_{xy} 分布 (上表面)');
colorbar;

fprintf('\n--- 表面应力计算结果 ---\n');
fprintf('σ_x 最大值 = %.2f Pa\n', max(abs(sigma_x_surface(:))));
fprintf('σ_y 最大值 = %.2f Pa\n', max(abs(sigma_y_surface(:))));
fprintf('τ_xy 最大值 = %.2f Pa\n', max(abs(tau_xy_surface(:))));