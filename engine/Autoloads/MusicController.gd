extends Node

var rain_music = load("res://audio/music/RainShowersRVX2406.ogg")
var menu_music = load("res://audio/music/title-screen.ogg")
var credits_music = load("res://audio/music/8_bit_cold_lake_lofi.ogg")
var synth_music = load("res://audio/music/Dreamstate.ogg")
var hub_music = load("res://audio/music/hub world.wav")


### Menu Music ###
func play_menu_music():
	$AudioStreamPlayer.stream = menu_music
	$AudioStreamPlayer.play()
	
func stop_menu_music():
	$AudioStreamPlayer.stream = menu_music
	$AudioStreamPlayer.stop()


### Rain Music ###
func play_rain_music():
	$AudioStreamPlayer.stream = rain_music
	$AudioStreamPlayer.play()
	
func stop_rain_music():
	$AudioStreamPlayer.stream = rain_music
	$AudioStreamPlayer.stop()
	
### Credits Music ###
func play_credits_music():
	$AudioStreamPlayer.stream = credits_music
	$AudioStreamPlayer.play()
	
func stop_credits_music():
	$AudioStreamPlayer.stream = credits_music
	$AudioStreamPlayer.stop()
	
### Synth Music ###
func play_synth_music():
	$AudioStreamPlayer.stream = synth_music
	$AudioStreamPlayer.play()
	
func stop_synth_music():
	$AudioStreamPlayer.stream = synth_music
	$AudioStreamPlayer.stop()
	
### Hub Music ###
func play_hub_music():
	$AudioStreamPlayer.stream = hub_music
	$AudioStreamPlayer.play()
	
func stop_hub_music():
	$AudioStreamPlayer.stream = hub_music
	$AudioStreamPlayer.stop()
