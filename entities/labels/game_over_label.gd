extends Label

func _process(_delta: float) -> void:
	if (global.is_game_over):
		text = "Game Over";
