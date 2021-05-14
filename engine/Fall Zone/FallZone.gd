# WorldComplete.gd
extends Area2D

export(String, FILE, "*.tscn") var lose_level_world_scene

func _physics_process(_delta):
	var bodies = get_overlapping_bodies()
#	print(bodies)
	for body in bodies:
		if body.name == "Player" or "GolfCartPlayer" or "CYOAPlayer" or "PlayerAutoRun" or "PlayerSkateBoard" or "PogostickPlayer" or "Submarine":
#			$NextLevelSound.play()
			get_tree().change_scene(lose_level_world_scene)

