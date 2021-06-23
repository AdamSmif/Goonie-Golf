extends Spatial

export(String, FILE, "*.tscn") var next_world_scene

func _ready():
	yield(get_tree().create_timer(15), "timeout")
	get_tree().change_scene(next_world_scene)
	
#func _process(delta):
#	if Input.is_action_just_pressed("ui_accept"):
#		get_tree().change_scene(next_world_scene)
