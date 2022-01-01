// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FloorGeneration(){
	#macro TILE_SIZE 32
	
	FloorTiles = layer_tilemap_get_id("RoadTiles");
	BaseTiles = layer_tilemap_get_id("BaseRoadTiles");
	
	VERTICAL = tilemap_get_at_pixel(BaseTiles,1,33);
	HORIZONTAL = tilemap_get_at_pixel(BaseTiles,33,1);
	TOPLEFT = tilemap_get_at_pixel(BaseTiles,1,1);
	BOTTOMLEFT = tilemap_get_at_pixel(BaseTiles,1,65);
	TOPRIGHT = tilemap_get_at_pixel(BaseTiles,65,1);
	BOTTOMRIGHT = tilemap_get_at_pixel(BaseTiles,65,33);
	MIDDLE = tilemap_get_at_pixel(BaseTiles,33,65);
	EMPTY = tilemap_get_at_pixel(BaseTiles,33,33);
	
	randomise();
	last = 0;
	repeat (500)
	{
		dir = choose(0,1,2,3) * 90;
		
		if (dir == 0 and last == 0) or (dir == 180 and last ==180) {
			tilemap_set_at_pixel(FloorTiles, HORIZONTAL,x,y);
		}
		if (dir == 90 and last == 90) or (dir == 270 and last ==270) {
			tilemap_set_at_pixel(FloorTiles, VERTICAL,x,y);
		}
		
		x += lengthdir_x(TILE_SIZE, dir);
		y += lengthdir_y(TILE_SIZE, dir);
		last = dir;
	
	}
}