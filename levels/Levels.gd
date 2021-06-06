extends Node2D



func _ready():
	if Global.from != null:
d		get_node("Player").set_position(get_node(Global.from + "Pos").position)
