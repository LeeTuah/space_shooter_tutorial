extends Node2D

@onready var explosion_sprite = $explosion_animated;
@onready var explosion_sound = $explosion_sound;

func _ready() -> void:
	position = global.last_destroyed_ship;

func _process(_delta: float) -> void:
	if (global.ship_destroyed):
		global.ship_destroyed = false;
		position = global.last_destroyed_ship;

		explosion_sprite.show();
		explosion_sprite.play("default");

	if (global.play_explosion_sound):
		explosion_sound.play();
		global.play_explosion_sound = false;

func _on_explosion_animated_animation_finished() -> void:
	explosion_sprite.hide();
