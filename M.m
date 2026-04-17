Mx = zeros((m+1),(n+1));  
My = zeros((m+1),(n+1));
Mxy = zeros((m+1),(n+1));

for i = 2:m-1          
    for j = 2:n-1      
        % 二阶偏导
        wxx = (UYX(i, j-1) - 2*UYX(i, j) + UYX(i, j+1)) / hx^2;
        wyy = (UYX(i-1, j) - 2*UYX(i, j) + UYX(i+1, j)) / hy^2;
        wxy = (UYX(i+1, j+1) - UYX(i+1, j-1) - UYX(i-1, j+1) + UYX(i-1, j-1)) / (4*hx*hy);
        
        % 弯矩
        Mx(i,j) = -D * (wxx + miu * wyy);
        My(i,j) = -D * (wyy + miu * wxx);
        Mxy(i,j) = -D * (1 - miu) * wxy;
    end
end

x2 = (0:n)*hx;          
y = (0:m)*hy;          
[X, Y] = meshgrid(x2, y);


%% 分别绘制三个弯矩图
% Mx
figure;
surf(X, Y, Mx, 'EdgeColor', 'none');
xlabel('x'); ylabel('y'); zlabel('Mx');
title('弯矩 M_x 分布');
colorbar;

% My
figure;
surf(X, Y, My, 'EdgeColor', 'none');
xlabel('x'); ylabel('y'); zlabel('My');
title('弯矩 M_y 分布');
colorbar;

% Mxy 
figure;
surf(X, Y, Mxy, 'EdgeColor', 'none');
xlabel('x'); ylabel('y'); zlabel('M_{xy}');
title('弯矩 M_{xy} 分布');
colorbar;
fprintf('Mx 最大值 = %.2f N·m/m\n', max(Mx(:)));
fprintf('My 最大值 = %.2f N·m/m\n', max(My(:)));
fprintf('Mxy 绝对值最大值 = %.2f N·m/m\n', max(abs(Mxy(:))));