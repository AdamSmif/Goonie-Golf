extends KinematicBody2D

# Player Number
export var id = 1
# Stats
var stats = PlayerStats

onready var ray = $RayCast2D

#signals to HUD that a disc is thrown
signal disc_thrown

# Coin Amount
var bottles_needed = 0
# Level Respawn
export(String, FILE, "*.tscn") var lose_level_world_scene
# Game Over
export(String, FILE, "*.tscn") var game_over_scene
# Next Level For Bottle Colelcting Levels
export(String, FILE, "*.tscn") var bottle_world_scene

# Movement

export var MAX_SPEED = 250
export  var ACCELERATION = 75
export var MAX_SPRINT_SPEED = 450
export  var SPRINT_ACCELERATION = 350
var motion = Vector2()
var knockback = Vector2.ZERO

# Jump
export var JUMP_HEIGHT = -500 
export var GRAVITY = 30

# allows rigid bodies to stay rigid
#export (int, 0, 200) var push = 5    

func _physics_process(_delta):
	motion.y += GRAVITY
	var friction = false
#	move_and_collide(Vector2(MAX_SPEED * _delta, 0))
	$Sprite.play("default")

	if is_on_floor():
		if Input.is_action_pressed('up_%s' % id):
			$JumpSound.play()
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
			
	# Makes sure player stays afloat even without collison objects
	if ray.is_colliding():
		var orig = ray.global_transform.origin
		var coll = ray.get_collision_point()
		var dist = abs(orig.y - coll.y)
		var depth = abs(ray.cast_to.y - dist)
		
		position.y -= depth

	motion = move_and_slide(motion, Vector2.UP, false, 4, PI/4, false)
	pass
	



func _on_Hurtbox_area_entered(area):
	stats.health -= 1
	$AnimationPlayer.play("Hit")
	$GotHitSound.play()
	motion.y = JUMP_HEIGHT * 0.2
	knockback = Vector2.RIGHT * 150
	knockback = Vector2.LEFT * 150
	if stats.health == 0:
		$Sprite.play("boom")
		motion.x = 0
		$Timer.start()
		get_tree().change_scene("res://ui/game_over/PlayerKO.tscn")
