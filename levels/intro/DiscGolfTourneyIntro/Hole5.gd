extends Node2D

func _ready():
	MusicController.stop_rain_music()
	MusicController.play_synth_music()
