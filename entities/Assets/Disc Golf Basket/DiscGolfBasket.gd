extends Area2D

export(String, FILE, "*.tscn") var next_world_scene

func _on_DiscGolfBasket_body_entered(_area: Area2D) -> void:
	Global.from = get_parent().name 
	get_tree().change_scene(next_world_scene)
