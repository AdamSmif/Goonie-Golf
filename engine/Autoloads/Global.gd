extends Node

var changing_level = false

func _ready():
	pass
	
func change_map(map, entrance):
	if changing_level:
		return
	changing_level = true
#
#	var old_level = current_level
#	var root = old_level.get_parent()
#
#
#
#	var new_level_path = "res://maps/" + map + ".tmx"
#	var new_map = load(new_map_path).instance()
#
#	old_level.queue_free()
#	next_entrance = entrance
#	root.add_child(new_map)
#
#	emit_signal("debug_update")

