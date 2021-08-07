extends Control

# Game Over
export(String, FILE, "*.tscn") var game_over_scene

func _ready():

	yield(get_tree().create_timer(1), "timeout")
	$AnimationPlayer.play("playerkofade")
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene(game_over_scene)
#	yield(get_tree().create_timer(4), "timeout")
#	$AnimationPlayer.play_backwards("fade")
#	yield(get_tree().create_timer(1), "timeout")
#	get_tree().change_scene("res://UI/TitleScreen.tscn")
	pass # Replace with function body
