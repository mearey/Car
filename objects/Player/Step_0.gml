/// @description Insert description here
// You can write your code in this editor
key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_down = keyboard_check(ord("S"));
key_up = keyboard_check(ord("W"));
drifting = keyboard_check(ord(" "));

//movement and drifting

if drifting {
	force_strength = maxSpeed*15;
	theta = image_angle-180;
	xvec = lengthdir_x(force_strength,theta)  
	yvec = lengthdir_y(force_strength,theta)  
	physics_apply_force( x, y, xvec, yvec );
}

if key_up {
	force_strength = maxSpeed*30;
	theta = image_angle;
	xvec = lengthdir_x(force_strength,theta)  
	yvec = lengthdir_y(force_strength,theta)  
	physics_apply_force( x, y, xvec, yvec );
}

if (key_left and phy_speed > 0.5) or (key_left and phy_speed < -0.5) {
	if drifting {
		physics_apply_angular_impulse(-maxHandling*1.5);
	}
	physics_apply_angular_impulse(-maxHandling*1.5);
}
if (key_right and phy_speed > 0.5) or (key_right and phy_speed < -0.5) {
	if drifting {
		physics_apply_angular_impulse(+maxHandling*1.5);
	}
	physics_apply_angular_impulse(+maxHandling*1.5);
}


if key_down {
	force_strength = maxSpeed*15;
	theta = image_angle-180;
	xvec = lengthdir_x(force_strength,theta)  
	yvec = lengthdir_y(force_strength,theta)  
	physics_apply_force( x, y, xvec, yvec );
}

//create drift particles
if !(abs(image_angle - point_direction(0, 0, phy_speed_x, phy_speed_y)) < 50) {
	part_type_orientation(global.DriftParticle, image_angle,image_angle,0,0,0)
	part_type_direction(global.DriftParticle,image_angle,image_angle,0,0);
	part_particles_create(global.p_system, x, y, global.DriftParticle, 1);
}