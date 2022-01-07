extends KinematicBody2D

# Player Number
var id = 1

onready var stats = $Stats
var motion = Vector2()
var knockback = Vector2.ZERO

export (int) var speed = 1200
export (int) var jump_speed = -400
export (int) var gravity = 2000

var velocity = Vector2.ZERO

func get_input():
	velocity.x = 0

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_pressed('right_%s' % id):
		$Sprite.flip_h = false
		$Shadow.flip_h = false
	if Input.is_action_pressed('left_%s' % id):
		$Sprite.flip_h = true
		$Shadow.flip_h = true
	if Input.is_action_just_pressed('up_%s' % id):
		if is_on_floor():
			$Sprite.play("default")
			velocity.y = jump_speed

		if velocity.y > jump_speed: 
			$Sprite.play("default")
		else:
			$Sprite.play("default")

func _on_Hurtbox_area_entered(area):
	stats.health -= 1
	$AnimationPlayer.play("Hit")
	$HitBadGuy.play()
	knockback = Vector2.RIGHT * 150
	knockback = Vector2.LEFT * 150

func _on_Stats_no_health():
	$Sprite.play("boom")
	$ExplosionSound.play()
	set_collision_layer_bit(4,false)
	set_collision_mask_bit(0,false)
	$Hurtbox.set_collision_layer_bit(4,false)
	$Hurtbox.set_collision_mask_bit(0,false)
	$Timer.start()


