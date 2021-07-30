extends KinematicBody2D

# Player Number
export var id = 1
# Stats
var stats = PlayerStats

# Coin Amount
var bottles_needed = 0
# Level Respawn
export(String, FILE, "*.tscn") var lose_level_world_scene
# Game Over
export(String, FILE, "*.tscn") var game_over_scene


# Movement

export var MAX_SPEED = 250
export  var ACCELERATION = 75
var motion = Vector2()
var knockback = Vector2.ZERO
export var GRAVITY = 50


# allows rigid bodies to stay rigid
export (int, 0, 200) var push = 5    

func _ready():
	stats.connect("no_health", self, "queue_free")

func _physics_process(delta):
	motion.y = GRAVITY
	print(motion.y)
	var friction = false

# Movment
	if Input.is_action_pressed('right_%s' % id):
		motion.x = lerp(motion.x + ACCELERATION, MAX_SPEED, .75)
		$Sprite.flip_h = false
	elif Input.is_action_pressed('left_%s' % id):
		motion.x = lerp(motion.x - ACCELERATION, -MAX_SPEED, .75)
		$Sprite.flip_h = true
	else:
		motion.x = 0
		friction = true
		
	if Input.is_action_pressed('down_%s' % id):
		motion.y = GRAVITY * 5
		print(motion.y)

	var _was_on_floor = is_on_floor()
	# For interacting with rigid bodies
	motion = move_and_slide(motion, Vector2.UP, false, 4, PI/4, false)


func _on_FallZone_body_entered(body):
	get_tree().change_scene(lose_level_world_scene)
	
	
# Enemy Collision

func ouch(var enemyposx):
	set_modulate(Color(1,0.3,0.3,0.4))
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



func _on_Hurtbox_area_entered(area):
	stats.health -= 1
	$AnimationPlayer.play("Hit")
	$GotHitSound.play()
	knockback = Vector2.RIGHT * 150
	knockback = Vector2.LEFT * 150
	if stats.health == 0:
		$Sprite.play("boom")
		motion.x = 0
		$Timer.start()
		get_tree().change_scene(lose_level_world_scene)
	

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



