% Purpose: choose the right config of cameras and make 3d restructions.
% you need set the value according to the results from 'batch.m', and 
% vertificate the ouputs 
%%

close all;clc

% (vertification) all the z value ought to be bigger than zero.
p_3d = [];

right_config = [inv(R_b), -inv(R_b)*t_u]; % PLEASE set the value here according to the results from 'batch.m'

for j=1:size(uv1, 2)
    p_3d(:,j) = cams_to_3d( K*[eye(3), [0, 0, 0]'],...
        K*right_config, uv1(:,j), uv2(:,j) ); 
    
    tmp = right_config* [p_3d(:,j); 1];
    if (p_3d(3,j)<0) | (tmp(3)<0)
        disp(' ----------- error info: ')
        j
        p_3d(:,j)
        right_config* [p_3d(:,j); 1]
        disp(' --- ')
    end
end

% figure()
% plot3(P(1,:), P(2,:), P(3,:), '.')

% vertification: outputs here ought to keep the same
for j=1:2:7
    norm(P(:,j)-P(:,j+1)) / norm(p_3d(:,j)-p_3d(:,j+1))
end