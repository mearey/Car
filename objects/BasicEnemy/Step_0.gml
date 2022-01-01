/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

if true {
	force_strength = maxSpeed*30;
	theta = image_angle;
	xvec = lengthdir_x(force_strength,theta)  
	yvec = lengthdir_y(force_strength,theta)  
	physics_apply_force( x, y, xvec, yvec );
}

if (point_direction(x,y,Player.x,Player.y) > image_angle) {
	physics_apply_angular_impulse(-maxHandling*1.5);
}
if (point_direction(x,y,Player.x,Player.y) < image_angle) {
	physics_apply_angular_impulse(+maxHandling*1.5);
}

//create drift particles
if !(abs(image_angle - point_direction(0, 0, phy_speed_x, phy_speed_y)) < 50) {
	part_type_orientation(global.DriftParticle, image_angle,image_angle,0,0,0)
	part_type_direction(global.DriftParticle,image_angle,image_angle,0,0);
	part_particles_create(global.p_system, x, y, global.DriftParticle, 1);
}

//shooting
if (point_direction(x,y,Player.x,Player.y) - image_angle < 25 and point_direction(x,y,Player.x,Player.y) - image_angle > 0) or (point_direction(x,y,Player.x,Player.y) - image_angle > -25 and point_direction(x,y,Player.x,Player.y) - image_angle < 0) {
	if timer <= 0 {
		timer = ShotCooldown;
		x_ = (((x + Player.x)/2) + x)/2
		y_ = (((y + Player.y)/2) + y)/2
		instance_create_depth(x_,y_,0,BasicShot);
	}
	timer -= FireRate;
}