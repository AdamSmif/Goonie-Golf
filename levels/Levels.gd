extends Node2D

var HealthUI = preload("res://ui/HUD/HUD.tscn") 

func _ready():
	if Global.from != null:
		get_node("Player").set_position(get_node(Global.from + "Pos").position)
