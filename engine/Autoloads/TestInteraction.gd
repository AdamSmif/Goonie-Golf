extends Area2D


export(String, FILE, "*.tscn") var Card

func _ready():
	set_visible(false)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		print("card here!")
		set_visible(Card)

		
func set_visible(is_visible):
	queue_free()
