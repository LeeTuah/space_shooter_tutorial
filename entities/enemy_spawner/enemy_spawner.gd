extends Node2D

var enemy_scene = preload("res://entities/enemies/enemy.tscn");
var shooter_enemy_scene = preload("res://entities/enemies/shooter_enemy.tscn")

func _ready() -> void:
	global.timer = Timer.new();
	add_child(global.timer);

	global.timer.wait_time = 1.5;
	global.timer.connect("timeout", create_enemy_wave1, 0);
	global.timer.start();

func create_enemy_wave1() -> void:
	if (global.is_game_over): return;

	var enemy_instance = enemy_scene.instantiate();
	get_parent().get_node("enemies").add_child(enemy_instance);

	global.total_spawned_in_current_wave += 1;
	if (global.total_spawned_in_current_wave >= global.MAX_PER_WAVE):
		global.timer.stop();

func create_enemy_wave2() -> void:
	if (global.is_game_over): return;

	var shooter_enemy_instance = shooter_enemy_scene.instantiate();
	get_parent().get_node("enemies").add_child(shooter_enemy_instance);

	global.total_spawned_in_current_wave += 1;
	if (global.total_spawned_in_current_wave >= global.MAX_PER_WAVE):
		global.timer.stop();

func _process(_delta: float):
	if (not global.next_wave): return;
	global.next_wave = false;

	if (global.current_wave == 2):
		global.timer.timeout.disconnect(create_enemy_wave1);
		global.timer.connect("timeout", create_enemy_wave2, 0);

		global.total_spawned_in_current_wave = 0;
		global.timer.start();
