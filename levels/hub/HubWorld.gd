extends Node2D

var player = preload("res://entities/Player/main player wade/Player.tscn")
var HubPlayer = preload("res://entities/Player/HubPlayer/player.tscn")

func _ready():
	MusicController.stop_menu_music()
	MusicController.play_hub_music()
	if Global.from != null:
		get_node("Player").set_position(get_node(Global.from + "Pos").position)





