/// @description Insert description here
// You can write your code in this editor

velocity_x = 0;
velocity_y = 0;

has_jumped = true;
is_jumping = false;
time_from_ground = 100;

current_gravity = p_gravity;

tile_id = layer_tilemap_get_id("collision");

game_set_speed(144, gamespeed_fps);
