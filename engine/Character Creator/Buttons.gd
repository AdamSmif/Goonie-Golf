extends HBoxContainer


export(String) var buttonName
signal change(direction)
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = buttonName
	pass # Replace with function body.


func _on_Left_pressed():
	emit_signal("change", -1)
	print("signal left")
	pass


func _on_Right_pressed():
	emit_signal("change", -1)
	print("signal right")
	pass
