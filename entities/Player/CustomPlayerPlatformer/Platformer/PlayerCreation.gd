extends KinematicBody2D

# Player Number
export var id = 1
# Stats
var stats = PlayerStats

#signals to HUD that a disc is thrown
signal disc_thrown

# Coin Amount
var bottles_needed = 0

# Game Over
export(String, FILE, "*.tscn") var game_over_scene
# Next Level For Bottle Colelcting Levels
export(String, FILE, "*.tscn") var bottle_world_scene


# Movement #
var velocity = Vector2(0,0)
# The max jump height in pixels (holding jump)
export var max_jump_height = 150 setget set_max_jump_height
# The minimum jump height (tapping jump)
export var min_jump_height = 40 setget set_min_jump_height
# The height of your jump in the air
export var double_jump_height = 100 setget set_double_jump_height
# How long it takes to get to the peak of the jump in seconds
export var jump_duration = 0.3 setget set_jump_duration
# Multiplies the gravity by this while falling
export var falling_gravity_multiplier = 1.5
# Set to 2 for double jump
export var max_jump_amount = 2
export var max_acceleration = 4000
export var friction = 8
export var can_hold_jump : bool = true
# You can still jump this many seconds after falling off a ledge
export var coyote_time : float = 0.2
# Only neccessary when can_hold_jump is off
# Pressing jump this many seconds before hitting the ground will still make you jump
export var jump_buffer : float = 0.2


# These will be calcualted automatically
var default_gravity : float
var jump_velocity : float
var double_jump_velocity : float
# Multiplies the gravity by this when we release jump
var release_gravity_multiplier : float



var jumps_left : int
var holding_jump := false

var vel = Vector2()
var acc = Vector2()

onready var coyote_timer = Timer.new()
onready var jump_buffer_timer = Timer.new()


func _ready():
	default_gravity = calculate_gravity(max_jump_height, jump_duration)
	jump_velocity = calculate_jump_velocity(max_jump_height, jump_duration)
	double_jump_velocity = calculate_jump_velocity2(double_jump_height, default_gravity)
	release_gravity_multiplier = calculate_release_gravity_multiplier(jump_velocity, min_jump_height)

	add_child(coyote_timer)
	coyote_timer.wait_time = coyote_time
	coyote_timer.one_shot = true
	
	add_child(jump_buffer_timer)
	jump_buffer_timer.wait_time = jump_buffer
	jump_buffer_timer.one_shot = true


func _physics_process(delta):
	var input_vector = Vector2.ZERO
	# Multiplayer Spawner #
	if Input.is_action_just_pressed("ui_accept"):
		$AllPlayers.visible = true
#		$AllPlayers/OtherPlayers3.visible = true
#		$AllPlayers/OtherPlayers4.visible = true
#		$AllPlayers/OtherPlayers5.visible = true
#		$AllPlayers/OtherPlayers6.visible = true
#		$AllPlayers/OtherPlayers7.visible = true
#		$AllPlayers/OtherPlayers8.visible = true
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


	acc.x = 0
	
	if is_on_floor():
		coyote_timer.start()
	if not coyote_timer.is_stopped():
		jumps_left = max_jump_amount

	input_vector.x = Input.get_action_strength('right_%s' % id) - Input.get_action_strength('left_%s' % id)
	input_vector.y = Input.get_action_strength('down_%s' % id) - Input.get_action_strength('up_%s' % id)
	input_vector = input_vector.normalized()	
