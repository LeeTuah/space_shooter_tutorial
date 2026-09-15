extends Node2D

func _process(_delta: float) -> void:
	if (global.is_game_over):
		$game_over_label.text = "Game Over";

	$score_label.text = "Score: " + str(global.score);
	$waves_label.text = "Wave: " + str(global.current_wave);
