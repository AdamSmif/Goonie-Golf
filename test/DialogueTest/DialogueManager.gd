extends CanvasLayer

export(String, FILE, "*.tres") var dialogue
var dialogues = []
var is_dialogue_active = false

func _input(event):
	if event.is_action_pressed("talk"):
		dialogue.play()
