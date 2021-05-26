extends Area2D

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player" or "PlayerNoGun" or "GolfCartPlayer" or "CYOAPlayer" or "PlayerAutoRun" or "PlayerSkateBoard" or "PogostickPlayer" or "Submarine":
			$AnimatedSprite.play("default")
		else:
			$AnimatedSprite.play("default")
