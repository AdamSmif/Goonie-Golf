extends CanvasLayer

#To Main Menu
export(String, FILE, "*.tscn") var main_menu_scene

func _ready():
	set_visible(false)

#Declares visible in current class
func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible


func _on_Contimue_pressed():
	get_tree().reload_current_scene()
	set_visible(false)


func _on_MainMenu_pressed():
	get_tree().change_scene(main_menu_scene)
	get_tree().paused = false
	set_visible(false)


func _on_quit_pressed():
	get_tree().paused = false
	get_tree().quit()
