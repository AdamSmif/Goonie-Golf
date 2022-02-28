extends Control


onready var Body = $PlayerCreation/Body
onready var SkinColor = $PlayerCreation/SkinColor
onready var Eyes = $PlayerCreation/Eyes
onready var Headwear = $PlayerCreation/Headwear


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btn_Body_pressed():
	pass # Replace with function body.


func _on_btn_SkinColor_pressed():
	if SkinColor.frame == 4:
		SkinColor.frame = 0
	else:
		SkinColor.frame += 1


func _on_btn_Eyes_pressed():
	if Eyes.frame == 4:
		Eyes.frame = 0
	else:
		Eyes.frame += 1


func _on_btn_Headwear_pressed():
	if Headwear.frame == 4:
		Headwear.frame = 0
	else:
		Headwear.frame += 1


func _on_btn_Enterworld_pressed():
	pass # Replace with function body.
