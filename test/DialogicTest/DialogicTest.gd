extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.from != null:
		get_node("Player").set_position(get_node(Global.from + "Pos").position)
