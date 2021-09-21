extends Node2D

var player = preload("res://entities/Player/main player wade/Player.tscn")

func _ready():
	if Global.from != null:
		get_node("Player").set_position(get_node(Global.from + "Pos").position)
