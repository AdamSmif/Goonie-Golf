extends Control

# Game Over
export(String, FILE, "*.tscn") var main_menu

func _ready():

	yield(get_tree().create_timer(1), "timeout")
	$GameOverSound.play()
	$AnimationPlayer.play("fade")
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene(main_menu)
#	yield(get_tree().create_timer(4), "timeout")
#	$AnimationPlayer.play_backwards("fade")
#	yield(get_tree().create_timer(1), "timeout")
#	get_tree().change_scene("res://UI/TitleScreen.tscn")
	pass # Replace with function body
