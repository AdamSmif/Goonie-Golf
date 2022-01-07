extends Node2D

var player = preload("res://entities/Player/main player wade/Player.tscn")
var HubPlayer = preload("res://entities/Player/HubPlayer/player.tscn")
var gui : PackedScene # platform-dependent UI scenes.


func _ready():
	if Global.from != null:
		get_node("Player").set_position(get_node(Global.from + "Pos").position)
	if OS.get_name() == "Android":
		gui = load("res://ui/HUD/MobileControls.tscn")
	else:
		pass
