/// @description Player movement
// You can write your code in this editor

var delta_t = delta_time / 100000;

var ground_check = player_ground_check(tile_id, x, y-1);

var is_grounded = ground_check != -1 && ground_check < 1 && velocity_y >= 0;

if (!is_grounded) {
	velocity_y += current_gravity * delta_t;
	time_from_ground += delta_t;

	if (ground_check != -1 && ceil(ground_check) <= velocity_y * delta_t) {
		velocity_y = ceil(ground_check) / delta_t;
	}
}
else {
	velocity_y = 0;
	has_jumped = false;
}

var jump_input = keyboard_check(vk_space) || gamepad_button_check(0, gp_face1);

if (jump_input && !is_jumping && (is_grounded || time_from_ground < 0.15)) {
	velocity_y = -jump_speed;
	has_jumped = true;
	is_jumping = true;
	current_gravity = current_gravity * jump_gravity_scale;
}

if (!jump_input && is_jumping) {
	is_jumping = false;
	current_gravity = p_gravity;
}

//
// Horizontal input
//

var move = 0;

if (keyboard_check(vk_right)) {
	move += 1;
}


if (keyboard_check(vk_left)) {
	move -= 1;
}

if (abs(gamepad_axis_value(0, gp_axislh)) > 0.2) {
	move = gamepad_axis_value(0, gp_axislh);
}

velocity_x = move * max_speed;

//
// Apply velocity
//
/*
if (collision_line(x - 14, y - 32 - velocity_y * delta_t, x + 14, y - 32 + velocity_y * delta_t, obj_block, false, true)) {
	velocity_y = 0;
}

if (collision_line(x + 16 * sign(velocity_x) + velocity_x * delta_t, y - 30, x + 16 * sign(velocity_x) + velocity_x * delta_t, y + 30, obj_block, false, true)) {
	velocity_x = 0;
}
*/
x += velocity_x * delta_t;
y += velocity_y * delta_t;