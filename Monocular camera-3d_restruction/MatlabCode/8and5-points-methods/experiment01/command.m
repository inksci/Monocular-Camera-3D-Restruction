
close all;clc

p_3d = [];

right_config = [inv(R_a), -inv(R_a)*t_u]; % PLEASE set the value here according to the results from 'batch.m'

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

figure()
plot3(p_3d(1,:), p_3d(2,:), p_3d(3,:), '.')