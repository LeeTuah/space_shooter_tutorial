extends Node2D

@onready var shooting_sound = $shooting_sound;
@onready var explosion_sound = $explosion_sound;

var bullet_scene = preload("res://entities/bullets/bullet.tscn");
const bullet_cooldown = 0.4;
var current_bullet_cooldown = 0.0;

const linear_speed = 200.0;
const angular_speed = PI/2;

var player_scale = 0.45;
var player_width = 80.0 * player_scale;

func _ready() -> void:
	pass

func process_input(delta: float) -> void:
	if (Input.is_action_pressed("player_left")):
		position -= Vector2.RIGHT * linear_speed * global.player_speed_multiplier * delta;

	if (Input.is_action_pressed("player_right")):
		position += Vector2.RIGHT * linear_speed * global.player_speed_multiplier * delta;

	if (Input.is_action_pressed("player_shoot") and current_bullet_cooldown >= bullet_cooldown):
		shooting_sound.play();

		current_bullet_cooldown = 0.0;
		var bullet_instance = bullet_scene.instantiate();

		bullet_instance.position = Vector2(position.x, position.y - 30);
		get_parent().get_node("bullets").add_child(bullet_instance)

	current_bullet_cooldown += delta;

func check_stuff() -> void:
	position.x = clamp(position.x, player_width / 2.0, 400 - player_width / 2.0);

	if (global.play_explosion_sound):
		explosion_sound.play();
		global.play_explosion_sound = false;

func _process(delta: float) -> void:
	process_input(delta);
	check_stuff();
