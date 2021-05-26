extends Control

export(String, FILE, "*.tscn") var next_world_scene

func _ready():
	$AnimationPlayer.play("FadeBlack")
	yield(get_tree().create_timer(3), "timeout")
	$AnimationPlayer.play_backwards("FadeBlack")
	get_tree().change_scene(next_world_scene)
	pass # Replace with function body


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene(next_world_scene)


