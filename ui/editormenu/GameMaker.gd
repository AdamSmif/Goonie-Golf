extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Art_pressed():
	get_tree().change_scene("res://test/sprite_editorUI.tscn")


func _on_LinkButton_pressed():
	OS.get_executable_path().get_base_dir().plus_file("NeuralComposter.exe")


func _on_Sound_pressed():
	get_tree().change_scene("res://engine/Sound Editor/SoundEditor.tscn")


func _on_Levels_pressed():
	get_tree().change_scene("res://engine/Level Editor/main.tscn")
	
	
