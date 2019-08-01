
dsDepthGrid = ds_grid_create(2, 1);

instPlayerMap = noone;
instPlayerRoom = noone;

//layer_set_visible("CollisionMap", false);
//layer_set_visible("WorldMap", false);
layer_set_visible("EntityMap", false);

var tileMapWorldL1 = layer_tilemap_get_id("WorldMapL1");
var tileMapWorldL2 = layer_tilemap_get_id("WorldMapL2");
var tileMapEntity = layer_tilemap_get_id("EntityMap");

for (var tX = 0; tX < MAP_W; tX++) {
	for (var tY = 0; tY < MAP_H; tY++) {
		
		var roomX = scrMapXToRoomX(tX, tY);
		var roomY = scrMapYToRoomY(tX, tY);
		
		var tileWorldDataL1 = tilemap_get(tileMapWorldL1, tX, tY);
		var tileWorldDataL2 = tilemap_get(tileMapWorldL2, tX, tY);
		var tileEntityData = tilemap_get(tileMapEntity, tX, tY);
		
		//Format: [Sprite, Z]
		var worldTile = [-1, 0];
		var entityTile = [-1, 0];
		
		if( tileWorldDataL1 != 0 ) {
		
			//World Tiles Init
			worldTile[TILE.SPRITE] = tileWorldDataL1;
			worldTile[TILE.Z] = 64;
			
			//Create objBlockRoom# from world tile sprite index;
			if (worldTile[TILE.SPRITE] != 0) {
				instance_create_layer(roomX, roomY + worldTile[TILE.Z], "InstancesL1", 
					asset_get_index("objFloorRoom" + string(worldTile[TILE.SPRITE])));
			}
		}
		
		if( tileWorldDataL2 != 0 ) {
		
			//World Tiles Init
			worldTile[TILE.SPRITE] = tileWorldDataL2;
			worldTile[TILE.Z] = 0;
			
			//Create objBlockRoom# from world tile sprite index;
			if (worldTile[TILE.SPRITE] != 0) {
				instance_create_layer(roomX, roomY, "InstancesL2", 
					asset_get_index("objBlockRoom" + string(worldTile[TILE.SPRITE])));
			}
		}
		
		if( tileEntityData != 0 ) {
		
			//Entity Tiles Init
			entityTile[TILE.SPRITE] = tileEntityData;
			entityTile[TILE.Z] = 64;
			
			//Get Player Start Position
			if( tileEntityData == 1) {
				instPlayerMap = instance_create_layer(tX * 16, tX * 16, "InstancesL2", objPlayerMap);
				instPlayerRoom = instance_create_layer(roomX, roomY, "InstancesL2", objPlayerRoom);
			}
		}
		
	}
}