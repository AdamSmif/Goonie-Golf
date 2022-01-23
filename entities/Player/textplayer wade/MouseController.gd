extends KinematicBody2D

export var id = 1

var mouse_sens= 300.0

func _physics_process(delta):
	var direction: Vector2
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")


	if abs(direction.x) == 1 and abs(direction.y) == 1:
		direction = direction.normalized()
	var movement = mouse_sens * direction * delta
	if (movement):
		get_viewport().warp_mouse(get_global_mouse_position()+movement) 

