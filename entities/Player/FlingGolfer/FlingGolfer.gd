extends KinematicBody2D

export var id = 1
onready var ray = $RayCast2D
export var MAX_SPEED = 40
export var ACCELERATION = 30
export var FRICTION = 500

# Coin Amount
var bottles_needed = 0
# Level Respawn
export(String, FILE, "*.tscn") var lose_level_world_scene
# Game Over
export(String, FILE, "*.tscn") var game_over_scene
# Next Level For Bottle Colelcting Levels
export(String, FILE, "*.tscn") var bottle_world_scene


# Score 
var score = 0

var velocity = Vector2()

func _physics_process(delta):
	
	
	
#	velocity = Vector2()
#	if Input.is_action_pressed('right_%s' % id):
#		$Player.flip_h = true
#		$AnimationPlayer.play("IdleSide")
#		position.x += 4
#	if Input.is_action_pressed('left_%s' % id):
#		$Player.flip_h = false
#		$AnimationPlayer.play("IdleSide")
#		position.x -= 4
#	if Input.is_action_pressed('up_%s' % id):
#		$AnimationPlayer.play("walkUp")
#		position.y -= 4
#	if Input.is_action_pressed('down_%s' % id):
#		$AnimationPlayer.play("walkDown")
#		position.y += 4
#	velocity = velocity.normalized() * MAX_SPEED
