extends Area2D


var start_pos = Vector2(0,0)
var init = false
onready var main = get_node("/root/main")

func _process(delta):
	if !init:
		start_pos = global_position
		init = true
	if(main.playing):
		global_position.x += 3
	else:
		global_position = start_pos
	pass
