extends Control


signal scene_changed()

onready var animation_player = $AnimationPlayer
onready var black = $ColorRect

func _ready():
	yield(get_tree().create_timer(1), "timeout")
	$AnimationPlayer.play("fade")
	yield(get_tree().create_timer(2), "timeout")
	$AnimationPlayer.play_backwards("fade")
	yield(get_tree().create_timer(3), "timeout")
