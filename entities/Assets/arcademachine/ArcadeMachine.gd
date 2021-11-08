extends Area2D

export(String, FILE, "*.tscn") var next_world_scene

func _input(event):
	if event.is_action_pressed("talk") and len(get_overlapping_bodies()) > 0:
		$AnimationPlayer.play("transition")
		yield(get_tree().create_timer(.50), "timeout")
		get_tree().change_scene(next_world_scene)
		

func _on_ArcadeMachine_body_entered(body):
	Global.from = get_parent().name 
	$AnimationPlayer.play("interaction")


func _on_ArcadeMachine_body_exited(body):
	Global.from = get_parent().name 
	$AnimationPlayer.play("interactionoff")
