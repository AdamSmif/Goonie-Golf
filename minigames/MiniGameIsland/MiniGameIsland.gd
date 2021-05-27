extends Control

#Driving Range Game
export(String, FILE, "*.tscn") var hide_and_seek

export(String, FILE, "*.tscn") var driving_range

func _ready():
	pass


func _on_Button_pressed():
	get_tree().change_scene(hide_and_seek)


func _on_Driving_Range_Button_pressed():
	get_tree().change_scene(driving_range)
