extends CanvasLayer

#To Main Menu
export(String, FILE, "*.tscn") var main_menu_scene
# Stats
var stats = PlayerStats


func _ready():
	set_visible(false)


#Declares visible in current class
func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible


#TODO: Reset player health when you reload scene
#NTS: Currently not signaling to a button
#func _on_Continue_pressed():
#	get_tree().reload_current_scene()
#	PlayerStats.max_health = 4
#	set_visible(false)


func _on_MainMenu_pressed():
	get_tree().change_scene(main_menu_scene)
	get_tree().paused = false
	set_visible(false)


func _on_quit_pressed():
	get_tree().paused = false
	get_tree().quit()
