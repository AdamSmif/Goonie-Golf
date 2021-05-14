extends CanvasLayer

signal level_complete()

func _ready():
	set_visible(false)
	
func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible

func change_scene():
	yield(get_tree().create_timer(.10), "timeout")
	$AnimationPlayer.play("fade")
	yield(get_tree().create_timer(.10), "timeout")
	$AnimationPlayer.play_backwards("fade")



