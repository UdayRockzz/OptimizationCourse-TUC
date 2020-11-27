function [ out ] = pos_res_model_sum( node_pos )

bec_pos = [ 8 6; -3 -3; 1 0; 8 -3];
bec_angle = [38; 220; 222; 300];

out = sum(abs((wrapTo360(atand((node_pos(2)-bec_pos(:,2)) ./ (node_pos(1)-bec_pos(:,1)))) - bec_angle)));
% out = sum((wrapTo360(atand((node_pos(2)-bec_pos(:,2)) ./ (node_pos(1)-bec_pos(:,1)))) - bec_angle));


end