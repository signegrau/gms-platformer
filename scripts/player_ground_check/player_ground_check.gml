/// @func player_ground_check(tilemap, x, y)

var tilemap = argument0;
var _x = argument1;
var _y = argument2;

var left_check = tilemap_vertical_line(tilemap, _x - 14, _y + 32, 28);
var right_check = tilemap_vertical_line(tilemap, _x + 14, _y + 32, 28);

if (left_check == -1 && right_check != -1) {
	return right_check;
}

if (left_check != -1 && right_check == -1) {
	return left_check;
}

return left_check > right_check ? right_check : left_check;
