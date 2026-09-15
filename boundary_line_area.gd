extends Area2D

func _ready() -> void:
	get_parent().get_node("boundary_line_area").connect("area_entered", game_over, 0);

func game_over(body: Node) -> void:
	if (body is enemy):
		global.is_game_over = true;
