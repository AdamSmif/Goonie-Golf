extends KinematicBody2D

# Player Number
export var id = 1
# Stats
var stats = PlayerStats

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

#trampoline
export var spring = -1200
export var springDown = 1200

# Coyote Time
var CoyoteJump = true
var jumpWasPressed = false
onready var coyoteTimer := $CoyoteTimer

# Stairs
var stair_on = false


# Cool Down
onready var discDelayTimer := $DiscTimer
export var throwDelay: float = 0.8
var vel := Vector2(0, 0)

# allows rigid bodies to stay rigid
export (int, 0, 200) var push = 5    

func _ready():
	stats.connect("no_health", self, "queue_free")


func _physics_process(_delta):
	motion.y += GRAVITY
	var friction = false

# Throw
#	if Input.is_action_just_pressed("throwright_%s" % id) and discDelayTimer.is_stopped():
#		emit_signal("disc_thrown")
#		print("disc thrown")
#		$Sprite.play("throw")
#		discDelayTimer.start(throwDelay)
#		#spawn disc
#		var throwInstance = throw.instance()
#		throwInstance.position = $Position2D.global_position
#		get_tree().get_root().add_child(throwInstance)
#
#	if Input.is_action_just_pressed("throwleft_%s" % id) and discDelayTimer.is_stopped():
#		emit_signal("disc_thrown")
#		$Sprite.play("throw")
#		discDelayTimer.start(throwDelay)
#		#spawn disc
#		var throwLeftInstance = throwleft.instance()
#		throwLeftInstance.position = $Position2D.global_position
#		get_tree().get_root().add_child(throwLeftInstance)

# Movment
	if Input.is_action_pressed('right_%s' % id):
		motion.x = lerp(motion.x + ACCELERATION, MAX_SPEED, .75)
		$Sprite.flip_h = false
		$Sprite.play("move")
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1
	elif Input.is_action_pressed('left_%s' % id):
		motion.x = lerp(motion.x - ACCELERATION, -MAX_SPEED, .75)
		$Sprite.flip_h = true
		$Sprite.play("move")
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1
	else:
		motion.x = 0
		$Sprite.play("idle")
		friction = true
		
	if Input.is_action_pressed('down_%s' % id):
		$Sprite.flip_h = false
		$Sprite.play("down")
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= 1
		Input.action_release("left_%s" % id)
		Input.action_release("right_%s" % id)

# Sprinting
	if Input.is_action_pressed('sprintright_%s' % id):
		print("sprint right")
		motion.x = lerp(motion.x + SPRINT_ACCELERATION, MAX_SPRINT_SPEED, .75)
		$Sprite.flip_h = false
		$Sprite.play("skateright")
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1
	elif Input.is_action_pressed('sprintleft_%s' % id):
		print("sprint left")
		motion.x = lerp(motion.x + -SPRINT_ACCELERATION, -MAX_SPRINT_SPEED, .75)
		$Sprite.flip_h = true
		$Sprite.play("skateleft")
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1

	if is_on_floor():
		CoyoteJump = true
		if jumpWasPressed == true:
			motion.y = JUMP_HEIGHT
		pass
		if Input.is_action_pressed('up_%s' % id):
			jumpWasPressed = true
			rememberJumpTime()
			if CoyoteJump == true:
				$JumpSound.play()
				motion.y = JUMP_HEIGHT
				if friction == true:
					motion.x = lerp(motion.x, 0, 0.2)
	else:
		coyoteTime()
		if motion.y < 0: 
			$Sprite.play("jump")
		else:
			$Sprite.play("fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)

	var _was_on_floor = is_on_floor()
	# For interacting with rigid bodies
	motion = move_and_slide(motion, Vector2.UP, false, 4, PI/4, false)
	
	# if the player goes really fast the player's animation will get spoked
	if motion.y > 1350 or motion.y < -1350:
		$Sprite.play("shocked")

func coyoteTime():
	coyoteTimer
	CoyoteJump = false
	pass

func rememberJumpTime():
	yield(get_tree().create_timer(0.2), "timeout")
	jumpWasPressed = false
	pass

func _on_FallZone_body_entered(body):
	get_tree().change_scene(lose_level_world_scene)
	
	
func bounce():
	motion.y = JUMP_HEIGHT * 0.8
	
# Enemy Collision

func ouch(var enemyposx):
	set_modulate(Color(1,0.3,0.3,0.4))
	motion.y = JUMP_HEIGHT * 0.2
#
	if position.x < enemyposx:
		motion.x = -800
	elif position.x > enemyposx:
		motion.x = 800

	Input.action_release("left_%s" % id)
	Input.action_release("right_%s" % id)
	

	$Timer.start()
	
### Signals ###
	
func _on_Timer_timeout():
	get_tree().change_scene(lose_level_world_scene)


func _on_DiscTimer_timeout():
	pass # Replace with function body.


# Trampoline Signals

func _on_Trampoline_body_entered(_body):
	motion.y = spring


func _on_DownTrampoline_body_entered(body):
	motion.y = springDown

# Stairs Signals

func _on_Stairs_body_entered(body):
	pass # Replace with function body.


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
		get_tree().change_scene("res://UI/PlayerKO.tscn")
	


func _on_GameOverTimer_timeout():
	get_tree().change_scene("res://UI/PlayerKO.tscn")


func _on_PlayerStats_no_health():
	$Sprite.play("boom")
	motion.x = 0
	get_tree().change_scene("res://UI/PlayerKO.tscn")
	

### Save Data ####

func _get_save_stats():
	return {
		'filename': get_filename(),
		'parent' : get_parent().get_path(),
		'x_pos' : global_transform.origin.x,
		'y_pos' : global_transform.origin.y,
		'stats' : {
			'stats' : stats
		}
	}

