extends Control


onready var Body = $PlayerParts/Body
onready var SkinColor = $PlayerParts/SkinColor
onready var Eyes = $PlayerParts/Eyes
onready var Mouth = $PlayerParts/Mouth
onready var Headwear = $PlayerParts/Headwear
onready var Facialhair = $PlayerParts/FacialHair


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
	Global.PlayerPartsBody = Body.frame
	Global.PlayerPartsSkincolor = SkinColor.frame
	Global.PlayerPartsEyes = Eyes.frame
	Global.PlayerPartsMouth = Mouth.frame
	Global.PlayerPartsHeadwear = Headwear.frame
	Global.PlayerPartsFacialhair = Facialhair.frame
	get_tree().change_scene("res://test/Level1.tscn")


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
