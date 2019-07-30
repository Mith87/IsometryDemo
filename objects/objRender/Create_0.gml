/// @description Build the isometric map

//layer_set_visible("CollisionMap", false);
//layer_set_visible("WorldMap", false);
//layer_set_visible("EntityMap", false);

global.worldMap = ds_grid_create(MAP_W, MAP_H);
global.entityMap = ds_grid_create(MAP_W, MAP_H);

var tileMapWorld = layer_tilemap_get_id("WorldMap");
var tileMapEntity = layer_tilemap_get_id("EntityMap");

for (var tX = 0; tX < MAP_W; tX++) {
	for (var tY = 0; tY < MAP_H; tY++) {
		
		var tileWorldData = tilemap_get(tileMapWorld, tX, tY);
		var tileEntityData = tilemap_get(tileMapEntity, tX, tY);
		
		//Format: [Sprite, Z]
		var worldTile = [-1, 0];
		var entityTile = [-1, 0];
		
		//World Tiles Init
		worldTile[TILE.SPRITE] = tileWorldData;
		worldTile[TILE.Z] = 0;
		if (worldTile[TILE.SPRITE] >= 4) worldTile[TILE.Z] = 64;
		
		//World Tiles Init
		entityTile[TILE.SPRITE] = tileEntityData;
		entityTile[TILE.Z] = 64;
		
		global.worldMap[# tX, tY] = worldTile;
		global.entityMap[# tX, tY] = entityTile;
	}
}

