/// @description Render Game

var tileWorldData, tileEntityData, roomX, roomY, tileIndex, tileZ;

for (var tX = 0; tX < MAP_W; tX++) {
	for (var tY = 0; tY < MAP_H; tY++) {
		
		tileWorldData = global.worldMap[# tX, tY];
		tileEntityData = global.entityMap[# tX, tY];
		
		roomX = scrMapXToRoomX(tX, tY);
		roomY = scrMapYToRoomY(tX, tY);
		
		tileIndex = tileWorldData[TILE.SPRITE];
		tileZ = tileWorldData[TILE.Z];
		
		if ((scrRoomXToMapX(mouse_x, mouse_y) == tX) && (scrRoomYToMapY(mouse_x, mouse_y) == tY)) {
			tileIndex = 5;
			tileZ += 2;
		}
		
		if(tileIndex != 0) {
			
			switch (tileIndex) {
				case 4: 
					draw_sprite(sprWallPlaceholder, 0, roomX, roomY - tileZ); 
					break;
				case 5:
					draw_sprite(sprWallPlaceholder, 1, roomX, roomY - tileZ); 
					break;
				case 6:
					draw_sprite(sprWallPlaceholder, 2, roomX, roomY - tileZ); 
					break;
				default: 
					draw_sprite(sprFloorPlaceholder, tileIndex-1, roomX, roomY - tileZ);
			}
			
		}
		
		tileIndex = tileEntityData[TILE.SPRITE];
		tileZ = tileEntityData[TILE.Z];
		
		if(tileIndex != 0) {
			draw_sprite(sprPlayerRoomPlaceholder, tileIndex-1, roomX, roomY - tileZ);		
		}

	}
}