extends KinematicBody2D

func _on_Area2D_body_entered(body):
	$AnimatedSprite.play("attack")
	print("collision entered")
	#Need to figure out how to enable collisons once player enters Area2D
	$Hitbox/CollisionShape2D.disabled
