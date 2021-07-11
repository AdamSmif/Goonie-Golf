extends Control


export(String, FILE, "*.tscn") var disc_golf_game

export(String, FILE, "*.tscn") var kevin_simmons_game

export(String, FILE, "*.tscn") var hoops_game

export(String, FILE, "*.tscn") var main_menu


func _on_DiscGolfButton_pressed():
	$MenuSelect.play()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene(disc_golf_game)


func _on_KevimButton_pressed():
	$MenuSelect.play()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene(kevin_simmons_game)


func _on_HoopsButton_pressed():
	$MenuSelect.play()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene(hoops_game)


func _on_MainMenu_pressed():
	$MenuSelect.play()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene(main_menu)
