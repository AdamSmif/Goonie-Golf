extends KinematicBody2D

# Player Number
export var id = 1
export(int) var speed = 80.0
onready var player_label = $Label
onready var camera = $PlayerCamera

var motion = Vector2.ZERO


func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength('right_%s' % id) - Input.get_action_strength('left_%s' % id)
	input_vector.y = Input.get_action_strength('down_%s' % id) - Input.get_action_strength('up_%s' % id)
	input_vector = input_vector.normalized()
		
	if input_vector == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("Idle")
	else:
		$AnimationTree.get("parameters/playback").travel("Walk")
		move_and_slide(input_vector * speed)
		$AnimationTree.set("parameters/Idle/blend_position", input_vector)
		$AnimationTree.set("parameters/Walk/blend_position", input_vector)

#func set_player_name ():
#	player_label.text = Server.players[int(name)]["Player_name"]
