extends Node2D

var is_game_over: bool = false;
var score: int = 0;

var next_wave: bool = false;
var current_wave: int = 1;
var total_spawned_in_current_wave: int = 0;
const MAX_PER_WAVE: int = 10;

var enemy_speed_multiplier: float = 1.0;
var player_speed_multiplier: float = 1.0;
var timer = null;

var play_explosion_sound: bool = false;

var last_destroyed_ship: Vector2 = Vector2(-100, -100);
var ship_destroyed: bool = false;

func on_enemy_death() -> void:
	play_explosion_sound = true;

	ship_destroyed = true;

	score += 1;
	if (score % 10 == 0):
		player_speed_multiplier += 0.2;
		current_wave += 1;
		next_wave = true;

	elif (global.score % 5 == 0):
		enemy_speed_multiplier += 0.2;
	
	elif (global.score % 7 == 0):
		timer.wait_time -= 0.15;
