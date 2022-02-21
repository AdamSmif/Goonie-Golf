extends TabContainer

onready var object_cursor = get_node("/root/main/Editor_Object")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("toggle_editor"):
		EditorGlobal.playing = !EditorGlobal.playing
		visible = !EditorGlobal.playing
		print("editor toggled")

func _on_TabContainer_mouse_entered():
	object_cursor.can_place = false
	object_cursor.hide()
	pass # Replace with function body.


func _on_TabContainer_mouse_exited():
	object_cursor.can_place = true
	object_cursor.show()
	pass # Replace with function body.
