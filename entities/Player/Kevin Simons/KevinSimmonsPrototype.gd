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


# Movement

export var MAX_SPEED = 250
export  var ACCELERATION = 75
export var MAX_SPRINT_SPEED = 450
export  var SPRINT_ACCELERATION = 350
var motion = Vector2()
var knockback = Vector2.ZERO

# Jump
export var JUMP_HEIGHT = -500
export var GRAVITY = 15

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

# Spawn All Players
	if Input.is_action_just_pressed("ui_accept"):
		$AllPlayers/OtherPlayers2.visible = true
		$AllPlayers/OtherPlayers3.visible = true
		$AllPlayers/OtherPlayers4.visible = true
		$AllPlayers/OtherPlayers5.visible = true
		$AllPlayers/OtherPlayers6.visible = true
		$AllPlayers/OtherPlayers7.visible = true
		$AllPlayers/OtherPlayers8.visible = true
# Spawn Other Players
	if Input.is_action_just_pressed("spawn_2"):
		$AllPlayers/OtherPlayers2.visible = true
	elif Input.is_action_just_pressed("spawn_3"):
		$AllPlayers/OtherPlayers3.visible = true
	elif Input.is_action_just_pressed("spawn_4"):
		$AllPlayers/OtherPlayers4.visible = true
	elif Input.is_action_just_pressed("spawn_5"):
		$AllPlayers/OtherPlayers5.visible = true
	elif Input.is_action_just_pressed("spawn_6"):
		$AllPlayers/OtherPlayers6.visible = true
	elif Input.is_action_just_pressed("spawn_7"):
		$AllPlayers/OtherPlayers7.visible = true
	elif Input.is_action_just_pressed("spawn_8"):
		$AllPlayers/OtherPlayers8.visible = true

## New Movement Code #
#	var input_vector = Vector2.ZERO
#	input_vector.x = Input.get_action_strength('right_%s' % id) - Input.get_action_strength('left_%s' % id)
#	if input_vector == Vector2.ZERO:
#		move_and_slide(input_vector * MAX_SPEED)
#		$Sprite.play("idle")
#		friction = true
#	if input_vector.x > 0:
#		move_and_slide(input_vector * MAX_SPEED)
#		$Sprite.flip_h = false
#		$Sprite.play("move")
#	elif input_vector.x < 0:
#		$Sprite.flip_h = true
#		$Sprite.play("move")

# Movment
	if Input.get_action_strength('right_%s' % id):
		motion.x = lerp(motion.x + ACCELERATION, MAX_SPEED, .75)
		$Sprite.flip_h = false
		$Sprite.play("move")
	elif Input.get_action_strength('left_%s' % id):
		motion.x = lerp(motion.x - ACCELERATION, -MAX_SPEED, .75)
		$Sprite.flip_h = true
		$Sprite.play("move")
	else:
		motion.x = 0
		$Sprite.play("idle")
		friction = true
		
	if Input.is_action_pressed('down_%s' % id):
		$Sprite.flip_h = false
		$Sprite.play("down")
		Input.action_release("left_%s" % id)
		Input.action_release("right_%s" % id)


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
		GameOver.set_visible(true)
	


func _on_GameOverTimer_timeout():
	get_tree().change_scene(lose_level_world_scene)


func _on_PlayerStats_no_health():
	$Sprite.play("boom")
	motion.x = 0
	get_tree().change_scene(lose_level_world_scene)
	

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



