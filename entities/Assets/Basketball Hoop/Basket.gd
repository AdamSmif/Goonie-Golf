# WorldComplete.gd
extends Area2D

export(String, FILE, "*.tscn") var next_world_scene

func _physics_process(_delta):
	var bodies = get_overlapping_bodies()
#	print(bodies)
	for body in bodies:
		if body.name == "Player" or "GolfCartPlayer" or "CYOAPlayer" or "PlayerAutoRun" or "PlayerSkateBoard" or "PogostickPlayer" or "Submarine":
			yield(get_tree().create_timer(.1), "timeout")
			$Sprite.play("boom")
			emit_signal("level_complete")
			$NextLevelSound.play()
			get_tree().change_scene(next_world_scene)
			
			



