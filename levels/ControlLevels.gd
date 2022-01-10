extends Control

func _ready():
	print(Global.level_name)
	if Global.level_name:
		var level_node = find_node(Global.level_name)
		if level_node:
			$Player.global_position = level_node.global_position
