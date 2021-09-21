extends Area2D

export(String, FILE, "*.tscn") var next_world_scene

func _on_DiscGolfBasket_body_entered(_area: Area2D) -> void:
	Global.from = get_parent().name
	$BottleSound.play() 
	$AnimationPlayer.play("transition")
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene(next_world_scene)


func _on_Timer_timeout():
	pass # Replace with function body.
