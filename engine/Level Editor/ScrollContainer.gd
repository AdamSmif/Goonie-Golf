extends ScrollContainer

onready var object_cursor = get_node("/root/main/Editor_Object")


func _ready():
	connect("mouse_entered",self,"mouse_enter")
	connect("nouse_exited",self,"mouse_leave")
	pass # Replace with function body.


func mouse_enter():
	object_cursor.can_place = false;
	object_cursor.hide()
	pass
	
func mouse_leave():
	object_cursor.can_place = true
	object_cursor.show()
	pass
