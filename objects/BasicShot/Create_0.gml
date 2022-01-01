/// @description Insert description here
// You can write your code in this editor
mask_index = spr_empty;
direction = point_direction(x,y,Player.x,Player.y);
image_angle = direction;
force_strength = 3000;
theta = image_angle;
xvec = lengthdir_x(force_strength,theta)  
yvec = lengthdir_y(force_strength,theta)  
physics_apply_force( x, y, xvec, yvec );