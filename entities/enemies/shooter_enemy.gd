class_name shooter_enemy
extends enemy

@onready var enemy_shooting_sound = $shooting_sound;
var enemy_bullet_scene = preload("res://entities/bullets/enemy_bullet.tscn");

func _ready() -> void:
	randomize();
	position = Vector2(randi_range(20, 380), randi_range(30, 350));
	scale = Vector2(0.45, 0.45);

	var timer = Timer.new();
	add_child(timer);

	timer.wait_time = 0.9;
	timer.connect("timeout", shoot_at_player, 0);
	timer.start();

func shoot_at_player():
	if (global.is_game_over): return

	enemy_shooting_sound.play();
	var enemy_bullet_instance = enemy_bullet_scene.instantiate();

	enemy_bullet_instance.position = Vector2(position.x, position.y + 30);
	get_tree().current_scene.get_node("enemy_bullets").add_child(enemy_bullet_instance);

func _process(_delta: float) -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	if (area.name == "bullet_area" and (not global.is_game_over)):
		area.get_parent().queue_free();
		queue_free();

		global.on_enemy_death();
		global.last_destroyed_ship = position;
