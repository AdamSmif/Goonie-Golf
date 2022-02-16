extends Control


#To Start Game
export(String, FILE, "*.tscn") var to_hub_world

#To Game Maker
export(String, FILE, "*.tscn") var to_game_maker

#To Disc Golf Game
export(String, FILE, "*.tscn") var to_disc_golf_game

func _ready():
	MusicController.play_menu_music()


func _on_Explore_pressed():
	$MenuSelect.play()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene(to_hub_world)


func _on_Make_Games_pressed():
	$MenuSelect.play()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene(to_game_maker)


func _on_Disc_Golf_pressed():
	$MenuSelect.play()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene(to_disc_golf_game)
