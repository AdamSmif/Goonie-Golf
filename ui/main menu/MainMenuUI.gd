extends Control

#To Start Game
export(String, FILE, "*.tscn") var next_world_scene

#To Credits
export(String, FILE, "*.tscn") var to_credits_scene

#To Options
export(String, FILE, "*.tscn") var to_options_scene

#To Minigames
export(String, FILE, "*.tscn") var to_minigames_scene


func _ready():
	MusicController.play_menu_music()

# Main Game
func _on_Button_pressed():
	$MenuSelect.play()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene(next_world_scene)


func _on_Mini_Game_pressed():
	$MenuSelect.play()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene(to_minigames_scene)


func _on_Options_pressed():
	$MenuSelect.play()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene(to_options_scene)


func _on_Credits_pressed():
	$MenuSelect.play()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene(to_credits_scene)


func _on_Test_pressed():
	get_tree().change_scene("res://test/Multiplayer/lobby.tscn")
