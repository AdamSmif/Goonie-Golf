extends Control

func _ready():

	yield(get_tree().create_timer(2), "timeout")
	$AnimationPlayer.play("playerkofade")
	$KOSound.play()
	yield(get_tree().create_timer(4), "timeout")
	$AnimationPlayer.play_backwards("playerkofade")
	get_tree().change_scene("res://UI/GameOver.tscn")
	pass # Replace with function body
