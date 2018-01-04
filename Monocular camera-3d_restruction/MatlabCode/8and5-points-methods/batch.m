% Purpose: here we test which is the right one from 4
% types configurations of cameras.

clc

disp(' --1-- ')
p_3d = cams_to_3d( K*[eye(3), [0, 0, 0]'], K*[inv(R_a), -inv(R_a)*t_u], uv1(:,1), uv2(:,1) )

[inv(R_a), -inv(R_a)*t_u]* [p_3d; 1]

disp(' --2-- ')
p_3d = cams_to_3d( K*[eye(3), [0, 0, 0]'], K*[inv(R_a), inv(R_a)*t_u], uv1(:,1), uv2(:,1) )

[inv(R_a), inv(R_a)*t_u]* [p_3d; 1]

disp(' --3-- ')
p_3d = cams_to_3d( K*[eye(3), [0, 0, 0]'], K*[inv(R_b), -inv(R_b)*t_u], uv1(:,1), uv2(:,1) )

[inv(R_b), -inv(R_b)*t_u]* [p_3d; 1]

disp(' --4-- ')
p_3d = cams_to_3d( K*[eye(3), [0, 0, 0]'], K*[inv(R_b), inv(R_b)*t_u], uv1(:,1), uv2(:,1) )

[inv(R_b), inv(R_b)*t_u]* [p_3d; 1]