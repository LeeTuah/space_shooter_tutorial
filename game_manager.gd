extends Node2D

var is_game_over: bool = false;
var score: int = 0;

var enemy_speed_multiplier: float = 1.0;
var player_speed_multiplier: float = 1.0;
var timer = null;

var play_explosion_sound: bool = false;
