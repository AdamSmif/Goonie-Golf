extends Node2D



func _ready():
	var dialog = Dialogic.start("talk1")
	add_child(dialog)
