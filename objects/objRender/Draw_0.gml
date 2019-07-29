/// @description Render Game

var tileData, roomX, roomY, tileIndex, tileZ;

for (var tX = 0; tX < MAP_W; tX++) {
	for (var tY = 0; tY < MAP_H; tY++) {
		
		tileData = global.theMap[# tX, tY];
		
		roomX = scrMapXToRoomX(tX, tY);
		roomY = scrMapYToRoomY(tX, tY);
		
		tileIndex = tileData[TILE.SPRITE];
		tileZ = tileData[TILE.Z];
		
		if(tileIndex != 0) {
			draw_sprite(sprFloorPlaceholder, tileIndex-1, roomX, roomY - tileZ);
			
			if(tileIndex >= 4) {
				draw_sprite(sprWallPlaceholder, (tileIndex * 0.5)-1, roomX, roomY - tileZ);
			}
		}
	}
}