#	if Input.is_action_pressed('left_%s' % id):
#		acc.x = -max_acceleration
#	if Input.is_action_pressed('right_%s' % id):
#		acc.x = max_acceleration
#	if Input.is_action_pressed('up_%s' % id):
#		acc.y = -max_acceleration
#	if Input.is_action_pressed('down_%s' % id):
#		acc.y = max_acceleration

		
	velocity = move_and_slide(velocity)
	
	# Check for ground jumps when we can hold jump
	if can_hold_jump:
		if Input.is_action_pressed('jump_%s' % id):
			# Dont use double jump when holding down
			if is_on_floor():
				jump()
	
	# Check for ground jumps when we cannot hold jump
	if not can_hold_jump:
		if not jump_buffer_timer.is_stopped() and is_on_floor():
			jump()
	
	# Check for jumps in the air
	if Input.is_action_just_pressed('jump_%s' % id):
		holding_jump = true
		jump_buffer_timer.start()
		
		# Only jump in the air when press the button down, code above already jumps when we are grounded
		if not is_on_floor():
			jump()
		
	
	if Input.is_action_just_released('jump_%s' % id):
		holding_jump = false
	
	
	var gravity = default_gravity
	
	if vel.y > 0: # If we are falling
		gravity *= falling_gravity_multiplier
		
	if not holding_jump and vel.y < 0: # if we released jump and are still rising
		if not jumps_left < max_jump_amount - 1: # Always jump to max height when we are using a double jump
			gravity *= release_gravity_multiplier # multiply the gravity so we have a lower jump
	
	acc.y = -gravity
	vel.x *= 1 / (1 + (delta * friction))
	
	vel += acc * delta
	vel = move_and_slide(vel, Vector2.UP)
	
func calculate_gravity(max_jump_height, jump_duration):
	# Calculates the desired gravity by looking at our jump height and jump duration
	# Formula is from this video https://www.youtube.com/watch?v=hG9SzQxaCm8
	return (-2 * max_jump_height) / pow(jump_duration, 2)


func calculate_jump_velocity(max_jump_height, jump_duration):
	# Calculates the desired jump velocity by lookihg at our jump height and jump duration
	return (2 * max_jump_height) / (jump_duration)


func calculate_jump_velocity2(max_jump_height, gravity):
	# Calculates jump velocity from jump height and gravity
	# formula from 
	# https://sciencing.com/acceleration-velocity-distance-7779124.html#:~:text=in%20every%20step.-,Starting%20from%3A,-v%5E2%3Du
	return sqrt(-2 * gravity * max_jump_height)


func calculate_release_gravity_multiplier(jump_velocity, min_jump_height):
	# Calculates the gravity when the key is released based on the minimum jump height and jump velocity
	# Formula is from this website https://sciencing.com/acceleration-velocity-distance-7779124.html
	var release_gravity = 0 - pow(jump_velocity, 2) / (2 * min_jump_height)
	return release_gravity / default_gravity


func calculate_friction(time_to_max):
	# Formula from https://www.reddit.com/r/gamedev/comments/bdbery/comment/ekxw9g4/?utm_source=share&utm_medium=web2x&context=3
	# this friction will hit 90% of max speed after the accel time
	return 1 - (2.30259 / time_to_max)


func calculate_speed(max_speed, friction):
	# Formula from https://www.reddit.com/r/gamedev/comments/bdbery/comment/ekxw9g4/?utm_source=share&utm_medium=web2x&context=3	
	return (max_speed / friction) - max_speed


func jump():
	if jumps_left == max_jump_amount and coyote_timer.is_stopped():
		# Your first jump must be used when on the ground
		# If you fall off the ground and then jump you will be using you second jump
		print("no")
		jumps_left -= 1
		
	if jumps_left > 0:
		if jumps_left < max_jump_amount: # If we are double jumping
			vel.y = -double_jump_velocity
		else:
			vel.y = -jump_velocity
		jumps_left -= 1
	
	
	coyote_timer.stop()


func set_max_jump_height(value):
	max_jump_height = value
	
	default_gravity = calculate_gravity(max_jump_height, jump_duration)
	jump_velocity = calculate_jump_velocity(max_jump_height, jump_duration)
	double_jump_velocity = calculate_jump_velocity2(double_jump_height, default_gravity)
	release_gravity_multiplier = calculate_release_gravity_multiplier(jump_velocity, min_jump_height)


func set_jump_duration(value):
	jump_duration = value
	
	default_gravity = calculate_gravity(max_jump_height, jump_duration)
	jump_velocity = calculate_jump_velocity(max_jump_height, jump_duration)
	double_jump_velocity = calculate_jump_velocity2(double_jump_height, default_gravity)
	release_gravity_multiplier = calculate_release_gravity_multiplier(jump_velocity, min_jump_height)


func set_min_jump_height(value):
	min_jump_height = value
	release_gravity_multiplier = calculate_release_gravity_multiplier(jump_velocity, min_jump_height)


func set_double_jump_height(value):
	double_jump_height = value
	double_jump_velocity = calculate_jump_velocity2(double_jump_height, default_gravity)
	
	
