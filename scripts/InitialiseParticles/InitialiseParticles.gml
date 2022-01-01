// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function InitialiseParticles() {
	global.p_system = part_system_create_layer("particles", false);
	global.DriftParticle = part_type_create();
	part_type_sprite(global.DriftParticle,TireParticle,0,0,0);
	part_type_blend(global.DriftParticle,0);
	part_type_life(global.DriftParticle,900,1000);
}