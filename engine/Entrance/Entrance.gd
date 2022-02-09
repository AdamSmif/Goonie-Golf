extends Area2D

export(String, FILE, "*.tscn") var next_world_scene
#export (Vector2) var spawn_pos

#func _process(_delta):
#	var areas = get_overlapping_areas()
#	for area in areas:
#		if area.name == "Player" && Input.is_action_just_pressed("ui_accept"):
#			get_tree().change_scene(next_world_scene)
#			Global.player_pos = spawn_pos

func _input(event):
	if event.is_action_pressed("talk") and len(get_overlapping_bodies()) > 0:
#	$BottleSound.play() 
		$AnimationPlayer.play("transition")
		yield(get_tree().create_timer(.50), "timeout")
		Global.from = get_parent().name 
		get_tree().change_scene(next_world_scene)

	Global.level_name = name
