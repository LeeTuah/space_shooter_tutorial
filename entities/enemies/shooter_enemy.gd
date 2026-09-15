class_name shooter_enemy
extends enemy

func _ready() -> void:
	randomize();
	position = Vector2(randi_range(20, 380), randi_range(30, 300));
	scale = Vector2(0.45, 0.45);

	var timer = Timer.new();
	add_child(timer);

	timer.wait_time = 0.9;
	timer.connect("timeout", shoot_at_player, 0);
	timer.start();

func shoot_at_player():
	pass

func _process(_delta: float) -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	if (area.name == "bullet_area" and (not global.is_game_over)):
		area.get_parent().queue_free();
		queue_free();

		global.on_enemy_death();
		global.last_destroyed_ship = position;
