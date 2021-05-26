extends Area2D



func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()


func _on_Bottle_body_entered(body):
	$AnimationPlayer.play("bounce")
	emit_signal("bottle_collected")
	#stops glitch of getting bottle twice
	set_collision_mask_bit(0,false)
