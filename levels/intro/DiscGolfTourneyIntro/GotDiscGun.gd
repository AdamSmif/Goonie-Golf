extends Control

export(String, FILE, "*.tscn") var next_world_scene

func _ready():
	if Global.from != null:
		get_node("Player").set_position(get_node(Global.from + "Pos").position)
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
#		$AnimationPlayer.play_backwards("FadeBlackBar")
		get_tree().change_scene(next_world_scene)
