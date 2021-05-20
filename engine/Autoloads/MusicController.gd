extends Node

var rain_music = load("res://audio/music/RainShowersRVX2406.ogg")
var menu_music = load("res://audio/music/the_past_8_bit_lofi_.ogg")
var credits_music = load("res://audio/music/8_bit_cold_lake_lofi.ogg")
var synth_music = load("res://audio/music/Dreamstate.ogg")

func play_menu_music():
	$AudioStreamPlayer.stream = menu_music
	$AudioStreamPlayer.play()
