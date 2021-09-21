extends KinematicBody2D

export var id = 1
var velocity = Vector2()

var max_speed = 2

# warning-ignore:unused_argument
func _physics_process(delta):
	
	if Input.is_action_pressed("up_%s"): # go up
		velocity.y = -1
		print("up")
		pass
	elif Input.is_action_pressed("down_%s"): # go down
		velocity.y = 1
		pass
	else:
		velocity.y = 0
		pass
	
	if Input.is_action_pressed("right_%s"): # go right
		#flip_h = false
		velocity.x = 1
		pass
	elif Input.is_action_pressed("left_%s"): # go left
#		flip_h = true
		velocity.x = -1
		pass
	else:
		velocity.x = 0
		pass
	
	if velocity == Vector2():
		$Player.play("idle")
	else:
		$Player.play("walk")
	
	
	position += velocity.normalized() * max_speed
	pass
