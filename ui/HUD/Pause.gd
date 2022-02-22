extends CanvasLayer

#To Main Menu
export(String, FILE, "*.tscn") var main_menu_scene

func _ready():
	set_visible(false)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		set_visible(!get_tree().paused)
		get_tree().paused = !get_tree().paused
	if event.is_action_pressed("select"):
		OS.window_fullscreen = !OS.window_fullscreen

func _on_Button_pressed():
	get_tree().paused = false
	set_visible(false)
	
func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible


func _on_quit_pressed():
	get_tree().paused = false
	get_tree().quit()


func _on_Button2_pressed():
	OS.window_fullscreen = !OS.window_fullscreen


func _on_MainMenu_pressed():
	get_tree().change_scene(main_menu_scene)
	get_tree().paused = false
	set_visible(false)
