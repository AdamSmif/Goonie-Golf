extends Node2D

func _ready():
	MusicController.stop_rain_music()
	MusicController.play_synth_music()
	if Global.from != null:
		get_node("Player").set_position(get_node(Global.from + "Pos").position)
