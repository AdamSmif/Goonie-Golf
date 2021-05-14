extends KinematicBody2D


export var speed = 300
var velocity = Vector2()
var knockback_vector = Vector2.ZERO

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(0, speed * delta))

func bounce():
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Hitbox_area_entered(area):
	queue_free()
