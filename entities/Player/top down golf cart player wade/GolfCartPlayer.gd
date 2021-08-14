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
# Spawn All Players
	if Input.is_action_just_pressed("ui_accept"):
		$AllOtheerPlayers/OtherPlayers2.visible = true
		$AllOtheerPlayers/OtherPlayers3.visible = true
		$AllOtheerPlayers/OtherPlayers4.visible = true
		$AllOtheerPlayers/OtherPlayers5.visible = true
		$AllOtheerPlayers/OtherPlayers6.visible = true
		$AllOtheerPlayers/OtherPlayers7.visible = true
		$AllOtheerPlayers/OtherPlayers8.visible = true
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
	
	
	velocity = Vector2()
	if Input.is_action_pressed('right_%s' % id):
		$Sprite.flip_h = false
		$Sprite.play("idle")
		velocity.x += 1
	if Input.is_action_pressed('left_%s' % id):
		$Sprite.flip_h = true
		$Sprite.play("idle")
		velocity.x -= 1
	if Input.is_action_pressed('up_%s' % id):
		$Sprite.play("idle")
		velocity.y -= 1
	if Input.is_action_pressed('down_%s' % id):
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
	
func _on_Bottle_body_entered(_delta):
	$CoinSound.play()
	score += 1
	print(score)
