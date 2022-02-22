extends Node2D

var can_place = true
var is_panning = true;
onready var main = get_node("/root/main")
onready var level = get_node("/root/main/Level")
onready var editor = get_node("/root/main/cam_container")
onready var editor_cam = editor.get_node("Camera2D")


export var cam_speed = 50
var current_item

func _ready():
	editor_cam.current = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_global_mouse_position()
	
	if(current_item != null and can_place and Input.is_action_just_pressed("mb_left")):
		var new_item = current_item.instance()
		level.add_child(new_item)
		new_item.global_position = get_global_mouse_position()
		
	move_editor()
	is_panning = Input.is_action_pressed("mb_middle")
	pass

func move_editor():
	if Input.is_action_just_pressed("w"):
		editor.global_position.y -= cam_speed
	if Input.is_action_just_pressed("a"):
		editor.global_position.x -= cam_speed
	if Input.is_action_just_pressed("s"):
		editor.global_position.y += cam_speed
	if Input.is_action_just_pressed("d"):
		editor.global_position.x += cam_speed
	pass
	
func _unhandled_input(event):
	if(event is InputEventMouseButton):
		if(event.is_pressed()):
			if(event.button_index == BUTTON_WHEEL_UP):
				editor_cam.zoom -= Vector2(0.1,0.1)
			if(event.button_index == BUTTON_WHEEL_DOWN):
				editor_cam.zoom += Vector2(0.1,0.1)
	if(event is InputEventMouseMotion):
		if(is_panning):
			editor.global_position -= event.relative * editor_cam.zoom
	pass
