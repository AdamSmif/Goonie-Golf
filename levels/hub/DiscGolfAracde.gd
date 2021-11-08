extends Control


export(String, FILE, "*.tscn") var play_game
export(String, FILE, "*.tscn") var exit_game

func _on_Play_pressed():
	$MenuSelect.play()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene(play_game)


func _on_Exit_pressed():
	$MenuSelect.play()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene(exit_game)
