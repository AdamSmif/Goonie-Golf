extends KinematicBody2D

# Player Number
export var id = 1
# Stats
var stats = PlayerStats
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

func _ready():
	stats.connect("no_health", self, "queue_free")

func _physics_process(delta):
	velocity = Vector2()
	if Input.is_action_pressed('hider_right_%s' % id):
		$Sprite.flip_h = false
		$Sprite.play("move")
		velocity.x += 1
	if Input.is_action_pressed('hider_left_%s' % id):
		$Sprite.flip_h = true
		$Sprite.play("move")
		velocity.x -= 1
	if Input.is_action_pressed('hider_up_%s' % id):
		$Sprite.play("move")
		velocity.y -= 1
	if Input.is_action_pressed('hider_down_%s' % id):
		$Sprite.play("move")
		velocity.y += 1
	velocity = velocity.normalized() * MAX_SPEED

	
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * MAX_SPEED
		$Sprite.play()
	else:
		$Sprite.stop()
	position += velocity * delta

	velocity = move_and_slide(velocity)
	




func _on_Hurtbox_area_entered(area):
	stats.health -= 1
	$AnimationPlayer.play("Hit")
	$GotHitSound.play()
	if stats.health == 0:
		$Sprite.play("boom")
		velocity.x = 0
		$Timer.start()
		get_tree().change_scene("res://minigames/Hide And Seek/Seeker Win/SeekerWins!.tscn")


func _on_Timer_timeout():
	get_tree().change_scene(lose_level_world_scene)
