extends KinematicBody

# Player Number
export var id = 1
# Stats
var stats = PlayerStats

# Movement
export var MAX_SPEED = 2
export  var ACCELERATION = 20
export var MAX_SPRINT_SPEED = 45
export  var SPRINT_ACCELERATION = 35
var motion = Vector3(0,0,0)
var knockback = Vector2.ZERO


export var JUMP_HEIGHT = -500 
export var GRAVITY = 30

func _ready():
	pass

func _physics_process(delta):
#	motion.y += GRAVITY
	var friction = false
	if Input.is_action_pressed('right_%s' % id) and Input.is_action_pressed('left_%s' % id):
		motion.x = 0
	elif Input.is_action_pressed('right_%s' % id):
		motion.x = lerp(motion.x + ACCELERATION, MAX_SPEED, .75)
	elif Input.is_action_pressed('left_%s' % id):
		motion.x = lerp(motion.x - ACCELERATION, -MAX_SPEED, .75)
	else:
		motion.x = lerp(motion.x,0,0.1)

	if Input.is_action_pressed('up_%s' % id) and Input.is_action_pressed('down_%s' % id):
		motion.z = 0
	elif Input.is_action_pressed('up_%s' % id):
		motion.z = lerp(motion.x - ACCELERATION, -MAX_SPEED, .75)
	elif Input.is_action_pressed('down_%s' % id):
		motion.z = lerp(motion.x + ACCELERATION, MAX_SPEED, .75)
	else:
		motion.z = lerp(motion.x,0,0.1)
	move_and_slide(motion)
