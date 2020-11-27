function [ out ] = pos_res_vec( node_pos, bec_pos, bec_angle )

% out = wrapTo360(atand((node_pos(2)-bec_pos(:,2)) ./ (node_pos(1)-bec_pos(:,1))));

% u = [1 2 0];
% v = [1 0 0];
% CosTheta = dot(u,v)/(norm(u)*norm(v));
% ThetaInDegrees = acosd(CosTheta);

alpha_1 = [ bec_pos(:,1) - node_pos(1), bec_pos(:,2) - node_pos(2) ];

alpha_2 = [cosd(bec_angle), sind(bec_angle)];

out = acosd(sum(alpha_1.*alpha_2,2) ./ (sqrt(sum(alpha_1.^2,2)).*sqrt(sum(alpha_2.^2,2))));

end