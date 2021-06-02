extends Node

var rain_music = load("res://audio/music/RainShowersRVX2406.ogg")
var menu_music = load("res://audio/music/the_past_8_bit_lofi_.ogg")
var credits_music = load("res://audio/music/8_bit_cold_lake_lofi.ogg")
var synth_music = load("res://audio/music/Dreamstate.ogg")

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
