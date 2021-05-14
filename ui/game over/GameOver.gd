extends Control

func _ready():

#	yield(get_tree().create_timer(1), "timeout")
	$AnimationPlayer.play("fade")
	$GameOverSound.play()
#	yield(get_tree().create_timer(4), "timeout")
#	$AnimationPlayer.play_backwards("fade")
#	yield(get_tree().create_timer(1), "timeout")
#	get_tree().change_scene("res://UI/TitleScreen.tscn")
	pass # Replace with function body
