extends Control


export(String, FILE, "*.tscn") var next_world_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene(next_world_scene)

func _on_Button_pressed():
	$MenuSelect.play()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene(next_world_scene)
