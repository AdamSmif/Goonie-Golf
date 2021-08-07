extends Control

export(String, FILE, "*.tscn") var next_world_scene

#func _ready():
#	queue_free()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene(next_world_scene)
