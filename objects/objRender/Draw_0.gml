
//Begin Depth Sorting
var dsInstGrid = dsDepthGrid;
var instCount = instance_number(objDepth);

ds_grid_resize(dsInstGrid, 2, instCount);

var i = 0; with(objDepth) {

	dsInstGrid[# 0, i] = id;
	dsInstGrid[# 1, i] = y;
	i++;
}

ds_grid_sort(dsInstGrid, 1, true);

var inst;
var i = 0; repeat(instCount) {
	inst = dsInstGrid[# 0, i];
	
	with(inst) {
		event_perform(ev_draw, 0);
	}
	
	i++;
}

//Render Movement of Player in Map
var mapX = scrRoomXToMapX(instPlayerRoom.x, instPlayerRoom.y) * 16;
var mapY = scrRoomYToMapY(instPlayerRoom.x, instPlayerRoom.y) * 16;
instPlayerMap.x = mapX;
instPlayerMap.y = mapY;

//For tracking current player position
draw_text(ROOM_W - 120, 20, "Tile X: " + string(mapX));
draw_text(ROOM_W - 120, 40, "Tile Y: " + string(mapY));		

draw_text(ROOM_W - 120, 60, "Room X: " + string(instPlayerRoom.x));
draw_text(ROOM_W - 120, 80, "Room Y: " + string(instPlayerRoom.y));

/*
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
			draw_sprite(sprTerrainPlaceholder, tileIndex-1, roomX, roomY - tileZ);		
		}

	}
}

*/