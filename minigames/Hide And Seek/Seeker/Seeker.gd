extends KinematicBody2D

export var id = 1
export var MAX_SPEED = 40
export var ACCELERATION = 30

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
	velocity = Vector2()
	if Input.is_action_pressed('seeker_right_%s' % id):
		$Sprite.flip_h = false
		$Sprite.play("idle")
		velocity.x += 1
	if Input.is_action_pressed('seeker_left_%s' % id):
		$Sprite.flip_h = true
		$Sprite.play("idle")
		velocity.x -= 1
	if Input.is_action_pressed('seeker_up_%s' % id):
		$Sprite.play("idle")
		velocity.y -= 1
	if Input.is_action_pressed('seeker_down_%s' % id):
		$Sprite.play("idle")
		velocity.y += 1
	velocity = velocity.normalized() * MAX_SPEED

	
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * MAX_SPEED
		$Sprite.play()
	else:
		$Sprite.stop()
	position += velocity * delta

	velocity = move_and_slide(velocity)
	
