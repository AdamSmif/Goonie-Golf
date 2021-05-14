extends KinematicBody2D

export var id = 1
# Stats
var stats = PlayerStats

# Coin Amount
var bottles_needed = 0
# Level Respawn
# export(String, FILE, "*.tscn")
var lose_level_world_scene
# Next Level For Bottle Colelcting Levels
export(String, FILE, "*.tscn") var bottle_world_scene

export var MAX_SPEED = 75
export var ACCELERATION = 30

# Score 
var score = 0

var velocity = Vector2()
var knockback = Vector2.ZERO

func _physics_process(delta):
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


func _on_PlayerStats_no_health():
	$Sprite.play("boom")
	velocity.x = 0
	get_tree().change_scene("res://UI/PlayerKO.tscn")


func _on_Hurtbox_area_entered(area):
	stats.health -= 1
	$AnimationPlayer.play("Hit")
	$GotHitSound.play()
	knockback = Vector2.RIGHT * 150
	knockback = Vector2.LEFT * 150
	if stats.health == 0:
		$Sprite.play("boom")
		velocity.x = 0
		$GameOverTimer.start()
		get_tree().change_scene("res://UI/PlayerKO.tscn")


func _on_GameOverTimer_timeout():
	get_tree().change_scene("res://UI/PlayerKO.tscn")
