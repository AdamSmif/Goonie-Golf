extends Control

export(String, FILE, "*.tscn") var next_world_scene

func _ready():
#	MusicController.stop_menu_music()
#	MusicController.play_credits_music()
	$AnimationPlayer.play("BlackToTransparent")
	yield(get_tree().create_timer(1), "timeout")
	$AnimationPlayer.play("CreditRoll")
#	yield(get_tree().create_timer(1), "timeout")
	pass # Replace with function body
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		$AnimationPlayer.play_backwards("FadeBlackBar")
		get_tree().change_scene(next_world_scene)
