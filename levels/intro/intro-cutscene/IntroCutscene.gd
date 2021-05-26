extends Control

export(String, FILE, "*.tscn") var next_world_scene

func _ready():
	MusicController.stop_menu_music()
	MusicController.play_rain_music()
	yield(get_tree().create_timer(1), "timeout")
	$AnimationPlayer.play("textfade")
	yield(get_tree().create_timer(1), "timeout")
#	get_tree().change_scene(next_world_scene)


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene(next_world_scene)
