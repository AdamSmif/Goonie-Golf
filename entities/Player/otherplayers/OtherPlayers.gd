extends KinematicBody2D

# Player Number
export var id = 2

# Movement
export var MAX_SPEED = 400
export var ACCELERATION = 1000
var motion = Vector2.ZERO
var knockback = Vector2.ZERO

# Shooting Mechanic
var velocity = Vector2()
var bullet = preload("res://entities/Player/otherplayers/OtherPlayersBullet/OhterPlayersBullet.tscn")

#Cool Down
onready var CoolDown = $CoolDown
export var shootDelay: float = 0.1

func _physics_process(delta):
	if Input.is_action_just_pressed("grow_%s" % id):
		print("grew")
		$AnimationPlayer.play("Grow")
	var axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(ACCELERATION * delta)
	else:
		apply_movement(axis * ACCELERATION * delta)
	motion = move_and_slide(motion)
	
	if Input.is_action_just_pressed("shoot_%s" % id) and CoolDown.is_stopped():
		CoolDown.start(shootDelay)
		$AnimationPlayer.play("Fire")
		#spawn bullet
		var bulletInstance = bullet.instance()
		bulletInstance.position = $Position2D.global_position
		get_tree().get_root().add_child(bulletInstance)
#	if ("shoot_%s" % id) > 10:
#		Input.action_release("shoot_%s" % id)

func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed('right_%s' % id)) - int(Input.is_action_pressed('left_%s' % id))
	axis.y = int(Input.is_action_pressed('down_%s' % id)) - int(Input.is_action_pressed('up_%s' % id))
	return axis.normalized()
	
func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO

func apply_movement(acceleration):
	motion += acceleration
	motion = motion.clamped(MAX_SPEED)



func _on_Hurtbox_area_entered(area):
	knockback = Vector2.RIGHT * 150
	knockback = Vector2.LEFT * 150




func _on_CoolDown_timeout():
	pass # Replace with function body.
