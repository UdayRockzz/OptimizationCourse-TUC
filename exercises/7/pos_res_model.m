function [ out ] = pos_res_model( node_pos, bec_pos )

% out = wrapTo360(atand((node_pos(2)-bec_pos(:,2)) ./ (node_pos(1)-bec_pos(:,1))));

X = node_pos(1) - bec_pos(:,1);
Y = node_pos(2) - bec_pos(:,2);
out = wrapTo360(atan2d(Y,X));


end