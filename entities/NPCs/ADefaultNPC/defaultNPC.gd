extends Area2D

# Player Number
export var id = 1

func _physics_process(_delta):
	var bodies = get_overlapping_bodies()
#	print(bodies)
	for body in bodies:
		if body.name == "Player" or "GolfCartPlayer" or "CYOAPlayer" or "PlayerAutoRun" or "PlayerSkateBoard" or "PogostickPlayer" or "Submarine":
			if Input.is_action_just_pressed("interact_%s" % id):
				$CollisionShape2D.disabled
				$DialogSystem/AnimationPlayer.play("Dialog")

