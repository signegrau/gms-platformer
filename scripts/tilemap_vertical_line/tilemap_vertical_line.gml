/// @func tilemap_vertical_line(tilemap, x, y, d)
/// @desc distance to first empty space in tilemap in vertical line
/// @param tilemap id
/// @param x x for start of line
/// @param y y for start of line
/// @param d length of line

var tilemap = argument0;

var _x = argument1;
var _y = argument2;
var d = argument3;

var found = false;
var dist;
for (dist = d; abs(d - dist) <= d; dist -= sign(d)) {
	if (tilemap_get_at_pixel(tilemap, _x, _y + dist) == 1) {
		show_debug_message(dist);
		found = true;
	}
	else if (found) {
		return abs(dist);
	}
}

if (found) {
	return 0;
} else {
	return -1;
}