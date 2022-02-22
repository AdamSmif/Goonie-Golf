extends KinematicBody2D

# Player Number
var id = 2

onready var stats = $Stats
export var speed = 50
var velocity = Vector2()
var knockback = Vector2.ZERO
#-1 move left +1 move right
export var direction = -1
# true does not fall on cliff, false falls off cliff
export var detects_cliffs = true

func _ready():
	#if moving right move sprite to the right
	if direction == 1:
		$Sprite.flip_h = true
		$Shadow.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$floor_checker.enabled = detects_cliffs
	
func _physics_process(delta):
	
	# Player Control
	if Input.is_action_pressed("enemyGrow"):
		$AnimationPlayer.play("GrowEnemy")
	elif Input.is_action_pressed("enemyJump"):
		$AnimationPlayer.play("JumpEnemy")
	elif Input.is_action_pressed("enemySprint"):
		$AnimationPlayer.play("SprintEnemy")
	else:
	#Knockback
#	Causes enemy to jitter
#	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
#	knockback = move_and_slide(knockback)
	
	# moves if bumps into wall
		if is_on_wall() or not $floor_checker.is_colliding() and detects_cliffs and is_on_floor():
			direction = direction * -1
			$Sprite.flip_h = not $Sprite.flip_h
			$Shadow.flip_h = not $Shadow.flip_h
			$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction 


	#gravity
	velocity.y += 5
	
	velocity.x = speed * direction
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_top_checker_body_entered(body):
#	$Sprite.play("squashed")
	speed = 0
	set_collision_layer_bit(4,false)
	set_collision_mask_bit(0,false)
	$top_checker.set_collision_layer_bit(4,false)
	$top_checker.set_collision_mask_bit(0,false)
	$sides_checker.set_collision_layer_bit(4,false)
	$sides_checker.set_collision_mask_bit(0,false)
	$Timer.start()
	body.bounce()
	
	

func _on_sides_checker_body_entered(body):
	print("ouch!")
	body.ouch(position.x)


func _on_Timer_timeout():
	queue_free()




func _on_Hurtbox_area_entered(area):
	stats.health -= 1
	$AnimationPlayer.play("hit")
	$HitBadGuy.play()
	knockback = Vector2.RIGHT * 150
	knockback = Vector2.LEFT * 150


func _on_Stats_no_health():
	$Sprite.play("boom")
	$Shadow.play("boom")
	$ExplosionSound.play()
	speed = 0
	set_collision_layer_bit(4,false)
	set_collision_mask_bit(0,false)
	$Hurtbox.set_collision_layer_bit(4,false)
	$Hurtbox.set_collision_mask_bit(0,false)
	$Timer.start()
