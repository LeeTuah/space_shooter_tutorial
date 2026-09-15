extends Node2D

const bullet_speed = 350.0;

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	position += Vector2.UP * bullet_speed * delta

	if (position.y < 0):
		queue_free()
