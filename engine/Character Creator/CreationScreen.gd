extends Control


onready var Body = $PlayerCreation/PlayerParts/Body
onready var SkinColor = $PlayerCreation/PlayerParts/SkinColor
onready var Eyes = $PlayerCreation/PlayerParts/Eyes
onready var Mouth = $PlayerCreation/PlayerParts/Mouth
onready var Headwear = $PlayerCreation/PlayerParts/Headwear
onready var Facialhair = $PlayerCreation/PlayerParts/FacialHair


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_btn_SkinColor_pressed():
	if SkinColor.frame == 7:
		SkinColor.frame = 0
	else:
		SkinColor.frame += 1


func _on_btn_Eyes_pressed():
	if Eyes.frame == 5:
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


func _on_btn_Facialhair_pressed():
	if Facialhair.frame == 5:
		Facialhair.frame = 0
	else:
		Facialhair.frame += 1


func _on_btn_Mouth_pressed():
	if Mouth.frame == 5:
		Mouth.frame = 0
	else:
		Mouth.frame += 1
