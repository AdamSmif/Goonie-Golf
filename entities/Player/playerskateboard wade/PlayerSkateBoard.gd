extends KinematicBody2D

export var id = 1
export (int) var speed = 200
export var MAX_SPEED = 250
export  var ACCELERATION = 150

var motion = Vector2()

# Coin Amount
var bottles_needed = 0
# Level Respawn
export(String, FILE, "*.tscn") var lose_level_world_scene
# Game Over
export(String, FILE, "*.tscn") var game_over_scene
# Next Level For Bottle Colelcting Levels
export(String, FILE, "*.tscn") var bottle_world_scene

func get_input():
	motion = Vector2()
	
	if Input.is_action_pressed('right_%s' % id):
		motion.x += 1.5
#	NTS: Pressing Left Causes Player To Stop Moving
#	if Input.is_action_pressed('left_%s' % id):
#		motion.x += 1
	if Input.is_action_pressed('down_%s' % id):
		motion.y += 1.25
	if Input.is_action_pressed('up_%s' % id):
		motion.y -= 1.25
	motion = motion.normalized() * speed

func _physics_process(delta):
	get_input()
	motion = move_and_slide(motion)
	move_and_collide(Vector2(speed * delta, 0))


func _on_PlayerStats_no_health():
	$Sprite.play("boom")
	motion.x = 0
	get_tree().change_scene("res://UI/GameOver.tscn")




func _on_Timer_timeout():
	motion.x += 1
