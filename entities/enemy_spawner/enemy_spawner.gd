extends Node2D

var enemy_scene = preload("res://entities/enemies/enemy.tscn");

func _ready() -> void:
	get_parent().get_node("boundary_line_area").connect("area_entered", game_over, 0);

	global.timer = Timer.new();
	add_child(global.timer);

	global.timer.wait_time = 1.5;
	global.timer.connect("timeout", create_enemy, 0);
	global.timer.start();

func create_enemy() -> void:
	if (global.is_game_over): return;

	var enemy_instance = enemy_scene.instantiate();
	get_parent().get_node("enemies").add_child(enemy_instance)

func game_over(body: Node) -> void:
	if (body is enemy):
		global.is_game_over = true;
