extends Node2D

export var speed = 800

func _ready():
	randomize()
	
func _physics_process(delta):
	for area in $Areas.get_children():
		area.position.x -= speed * delta
