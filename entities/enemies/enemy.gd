class_name enemy
extends Area2D

@onready var animation_sprite = $thruster_sprite_animated;
var enemy_speed = 100.0;

func _ready() -> void:
	animation_sprite.play("thruster");

	randomize();
	position = Vector2(randi_range(20, 380), 30);
	scale = Vector2(0.45, 0.45);

func _process(delta: float) -> void:
	if (global.is_game_over): return;
	position -= Vector2.UP * enemy_speed * global.enemy_speed_multiplier * delta;


func _on_area_entered(area: Area2D) -> void:
	if (area.name == "bullet_area" and (not global.is_game_over)):
		global.play_explosion_sound = true;
		area.get_parent().queue_free();
		queue_free();

		global.score += 1;
		if (global.score % 5 == 0):
			global.enemy_speed_multiplier += 0.2;
		
		elif (global.score % 7 == 0):
			global.timer.wait_time -= 0.15;

		elif (global.score % 10 == 0):
			global.player_speed_multiplier += 0.3;
