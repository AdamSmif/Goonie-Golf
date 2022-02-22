extends CanvasLayer


onready var global_vars = get_node("/root/Global")

#Variable Notes #
#var body := 0
#var head := 0
#var Eyes := 0
#var Headwear := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Headwear_change(direction):
	global_vars.changeHeadwear(direction)


func _on_head_change(direction):
	global_vars.changehead(direction)


func _on_Eyes_change(direction):
	global_vars.changeEyes(direction)


func _on_Skincolor_change(direction):
	global_vars.changeSkincolor(direction)
